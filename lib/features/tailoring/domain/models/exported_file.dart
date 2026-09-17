import 'dart:typed_data';

/// A downloaded export — not part of the JSON contract, just the binary body
/// plus the filename the server suggested via `Content-Disposition`.
class ExportedFile {
  const ExportedFile({required this.bytes, required this.filename});

  final Uint8List bytes;
  final String filename;
}
