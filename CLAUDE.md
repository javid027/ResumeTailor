# ResumeTailor

ResumeTailor is a Flutter client app that lets a user upload a resume, paste a
job description, and receive an AI-tailored version of their resume with a
diff view before accepting changes. This app is a **thin client**: all resume
parsing, LLM tailoring, and document generation (PDF/DOCX) happens on a
backend API. The app's job is auth, file/text capture, presenting results,
and letting the user accept/reject individual changes.

## Architecture Rules

- **State management:** `flutter_bloc`. Use `Cubit` for simple screens, `Bloc`
  for the multi-event tailoring flow.
- **Pattern:** MVVM.
  - **View** — widget only, no business logic.
  - **ViewModel** — the Bloc/Cubit.
  - **Model** — `freezed` data classes.
- **Navigation:** `go_router`, typed route enum, redirect-based auth guard,
  `ShellRoute` for bottom nav (Home/Upload, History, Profile).
- **Networking:** `dio` with an auth interceptor. Blocs never call Dio
  directly — only through repository interfaces.
- **DI:** `get_it` + `injectable`.
- **Local persistence:** `hive` (or `drift`), used only for caching the last
  result and offline draft state. Never persist raw resume bytes beyond the
  session unless the user explicitly saves it.
- **API contract:** `openapi.yaml` (provided separately, kept at the project
  root once received) is the source of truth for every request/response shape
  in the data layer. DTO field names and types must match it exactly — do not
  rename fields for "nicer" Dart style.

## Folder Structure

Source of truth for where new files go:

```
lib/
  app/                  (MaterialApp.router, theme, go_router config)
  core/
    network/  di/  error/  utils/
  features/
    auth/                  data/ domain/ presentation/
    resume_upload/         data/ domain/ presentation/
    job_description/       data/ domain/ presentation/
    tailoring/             data/ domain/
      presentation/
        bloc/tailoring_bloc.dart, tailoring_event.dart, tailoring_state.dart
        view/tailoring_result_page.dart
        widgets/diff_view.dart, ats_score_badge.dart, section_editor.dart
    export/                data/ domain/ presentation/
    history/               data/ domain/ presentation/
    subscription/          (in_app_purchase)
```

Each `data/ domain/ presentation/` feature folder follows:
- `data/` — DTOs, Dio-backed repository implementations, data sources.
- `domain/` — repository interfaces, entities, use cases (where needed).
- `presentation/` — bloc/cubit, views, widgets.

## BLoC Design Rules

- Every Bloc/Cubit state is a sealed class via `freezed`:
  `Initial / Loading / Success / Failure` variants — no scattered boolean
  `isLoading` flags.
- Blocs depend only on abstract repository interfaces, never on data-layer
  implementations or Dio directly.
- Long-running tailoring requests emit an intermediate
  `TailoringInProgress` state and support cancellable requests.

## Error Handling

- Map backend error codes (rate limit, invalid file, LLM timeout, parsing
  failure) to specific user-facing messages — never surface raw exceptions.
- Cache the last successful result locally so the app isn't blank if the
  network drops right after a request succeeded.

## Conventions

- **Naming:** `snake_case` files, `PascalCase` types, feature-prefixed Bloc
  files (`tailoring_bloc.dart`, `tailoring_event.dart`, `tailoring_state.dart`).
  Repository interfaces live in `domain/repositories/`, named
  `<feature>_repository.dart`; implementations in `data/repositories/`,
  named `<feature>_repository_impl.dart`.
- **State class shape:** one `freezed` sealed union per Bloc/Cubit with
  explicit variants (e.g. `TailoringInitial`, `TailoringLoading`,
  `TailoringInProgress`, `TailoringSuccess`, `TailoringFailure`). No shared
  mutable fields bolted onto a single class.
- **Model shape:** one `freezed`+`json_serializable` model per `openapi.yaml`
  schema, field-for-field (name, type, nullability) — no separate DTO/entity
  split. This is a thin client with no business logic that reshapes API data,
  so a DTO→entity mapping layer would just duplicate every field name for no
  behavioral benefit; models live in `domain/models/` and are used as-is by
  data sources, repositories, and (later) blocs. Every `@freezed` class is
  declared as `sealed class X with _$X` (required by freezed 3.x's "usual
  syntax" — a plain `class` there fails to compile). `build.yaml` sets
  `explicit_to_json: true` project-wide so nested models serialize correctly.
  Request bodies with no meaningful reuse (login, register, create-tailoring,
  etc.) are passed as plain named parameters on the repository method, not
  wrapped in a request model.
- **Tests:**
  - `bloc_test` for every Bloc/Cubit: initial state, loading → success,
    loading → failure, cancel mid-request (where applicable).
  - Widget tests for the diff view (accept/reject correctness) and the ATS
    score display.
  - Test files mirror the `lib/` path under `test/`
    (e.g. `lib/features/tailoring/presentation/bloc/tailoring_bloc.dart` →
    `test/features/tailoring/presentation/bloc/tailoring_bloc_test.dart`).

## Packages

`flutter_bloc`, `freezed`, `get_it`, `injectable`, `dio`, `go_router`,
`file_picker`, `share_plus`, `hive`, `in_app_purchase`, `bloc_test`, `mocktail`

## Build Log

**Slice 1 — Project scaffold** (2026-09-16): Flutter project created; pubspec
wired with flutter_bloc, freezed, get_it/injectable, dio, go_router,
file_picker, share_plus, hive/hive_flutter, in_app_purchase, plus
build_runner/freezed/json_serializable/injectable_generator/bloc_test/mocktail
as dev deps. Folder skeleton created for every feature
(`data/domain/presentation`). DI bootstrap (`core/di/injection.dart`) and a
`go_router` skeleton (`app/router/`) with a `StatefulShellRoute` bottom-nav
shell (Upload/History/Profile), typed `AppRoute` enum, and a redirect-based
auth guard driven by an injectable `AuthSession` (`ChangeNotifier` singleton,
to be updated by the auth feature once it exists) are in place, with
placeholder screens for splash/login/register/upload/history/profile.
Verified on Flutter web: unauthenticated navigation to `/upload` correctly
redirects to `/login`.
Deviation: pinned `go_router` to `^14.8.1` instead of latest (`18.0.1`) —
18.x pulls in the new `material_ui`/`cupertino_ui` split packages, which
don't compile against this installed Flutter SDK build (3.44.8) due to an
unresolved `awaitNotRequired` symbol mismatch. 14.x avoids that dependency
chain entirely; revisit once the SDK/package skew is fixed upstream.
`openapi.yaml` copied to the project root as the data-layer source of truth.

**Slice 2 — Data layer from openapi.yaml** (2026-09-16): Built the full data
layer against `openapi.yaml` for every endpoint except `/health` (no feature
consumes it yet): auth (register/login/refresh), resumes (upload/patch),
job-descriptions (create), tailoring (create/get/accept/export), history
(list). Each feature has `domain/models` (freezed+json_serializable, field-
for-field per the contract — see Conventions), a `domain/repositories`
interface, and a `data/datasources` + `data/repositories` implementation that
wraps `DioException` into `ApiException` (`core/error/api_exception.dart`,
mirrors the `{ error: { code, message, details } }` shape). Added
`core/network/dio_client.dart` (injectable `Dio` singleton) and
`auth_interceptor.dart`, which attaches the bearer token and performs a
one-shot refresh-and-retry on 401 using the documented rotating-refresh-token
flow; `core/network/token_storage.dart` is in-memory only for now — the auth
feature (slice 3) decides on persistent storage. `TailoringRepository.export`
covers `GET /tailoring/{id}/export` (it's a tailoring endpoint per the
contract, even though `export` is a separate presentation-layer feature for
the slice 7 share-sheet work). Verified with `flutter analyze` (clean) and
unit tests: JSON round-trip tests for `TailoringResult` (incl. the
`flagged_invented` guardrail enum) and the flattened `Resume` shape, plus an
`AuthRepositoryImpl` test covering token persistence and error mapping.

**Slice 3 — Auth feature** (2026-09-16): Single app-wide `AuthBloc`
(`features/auth/presentation/bloc/`, freezed `AuthEvent`/`AuthState` unions:
`initial/loading/authenticated/unauthenticated/failure`) registered as a
singleton and provided once at the `MaterialApp` root — login/register/logout
and the router's redirect guard all read the same state, rather than each
screen owning its own Cubit. The bloc dispatches `checkRequested()` from its
own constructor to restore a session on launch.
Replaced the router's placeholder `AuthSession` with a `GoRouterRefreshStream`
that adapts `AuthBloc.stream` directly into go_router's `refreshListenable`;
the redirect switches on `authBloc.state` (fixes a slice-1 bug where the
splash route could never leave `isSplash` early-return once auth resolved).
Extended `AuthRepository` with `restoreSession()` (reads the persisted
refresh token, calls `/auth/refresh`, clears storage on rejection) and
`logout()` (local-only — there's no `/auth/logout` endpoint).
Added `core/error/error_message_mapper.dart` mapping backend error codes to
user-facing strings, per the Error Handling rule.
Real login/register/upload/history/profile views wired to the bloc; Profile
placeholder got a working "Log out" button since nothing else in the shell
could exercise that path yet.
Deviation: added `flutter_secure_storage` (not in the original package list)
to persist the refresh token across restarts — `TokenStorage`
(`core/network/token_storage.dart`) now write-through persists to secure
storage while keeping synchronous in-memory getters for the interceptor;
`main.dart` calls `hydrate()` before `runApp`. The alternative (plaintext
Hive) was rejected as a security smell for token material.
Verified against the real backend (`resume-tailor-api` running locally):
curl-verified that `/auth/register`, `/auth/login`, and `/auth/refresh`
response shapes match our models exactly, including refresh-token rotation
(reusing a rotated token correctly 401s). In the browser: unauthenticated
launch correctly redirects splash→login, client-side validation blocks empty
submits, and a real login attempt exercises the full pipeline through to a
mapped, user-facing error message — it fails only because the backend's
`CORS_ALLOWED_ORIGINS` doesn't include the Flutter web dev port, which is a
backend-config issue outside this app's scope, not a bug here.
All 17 tests passing (`flutter test`), `flutter analyze` clean.

**Slice 4 — Resume upload feature** (2026-09-16): `ResumeCubit` (a Cubit, not
a Bloc — per the architecture rule, this screen has no genuinely
multi-actor state to coordinate) with states
`initial/uploading/uploadFailure/loaded/saving/saveFailure`; `saving`/
`saveFailure` carry the in-progress `Resume` draft so the editor form stays
populated through a patch request or its failure. Registered per-screen via
`BlocProvider(create: ...)` in `UploadPage`, not as a DI singleton like
`AuthBloc` — this state doesn't need to outlive its route the way auth does,
and `StatefulShellRoute.indexedStack` already keeps the branch's widget tree
(and thus the cubit) alive across bottom-nav tab switches.
Wrapped `file_picker`'s static `FilePicker.pickFile` behind a
`ResumeFilePicker` interface (`data/datasources/resume_file_picker.dart`) —
required for bloc_test coverage, since mocktail can't stub a static method.
`ResumeEditorForm` (`presentation/widgets/`) edits every `ResumeSections`
field (contact, summary, skills, experience incl. bullets, education) with
plain `TextEditingController`s owned by the form widget itself, not the
cubit — saving always sends the full edited draft rather than diffing
against the original, since the contract's `minProperties: 1` is trivially
satisfied either way and diffing would add complexity with no behavioral
payoff here.
Extended `error_message_mapper.dart` with the `RESUME_*` codes.
Deviation: found `file_picker`'s installed version (13.1.0) has a
substantially redesigned API vs. what CLAUDE.md's package list assumed —
no more `FilePicker.platform.pickFiles()` returning a `FilePickerResult`;
now `FilePicker.pickFile(...)` returns a `PlatformFile?` directly with an
async `readAsBytes()` (works uniformly on web too, no more `withData` flag).
Verified against the real backend: logged in through the actual browser UI
end-to-end (this also confirms slice 3's CORS gap is closed — see below) and
reached the real Upload screen; curl-tested `POST /resumes` multipart shape
directly (`file` field, magic-byte validation) using a fake and then a
pdf-lib-generated PDF — both were accepted through to the text-extraction
stage (422 `RESUME_PARSE_FAILED`), confirming our multipart request shape
matches the contract. The 422 itself traces to a bug in the backend's
`pdf-parse` dependency (a "Unknown compression method in flate stream" /
"Invalid PDF structure" error, reproduced by calling `pdf-parse` directly in
Node against the generated file, with no HTTP involved) — a pre-existing
backend issue unrelated to this app, out of scope to fix here.
Deviation: added `http://localhost:8765` to the backend's local
`CORS_ALLOWED_ORIGINS` (`.env`, not committed to this repo) so the Flutter
web dev build could exercise real login end-to-end in the browser.
All 22 tests passing (`flutter test`), `flutter analyze` clean.

**Slice 5 — Job description feature** (2026-09-16): `JobDescriptionCubit`
(initial/submitting/success/failure) + a paste-text screen
(`presentation/view/job_description_page.dart`) with a 20,000-char-limited
multiline field (matching the contract's `maxLength`), and
`ExtractedResultView` (`presentation/widgets/`) showing keywords as chips,
requirements as a bulleted list, and the original text behind an
`ExpansionTile`. Added route `AppRoute.jobDescription` (`/job-description`)
as a top-level route (outside the bottom-nav shell, like login/register) —
it's a sequential wizard step, not a destination you'd want a persistent tab
for. Reachable from the Upload screen via a new "Add job description" button
on the loaded resume editor; it doesn't pass the resume forward yet since
tailoring (slice 6, not built) is what will actually need to correlate the
two IDs.
Fixed a real bug found during verification: `TokenStorage.hydrate()`
(`core/network/token_storage.dart`) could throw on web — reloading the app
after a previous session left a value in `flutter_secure_storage_web` that
it could no longer decrypt (`OperationError`, root cause upstream in that
package/browser combo) crashed startup with an uncaught async error before
`runApp()`, leaving a permanently blank page. `hydrate()` now catches any
read failure, treats it as "no session", and clears the unreadable storage —
a local storage read should never be able to take down the whole app.
Verified against the real backend: curl-confirmed `POST /job-descriptions`
response shape matches our model exactly, then walked the full flow live in
the browser — login → Upload → Job Description → paste real text → real
keyword/requirement extraction rendered → reset back to the paste form.
All 25 tests passing (`flutter test`), `flutter analyze` clean.

**Slice 6 — Tailoring feature** (2026-09-16), the core feature:
`TailoringBloc` (a true Bloc, not a Cubit — `started`/`cancelRequested`/
`bulletToggled`/`acceptRequested` are genuinely independent actors on shared
state) with states `initial/inProgress/loaded/accepting/acceptFailure/
failure`. `loaded` covers *both* `result.status == completed` (there's a
diff to review) and `== failed` (the LLM call failed server-side but is
still a normal 201 response per the contract) — that's deliberately not the
bloc's own `failure` state, which is reserved for the create *request*
itself failing (network, `LLM_DAILY_QUOTA_EXCEEDED`, validation, etc.).
Selected bullet IDs default to every `modified`-status bullet on load — you
review and uncheck what you disagree with, rather than opting in one by one.
Cancellation: `TailoringRepository.create` now takes an optional
`CancelToken`; the bloc holds one per in-flight request and
`cancelRequested` calls `.cancel()` on it, which resolves as a `DioException`
the interceptor maps to `ApiException(code: 'REQUEST_CANCELLED')` — the bloc
treats that code specially and returns to `initial` instead of `failure`,
since a user-initiated cancel isn't an error. Also gave this one call (the
only LLM-backed, genuinely slow endpoint) a 90s receive timeout instead of
the client's 30s default.
New route `AppRoute.tailoring` (`/tailoring`, top-level, outside the shell),
taking a `TailoringPageArgs(resumeId, jobDescriptionId)` via `extra`.
Threaded `resumeId` from Upload → Job Description → Tailoring: the "Add job
description" button now passes `resume.id`, and a completed extraction shows
a "Tailor my resume" button (only when a `resumeId` was actually passed in —
opening Job Description on its own still works, just without that button).
`TailoringResultPage` is a consent screen (explains what's sent to the LLM
and the anti-fabrication guardrail, requires an explicit checkbox before
dispatching `started`) that transitions into the diff review once loaded.
`DiffView` groups `perBulletDiffs` by `sectionId`, looking up the matching
`originalSections.experience[i]` for a human header ("Senior Engineer at
Acme Corp" instead of "experience-0"); `unchanged` bullets are hidden
(nothing to review); `flagged_invented` bullets are shown with a "blocked"
explanation and no toggle, since accepting one is a no-op server-side —
offering a checkbox would lie about what it does. `AtsScoreBadge` shows
before-only, or before→after with a colored delta once completed. Added
`section_editor.dart` as a **read-only** preview of the final tailored
sections, not an editor — see the file's doc comment; there's no endpoint to
persist arbitrary edits to a tailoring result, so a text-editable version
would silently discard whatever the user typed. Extended
`error_message_mapper.dart` with the `TAILORING_*`/`JOB_DESCRIPTION_*` codes.
Verified against the real backend, including actual LLM calls (Gemini):
uploaded a real DOCX resume and created a real job description, then called
`POST /tailoring` repeatedly (one attempt hit a transient 503 from Gemini,
which is exactly the `status: "failed"` + `failureReason` path the `loaded`
state's split is built for) until a `completed` result came back. That real
response surfaced a genuine display nuance our diff-grouping design didn't
originally account for: the `skills` bulletId's `original`/`suggested` are
JSON-stringified arrays (e.g. `'["Dart","Flutter"]'`) rather than prose —
still valid per the contract (just a `string`), but ugly rendered raw, so
`DiffView` now tries to `jsonDecode` and comma-join, falling back to the raw
string if that fails. Also confirmed the guardrail live: requested
`acceptedBulletIds: ["skills", "summary"]` where `summary` was
`flagged_invented`, and the server's `finalSections.summary` came back
unchanged while `finalSections.skills` was updated — exactly per spec, and
harmless in our UI since flagged bullets never get a checkbox to toggle in
the first place. Test coverage: 7 `TailoringBloc` tests (success, the
server-recorded-failed path, quota-exceeded failure, cancellation, bullet
toggling, accept success/failure) plus widget tests for `DiffView` (using
the real captured response, including the flagged-summary and
JSON-array-skills cases) and `AtsScoreBadge`, per the Testing convention.
All 40 tests passing (`flutter test`), `flutter analyze` clean.

**Slice 7 — Export feature** (2026-09-16): `ExportCubit`
(initial/exporting/failure — no lingering "success" state, since sharing
happens immediately and the natural next state is just back to initial) and
an `ExportAction` AppBar button on `TailoringResultPage`, shown whenever the
current result's `status == completed` (export works on the raw
`tailoredSections` even before accepting anything, per the contract's
"Exports the accepted finalSections if accept has been called, otherwise the
raw tailoredSections" — so it's not gated behind accept). Tapping it opens a
bottom sheet to choose PDF or Word, then fetches the bytes via the existing
`TailoringRepository.export` (built in slice 2) and hands them to
`share_plus` as an in-memory `XFile.fromData` — no temp file needed. Wrapped
`SharePlus.instance.share(...)` behind an `ExportShareService` interface
(`features/export/data/datasources/`) for the same reason as
`ResumeFilePicker` in slice 4: a static/singleton platform API can't be
mocked directly, and CLAUDE.md's testing convention requires real bloc_test
coverage.
Deviation from the planned folder structure: `export/domain/` stays empty.
The export feature has no API calls or models of its own — it reuses
`TailoringRepository.export` and the `ExportFormat` enum from the tailoring
feature (the same call the tailoring feature's data layer already exposed in
slice 2, per that slice's Build Log). Adding a parallel `ExportRepository`
that just forwards to `TailoringRepository` would be a pure wrapper with no
behavior of its own.
Verified against the real backend: curl-fetched both `?format=pdf` and
`?format=docx` for a real completed tailoring result (from slice 6's live
verification) and confirmed the response headers our
`_filenameFrom`/content-type parsing depends on match exactly —
`Content-Disposition: attachment; filename="resume.pdf"` /
`"resume.docx"` — and that the bytes are genuinely valid files (`file`
reports "PDF document, version 1.7" / "Microsoft Word 2007+", not just
right-shaped headers over garbage). Full click-through of the share sheet
itself isn't automatable here (same native-file-picker/share-sheet
limitation as slice 4's upload flow), so this is backed by `ExportCubit`
unit tests (success path verifying both the repository call and the share
call happen with the right arguments, plus the not-exportable-yet failure
path) instead of a browser walkthrough.
All 42 tests passing (`flutter test`), `flutter analyze` clean.

**Slice 8 — History feature** (2026-09-16): `HistoryCubit`
(initial/loading/loaded/loadingMore/loadMoreFailure/failure — mirrors the
loaded/saving/saveFailure pattern used elsewhere rather than a boolean
`isLoadingMore` flag on one state) paginating via the contract's
`page`/`limit`/`total`, with infinite scroll (a `NotificationListener<
ScrollNotification>` triggers `loadMore()` near the bottom) instead of a
manual "load more" button. `HistoryItemCard` reuses `AtsScoreBadge` from the
tailoring feature and shows a status chip, an "Accepted" chip when
`acceptedAt` is set, and a hand-rolled date formatter (`intl` isn't a
declared dependency and one format string didn't justify adding it).
The bigger piece of this slice was actually extending `TailoringBloc` from
slice 6, which deliberately deferred a "load existing result by id" path
since nothing needed it yet — History is exactly that consumer. Added
`TailoringEvent.loadRequested(tailoringId)` (calls `GET /tailoring/{id}`)
and turned `TailoringPageArgs` into a sealed `CreateTailoringArgs` /
`ViewTailoringArgs` pair so `TailoringResultPage` can either run the normal
consent → create flow or jump straight to loading an existing job (no
consent screen — that already happened). Tapping a history card pushes
`/tailoring` with `ViewTailoringArgs`. For an already-accepted job, the diff
view now pre-selects `acceptedBulletIds` (what was actually applied) instead
of re-defaulting to every modified bullet, which would look like unsaved
changes on a job that's already done.
Bug found and fixed during live verification: opening an already-accepted
job showed "2 change(s) selected" when only 1 bullet actually had a visible
checkbox. Cause: the server's `acceptedBulletIds` echoes back every id that
was *requested*, including a `flagged_invented` one the guardrail silently
ignored (harmless server-side, matches spec) — and the bloc was using that
raw list length for both the header count and the "Apply N change(s)"
button. Fixed by counting only ids whose diff status is actually `modified`
in `TailoringResultPage`, so the displayed count matches what's actually
toggleable.
Verified against the real backend, including a full live browser
walkthrough: curl-confirmed `GET /history`'s response shape (including that
`resume.name` really is server-synthesized, e.g. "Jane Doe" — there's no
`name` field on `Resume` itself), then logged in, opened History, saw the
real paginated list (status chips, ATS badges, the "Accepted" chip on the
job accepted back in slice 6's testing), tapped it, watched it skip the
consent screen and load straight into the diff view with the correct
pre-selection (confirming the bug above and its fix), viewed the "Final
resume" tab, and exported it as PDF — a real, successful network round-trip
to `GET /tailoring/{id}/export`.
All 50 tests passing (`flutter test`), `flutter analyze` clean.

This completes all 8 planned slices.

**Post-slice fix — dev CORS friction** (2026-09-16): User hit "No internet
connection" on register/login when running the app via plain
`flutter run -d chrome` (no fixed port). Root cause: the backend's
`CORS_ALLOWED_ORIGINS` was an exact-match list (`localhost:19006`,
`localhost:8765`, both added ad hoc during this session's own testing), but
`flutter run -d chrome` picks a new random port every launch, so the
allowlist could never keep up — every request was blocked by the browser's
CORS check before it reached the server, which Dio surfaces identically to
a real connectivity failure. Fixed in the backend
(`resume-tailor-api/src/app.ts`, not this repo): the CORS `origin` check now
accepts any `http(s)://localhost:<port>` or `127.0.0.1:<port>` origin when
`NODE_ENV === 'development'`, in addition to the explicit
`CORS_ALLOWED_ORIGINS` list; production is unaffected and still requires an
exact allowlist entry. Verified by launching the app on a throwaway random
port (54321, not on the allowlist) and completing a real registration
through the browser with no CORS error.

**Post-slice fix — Android debug build failing on every Kotlin plugin**
(2026-09-16): `flutter run`/`flutter build apk` on the Android emulator
failed in `:share_plus:compileDebugKotlin`, `:android_file_picker:
compileDebugKotlin`, and `:in_app_purchase_android:compileDebugKotlin` with
`Could not close incremental caches ... Storage for [...] is already
registered` — a bug in this Kotlin/Gradle toolchain combination's
incremental-compilation cache closer, unrelated to our app code (it
reproduced on a from-scratch build right after `flutter clean`, across
three unrelated plugins, so it isn't corrupted state we introduced). Worked
around by setting `kotlin.incremental=false` in `android/gradle.properties`
— full (non-incremental) Kotlin compilation skips the broken cache-closing
path entirely, at the cost of slower rebuilds, not correctness. Verified
with a clean `flutter build apk --debug`, which now succeeds.
Also surfaced by `flutter pub get`: "Building with plugins requires symlink
support" / Windows Developer Mode isn't enabled on this machine. Not yet
confirmed as a contributing cause here, but Flutter's Windows plugin
resolution relies on symlinks, so it's worth enabling
(`start ms-settings:developers`) if Android/Windows builds keep being flaky.

**Post-slice fix — raw LLM diagnostic shown as the failure message**
(2026-09-16): User reported a tailoring job failure screen showing "Gemini
response did not finish normally (finishReason: MAX_TOKENS)" verbatim. That
`result.failureReason` string was being rendered directly as the primary
error message in `TailoringResultPage`'s `_ResultView` — a real violation of
the Error Handling rule (map to user-facing messages, never surface raw
exceptions/internal diagnostics; this one even named the LLM provider).
`_FailureView` now takes an optional `details` param: the headline is always
a generic, friendly message ("We couldn't finish tailoring your resume this
time. This is usually temporary — please try again."), with the raw
`failureReason` tucked behind an `ExpansionTile` ("Technical details") for
anyone who wants to report a bug — not deleted, just not the first thing a
user sees. Verified live against a real job left in `status: failed` from
earlier testing (the Gemini 503 from slice 6): headline now shows the
friendly message, and expanding "Technical details" reveals the original
raw reason unchanged.

**Post-slice fix — "No internet connection" on the Android emulator**
(2026-09-16): Same symptom as the earlier CORS issue, different cause. Two
independent problems, both specific to running as a real Android app (not
web) against a `localhost` dev backend:
1. `ApiConstants.baseUrl` (`core/network/api_constants.dart`) was hardcoded
   to `http://localhost:3000/api/v1`. On the Android emulator, `localhost`
   refers to the emulator itself, not the host machine — every request
   failed to even establish a connection. Fixed by making `baseUrl` a
   platform-aware getter: `10.0.2.2` (the emulator's alias for the host
   loopback) when `!kIsWeb && defaultTargetPlatform == TargetPlatform.android`,
   `localhost` otherwise. The `!kIsWeb` guard matters — `defaultTargetPlatform`
   reflects the underlying device even when running as a web app (e.g.
   Chrome on an Android phone), where `10.0.2.2` would mean nothing.
2. Independently, Android has blocked cleartext (plain HTTP) traffic by
   default since API 28 — even after fixing the host, the OS itself would
   have silently blocked the request to `10.0.2.2:3000` (no HTTPS). Added a
   debug-build-only network security config
   (`android/app/src/debug/res/xml/network_security_config.xml`, referenced
   from `android/app/src/debug/AndroidManifest.xml`) permitting cleartext
   only to `10.0.2.2` and `localhost`. Release builds are untouched and stay
   HTTPS-only, matching the platform default.
Also added `android.permission.INTERNET` to the *main* manifest — it was
only ever declared in the debug/profile manifests (for the Flutter tool's
VM service, per their own comments), meaning a release build of this app
would have had no network permission at all and every API call would have
failed silently. Unrelated to today's bug report, but the app fundamentally
requires network access in every build mode, so this was a real latent gap.
Verified end-to-end for real, not just by reasoning about it: built and
launched the app on the actual Android emulator (`flutter run -d
emulator-5554`), then drove the UI via `adb shell input tap`/`input text`
(screenshotting with `adb exec-out screencap` between steps, since the
Browser pane tools don't reach a native Android screen) to log in with a
real account — landed on the Upload screen, confirming the fix works
against the real backend, not just in theory.

**Post-slice change — timeout bump, button-scoped loaders, password
visibility** (2026-09-17): Three requested changes, one of which turned up a
real bug:
1. `ApiConstants.connectTimeout`: `15s` → `60s`.
2. Requested as "loader in button instead of whole screen" — investigating
   *why* login/register ever showed a whole-screen loader surfaced a real
   bug, not just a style preference: `AuthBloc._onLogin`/`_onRegister` emitted
   the same `AuthState.loading()` used for the initial session-check on app
   boot, and the router's redirect treats `AuthLoading()` as "force the
   splash route" — so pressing "Log in" briefly (or not-so-briefly, on a slow
   network) yanked the user from the login form to the full-screen splash
   spinner instead of showing the button's own inline spinner, which was
   there all along but never got a chance to render. Fixed by adding a
   distinct `AuthState.submitting()` for login/register in flight — the
   redirect explicitly ignores it (`AuthSubmitting() => null`), so the form
   stays put and its existing button spinner is what the user actually sees.
   `AuthState.loading()` now means "initial boot check" only, per its own doc
   comment. Applied the same button-scoped-spinner treatment to
   `UploadPage`'s `ResumeUploading()` state, which had a similar
   whole-screen-blanking spinner with no comparable redirect bug behind it —
   just the same UX smell, so fixed for consistency. Left
   `TailoringResultPage`'s `TailoringInProgress()` full-screen state as-is:
   that one is a deliberate, distinct "processing, this may take up to a
   minute, here's why, here's Cancel" experience for a genuinely long
   operation, not a button-press waiting room.
3. Added a show/hide `IconButton` (`Icons.visibility_outlined` /
   `visibility_off_outlined`) as the password field's `suffixIcon` on both
   `LoginPage` and `RegisterPage`.
Updated `auth_bloc_test.dart` for the new `submitting` state (2 assertions).
Verified: full test suite green (50 tests) and `flutter analyze` clean.
Live in the browser: confirmed the password toggle actually reveals/hides
the typed text, and that login still completes normally end-to-end
(submits → lands on Upload). Note: with the real backend responding in
single-digit milliseconds on localhost, the moment being fixed (a
sub-frame redirect flash) is fast enough that neither screenshots nor a
`window.location.href` race could visually catch the *old* buggy transition
either — the fix is verified by tracing the exact redirect condition in
`app_router.dart` and confirming `AuthSubmitting` no longer matches it, not
by a screenshot of a fixed flash.
