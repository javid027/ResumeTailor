enum AppRoute {
  splash('/splash'),
  login('/login'),
  register('/register'),
  upload('/upload'),
  jobDescription('/job-description'),
  tailoring('/tailoring'),
  history('/history'),
  profile('/profile');

  const AppRoute(this.path);

  final String path;
}
