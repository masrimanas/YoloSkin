import 'dart:io' show File;

import 'package:pytorch_mobile/pytorch_mobile.dart';

class DetectionHelper {
  factory DetectionHelper() => _detectionHelper ?? DetectionHelper._instance();

  DetectionHelper._instance() {
    _detectionHelper = this;
  }

  static DetectionHelper? _detectionHelper;

  Future<String> detectFace(File image) async {
    final _model = await PyTorchMobile.loadModel('assets/face.pt');
    return _model.getImagePrediction(image, 244, 244, 'assets/labels.csv');
  }
}
