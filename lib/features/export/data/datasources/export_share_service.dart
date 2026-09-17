import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import '../../../tailoring/domain/models/exported_file.dart';
import '../../../tailoring/domain/repositories/tailoring_repository.dart';

/// Wraps `share_plus`'s static/singleton API so `ExportCubit` can be unit
/// tested — same reasoning as `ResumeFilePicker` for `file_picker`.
abstract class ExportShareService {
  Future<void> share(ExportedFile file, ExportFormat format);
}

@LazySingleton(as: ExportShareService)
class SharePlusExportShareService implements ExportShareService {
  @override
  Future<void> share(ExportedFile file, ExportFormat format) async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile.fromData(file.bytes, name: file.filename, mimeType: _mimeTypeFor(format))],
        fileNameOverrides: [file.filename],
      ),
    );
  }

  String _mimeTypeFor(ExportFormat format) => switch (format) {
        ExportFormat.pdf => 'application/pdf',
        ExportFormat.docx =>
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      };
}
