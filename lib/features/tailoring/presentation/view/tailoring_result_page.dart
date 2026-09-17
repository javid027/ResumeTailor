import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../export/presentation/widgets/export_action.dart';
import '../../domain/models/bullet_diff.dart';
import '../../domain/models/tailoring_result.dart';
import '../bloc/tailoring_bloc.dart';
import '../bloc/tailoring_event.dart';
import '../bloc/tailoring_state.dart';
import '../widgets/ats_score_badge.dart';
import '../widgets/diff_view.dart';
import '../widgets/section_editor.dart';

/// Either create a new tailoring job from a resume + job description, or
/// view an existing one by id (e.g. opened from History).
sealed class TailoringPageArgs {
  const TailoringPageArgs();
}

class CreateTailoringArgs extends TailoringPageArgs {
  const CreateTailoringArgs({required this.resumeId, required this.jobDescriptionId});

  final String resumeId;
  final String jobDescriptionId;
}

class ViewTailoringArgs extends TailoringPageArgs {
  const ViewTailoringArgs({required this.tailoringId});

  final String tailoringId;
}

class TailoringResultPage extends StatelessWidget {
  const TailoringResultPage({super.key, required this.args});

  final TailoringPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = getIt<TailoringBloc>();
        if (args case ViewTailoringArgs(:final tailoringId)) {
          bloc.add(TailoringEvent.loadRequested(tailoringId));
        }
        return bloc;
      },
      child: _TailoringView(args: args),
    );
  }
}

class _TailoringView extends StatelessWidget {
  const _TailoringView({required this.args});

  final TailoringPageArgs args;

  void _startOrReload(BuildContext context) {
    final bloc = context.read<TailoringBloc>();
    switch (args) {
      case CreateTailoringArgs(:final resumeId, :final jobDescriptionId):
        bloc.add(TailoringEvent.started(resumeId: resumeId, jobDescriptionId: jobDescriptionId));
      case ViewTailoringArgs(:final tailoringId):
        bloc.add(TailoringEvent.loadRequested(tailoringId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TailoringBloc>().state;
    final exportableResult = switch (state) {
      TailoringLoaded(:final result) when result.status == TailoringStatus.completed => result,
      TailoringAccepting(:final result) when result.status == TailoringStatus.completed => result,
      TailoringAcceptFailure(:final result) when result.status == TailoringStatus.completed =>
        result,
      _ => null,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tailor Resume'),
        actions: [
          if (exportableResult != null) ExportAction(tailoringId: exportableResult.id),
        ],
      ),
      body: BlocConsumer<TailoringBloc, TailoringState>(
        listenWhen: (previous, current) => current is TailoringAcceptFailure,
        listener: (context, state) {
          final failure = state as TailoringAcceptFailure;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(failure.message)));
        },
        builder: (context, state) {
          return switch (state) {
            TailoringInitial() => args is ViewTailoringArgs
                ? const Center(child: CircularProgressIndicator())
                : _ConsentView(onConsent: () => _startOrReload(context)),
            TailoringInProgress() => _InProgressView(
                onCancel: () => context.read<TailoringBloc>().add(
                      const TailoringEvent.cancelRequested(),
                    ),
              ),
            TailoringFailure(:final message) => _FailureView(
                message: message,
                onRetry: () => _startOrReload(context),
              ),
            TailoringLoaded(:final result, :final selectedBulletIds) => _ResultView(
                result: result,
                selectedBulletIds: selectedBulletIds,
                isAccepting: false,
                onRetryFailedJob: () => _startOrReload(context),
              ),
            TailoringAccepting(:final result, :final selectedBulletIds) => _ResultView(
                result: result,
                selectedBulletIds: selectedBulletIds,
                isAccepting: true,
                onRetryFailedJob: () => _startOrReload(context),
              ),
            TailoringAcceptFailure(:final result, :final selectedBulletIds) => _ResultView(
                result: result,
                selectedBulletIds: selectedBulletIds,
                isAccepting: false,
                onRetryFailedJob: () => _startOrReload(context),
              ),
          };
        },
      ),
    );
  }
}

class _ConsentView extends StatefulWidget {
  const _ConsentView({required this.onConsent});

  final VoidCallback onConsent;

  @override
  State<_ConsentView> createState() => _ConsentViewState();
}

class _ConsentViewState extends State<_ConsentView> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Before we tailor your resume', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              const Text(
                'Your resume text and this job description will be sent to an AI '
                'service to suggest a tailored summary, bullet rewrites, and a '
                'skills selection.',
              ),
              const SizedBox(height: 8),
              const Text(
                "Every suggestion is checked against your original resume — "
                "anything that introduces a company, tool, number, or "
                "achievement you didn't already have is automatically blocked, "
                "never applied. Nothing changes until you review and accept it.",
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                value: _agreed,
                onChanged: (value) => setState(() => _agreed = value ?? false),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('I understand and consent to sending my resume to the AI service.'),
              ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: _agreed ? widget.onConsent : null,
                child: const Text('Tailor my resume'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InProgressView extends StatelessWidget {
  const _InProgressView({required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          const Text('Tailoring your resume...'),
          const SizedBox(height: 4),
          const Text('This can take up to a minute.', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: onCancel, child: const Text('Cancel')),
        ],
      ),
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({required this.message, this.details, required this.onRetry});

  final String message;

  /// Raw, technical diagnostic (e.g. the server's `failureReason` for a
  /// failed LLM call) — never shown as the headline message, only tucked
  /// behind an expandable section for anyone who wants to report a bug.
  final String? details;

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
            if (details != null) ...[
              const SizedBox(height: 8),
              ExpansionTile(
                title: const Text('Technical details'),
                tilePadding: EdgeInsets.zero,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(details!, style: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultView extends StatefulWidget {
  const _ResultView({
    required this.result,
    required this.selectedBulletIds,
    required this.isAccepting,
    required this.onRetryFailedJob,
  });

  final TailoringResult result;
  final Set<String> selectedBulletIds;
  final bool isAccepting;
  final VoidCallback onRetryFailedJob;

  @override
  State<_ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<_ResultView> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;

    if (result.status == TailoringStatus.failed) {
      return _FailureView(
        message: "We couldn't finish tailoring your resume this time. "
            "This is usually temporary — please try again.",
        details: result.failureReason,
        onRetry: widget.onRetryFailedJob,
      );
    }

    final finalSections = result.finalSections;
    // selectedBulletIds can include a flagged_invented id the server echoed
    // back in acceptedBulletIds on an already-accepted job (it's ignored
    // server-side, but not scrubbed from the response) — only count ids
    // that actually correspond to a toggleable (modified) diff, so this
    // doesn't show a change the diff view never rendered a checkbox for.
    final selectedCount = result.perBulletDiffs
        .where((d) => d.status == BulletDiffStatus.modified)
        .where((d) => widget.selectedBulletIds.contains(d.bulletId))
        .length;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              AtsScoreBadge(before: result.atsScoreBefore, after: result.atsScoreAfter),
              const Spacer(),
              Text('$selectedCount change(s) selected'),
            ],
          ),
        ),
        if (result.unmatchedRequirements.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  const Text('Not addressed: '),
                  for (final requirement in result.unmatchedRequirements)
                    Chip(
                      label: Text(requirement, overflow: TextOverflow.ellipsis),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
            ),
          ),
        TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Review changes'), Tab(text: 'Final resume')],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              DiffView(
                result: result,
                selectedBulletIds: widget.selectedBulletIds,
                enabled: !widget.isAccepting,
                onToggle: (bulletId) =>
                    context.read<TailoringBloc>().add(TailoringEvent.bulletToggled(bulletId)),
              ),
              finalSections != null
                  ? SectionEditor(sections: finalSections)
                  : const Center(child: Text('Accept your changes to see the final resume.')),
            ],
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: widget.isAccepting
                ? null
                : () => context.read<TailoringBloc>().add(const TailoringEvent.acceptRequested()),
            child: widget.isAccepting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text('Apply $selectedCount change(s)'),
          ),
        ),
      ],
    );
  }
}
