import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../tailoring/domain/repositories/tailoring_repository.dart';
import '../cubit/export_cubit.dart';
import '../cubit/export_state.dart';

/// An AppBar action that opens a format picker and shares the exported
/// file via the OS share sheet (falls back to a browser download on web
/// when native sharing isn't available — see `ExportShareService`).
class ExportAction extends StatelessWidget {
  const ExportAction({super.key, required this.tailoringId});

  final String tailoringId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExportCubit>(),
      child: _ExportActionButton(tailoringId: tailoringId),
    );
  }
}

class _ExportActionButton extends StatelessWidget {
  const _ExportActionButton({required this.tailoringId});

  final String tailoringId;

  void _showFormatPicker(BuildContext context) {
    final cubit = context.read<ExportCubit>();
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf_outlined),
              title: const Text('Export as PDF'),
              onTap: () {
                Navigator.of(sheetContext).pop();
                cubit.export(tailoringId, ExportFormat.pdf);
              },
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('Export as Word (.docx)'),
              onTap: () {
                Navigator.of(sheetContext).pop();
                cubit.export(tailoringId, ExportFormat.docx);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExportCubit, ExportState>(
      listenWhen: (previous, current) => current is ExportFailure,
      listener: (context, state) {
        final failure = state as ExportFailure;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(failure.message)));
      },
      builder: (context, state) {
        final isExporting = state is ExportInProgress;
        return IconButton(
          tooltip: 'Export',
          onPressed: isExporting ? null : () => _showFormatPicker(context),
          icon: isExporting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.ios_share),
        );
      },
    );
  }
}
