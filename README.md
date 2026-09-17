# ResumeTailor

A Flutter client that lets a user upload a resume, paste a job description,
and get an AI-tailored version back with a diff view before accepting any
change. It's a **thin client** — parsing, LLM tailoring, and PDF/DOCX
generation all happen on the backend API (`resume-tailor-api`, a sibling
project). This app handles auth, file/text capture, and presenting +
reviewing results.

For architecture rules, folder structure, coding conventions, and a
slice-by-slice build log (including every bug found and fixed along the
way), see **[CLAUDE.md](CLAUDE.md)** — that file is the source of truth for
how this codebase is put together. This README is just "how do I get it
running."

## Prerequisites

- Flutter 3.44.x (stable channel), Dart SDK `^3.12.2` (see `pubspec.yaml`).
- The backend running locally: `../resume-tailor-api` (`npm run dev`), which
  needs Postgres up and a valid `.env` (see that project's own README/
  `.env.example`). This app always expects the API at `/api/v1` on port
  `3000` on whatever host it resolves (see **Running on a physical device**
  below) — there's no separate staging/prod backend to point at yet.

## Setup

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

The second command generates the `*.freezed.dart` / `*.g.dart` / DI files.
Re-run it after changing anything annotated with `@freezed`, `@JsonSerializable`,
`@injectable`, `@lazySingleton`, etc.

## Running the app

Start the backend first (`../resume-tailor-api`, `npm run dev`), then pick a
target:

### Web (Chrome/Edge)

```bash
flutter run -d chrome --web-port 8765
```

The backend's local dev CORS policy accepts any `localhost`/`127.0.0.1`
origin automatically (see that project), so any port works — `8765` isn't
required, just a habit from earlier testing.

### Windows desktop

```bash
flutter run -d windows
```

### Android emulator

```bash
flutter run -d <emulator-device-id>
```

No extra flags needed — `ApiConstants.baseUrl` automatically resolves to
`10.0.2.2` (the emulator's alias for the host machine) on Android.

### Physical Android device

Neither `localhost` nor `10.0.2.2` reach the host machine from a real phone
— it needs the dev machine's actual LAN IP, and the phone needs to be on the
same network:

```bash
flutter run -d <device-id> --dart-define=API_HOST=192.168.x.x
```

Find your machine's LAN IP with `ipconfig` (Windows) — look for the IPv4
address under your active Wi-Fi/Ethernet adapter. If the request still
doesn't reach the backend, check that Windows Firewall allows inbound
connections to `node.exe` on port 3000.

### iOS simulator

```bash
flutter run -d <simulator-id>
```

Shares the host's network namespace like desktop/web, so plain `localhost`
already works — no extra flags needed. (Not tested on this machine — there's
no macOS host here — but nothing in `ApiConstants` special-cases iOS, so it
should behave like desktop/web.)

## Testing

```bash
flutter test
flutter analyze
```

Every Bloc/Cubit has `bloc_test` coverage (initial state, success, failure,
cancellation where applicable); the diff view and ATS score badge have
widget tests. See CLAUDE.md's Conventions section for the testing rules new
code is expected to follow.

## Known toolchain quirks

A few things in this repo work around bugs in the current Flutter/Gradle/
Kotlin toolchain combination on this machine, not app design choices:

- `go_router` is pinned to `^14.8.1`, not latest — 18.x pulls in packages
  that don't compile against this Flutter SDK build.
- `android/gradle.properties` sets `kotlin.incremental=false` — a Kotlin
  build-tools-api bug otherwise crashes `compileDebugKotlin` on every
  Kotlin-based plugin, on a clean build, unrelated to this app's code.
- The debug-only Android network security config
  (`android/app/src/debug/res/xml/network_security_config.xml`) allows
  cleartext HTTP for **all** hosts in debug builds — the dev backend isn't
  served over HTTPS, and gets addressed differently (`10.0.2.2`, `localhost`,
  or a LAN IP) depending on where the app runs from. Release builds are
  untouched and stay HTTPS-only.

Full detail on all of these, plus every other bug found during development
and how it was verified, is in CLAUDE.md's Build Log.
