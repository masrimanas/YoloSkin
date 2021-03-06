import 'dart:io' show File;

import 'package:image_picker/image_picker.dart'
    show CameraDevice, ImagePicker, ImageSource;
import 'package:yolo_skin/features/acne_solution/utils/exception.dart';

class ImageHelper {
  factory ImageHelper() => _imageHelper ?? ImageHelper._instance();

  ImageHelper._instance() {
    _imageHelper = this;
  }

  static ImageHelper? _imageHelper;

  final ImagePicker _picker = ImagePicker();

  Future<File?> getImageFromCamera() async {
    final result = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 0,
      preferredCameraDevice: CameraDevice.front,
    );
    if (result != null) {
      return File(result.path);
    }
    throw const ImageException(message: 'The image file is empty');
  }

  Future<File?> getImageFromGallery() async {
    final result = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 0,
    );
    if (result != null) {
      return File(result.path);
    }
    throw const ImageException(message: 'The image file is empty');
  }
}
