class ImageException implements Exception {
  const ImageException({
    required this.message,
  });
  final String message;
}
