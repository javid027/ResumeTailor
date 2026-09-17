import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

class PickedResumeFile {
  const PickedResumeFile({required this.bytes, required this.fileName});

  final Uint8List bytes;
  final String fileName;
}

/// Thin wrapper around the static `FilePicker` API so `ResumeCubit` can be
/// unit tested — a static method can't be mocked directly.
abstract class ResumeFilePicker {
  Future<PickedResumeFile?> pickResumeFile();
}

@LazySingleton(as: ResumeFilePicker)
class PlatformResumeFilePicker implements ResumeFilePicker {
  static const _allowedExtensions = ['pdf', 'docx'];

  @override
  Future<PickedResumeFile?> pickResumeFile() async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
    );
    if (file == null) return null;

    final bytes = await file.readAsBytes();
    return PickedResumeFile(bytes: bytes, fileName: file.name);
  }
}
