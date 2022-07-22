import 'dart:io' show File;

import 'package:yolo_skin/features/acne_solution/data/datasource/helpers/detection_helper.dart';
import 'package:yolo_skin/features/acne_solution/data/datasource/helpers/image_helper.dart';
import 'package:yolo_skin/features/acne_solution/utils/exception.dart';

abstract class LocalDataSource {
  Future<File?> getImageFromCamera();
  Future<File?> getImageFromGallery();
  Future<String?> detectAcne(File image);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(
    this.imageHelper,
    this.detectionHelper,
  );

  final ImageHelper imageHelper;
  final DetectionHelper detectionHelper;

  @override
  Future<File?> getImageFromCamera() async {
    try {
      return await imageHelper.getImageFromCamera();
    } on ImageException {
      rethrow;
    }
  }

  @override
  Future<File?> getImageFromGallery() async {
    try {
      return await imageHelper.getImageFromGallery();
    } on ImageException {
      rethrow;
    }
  }

  @override
  Future<String?> detectAcne(File image) async {
    try {
      // final result = compute(detectionHelper.detectFace, image);
      // return result;
      return await detectionHelper.detectFace(image);
    } on Exception {
      rethrow;
    }
  }
}
