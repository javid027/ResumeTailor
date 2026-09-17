import 'api_exception.dart';

/// Maps a backend error `code` to a user-facing message. Extend this as new
/// slices introduce new codes — see openapi.yaml for the authoritative list.
String userMessageFor(ApiException e) => switch (e.code) {
      'AUTH_INVALID_CREDENTIALS' => 'Incorrect email or password.',
      'AUTH_EMAIL_TAKEN' => 'An account with that email already exists.',
      'AUTH_INVALID_REFRESH_TOKEN' => 'Your session has expired. Please log in again.',
      'AUTH_UNAUTHORIZED' => 'Please log in to continue.',
      'VALIDATION_ERROR' => 'Please check your details and try again.',
      'RESUME_FILE_REQUIRED' => 'Choose a resume file to upload.',
      'RESUME_INVALID_FILE_TYPE' => 'Please upload a PDF or DOCX file.',
      'RESUME_FILE_TOO_LARGE' => 'That file is too large — the limit is 5MB.',
      'RESUME_PARSE_FAILED' =>
        "We couldn't read the text in that file. Try a different file.",
      'RESUME_UPLOAD_ERROR' => 'Something went wrong uploading your resume. Please try again.',
      'RESUME_NOT_FOUND' => 'That resume could not be found.',
      'RESUME_FORBIDDEN' => 'You do not have access to that resume.',
      'JOB_DESCRIPTION_NOT_FOUND' => 'That job description could not be found.',
      'JOB_DESCRIPTION_FORBIDDEN' => 'You do not have access to that job description.',
      'LLM_DAILY_QUOTA_EXCEEDED' =>
        "You've reached today's tailoring limit. Please try again tomorrow.",
      'TAILORING_NOT_COMPLETED' => 'This tailoring job is not finished yet.',
      'TAILORING_NOT_EXPORTABLE' => 'There is nothing to export for this tailoring job yet.',
      'TAILORING_NOT_FOUND' => 'That tailoring result could not be found.',
      'TAILORING_FORBIDDEN' => 'You do not have access to that tailoring result.',
      'NETWORK_TIMEOUT' => 'The request timed out. Check your connection and try again.',
      'NETWORK_UNAVAILABLE' => 'No internet connection.',
      _ => e.message.isNotEmpty ? e.message : 'Something went wrong. Please try again.',
    };
