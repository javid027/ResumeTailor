import 'package:flutter_test/flutter_test.dart';
import 'package:resume_tailor/features/resume_upload/domain/models/resume.dart';

void main() {
  test('fromJson parses the flattened Resume shape (allOf ResumeSections)', () {
    final json = {
      'id': '11111111-1111-1111-1111-111111111111',
      'userId': '22222222-2222-2222-2222-222222222222',
      'rawFileUrl': 'internal://storage/resume.pdf',
      'createdAt': '2026-09-16T10:00:00.000Z',
      'updatedAt': '2026-09-16T10:00:00.000Z',
      'parsedContact': {'name': 'Jane Doe', 'email': 'jane@example.com', 'phone': null, 'location': null},
      'summary': 'Experienced engineer.',
      'experience': <Map<String, dynamic>>[],
      'education': <Map<String, dynamic>>[],
      'skills': ['Dart'],
    };

    final resume = Resume.fromJson(json);

    expect(resume.id, '11111111-1111-1111-1111-111111111111');
    expect(resume.parsedContact?.name, 'Jane Doe');
    expect(resume.skills, ['Dart']);
  });
}
