import '../models/job_description.dart';

abstract class JobDescriptionRepository {
  Future<JobDescription> create({required String rawText});
}
