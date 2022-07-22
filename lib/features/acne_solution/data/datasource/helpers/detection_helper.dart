import 'dart:io' show File;

import 'package:pytorch_mobile/pytorch_mobile.dart' show PyTorchMobile;

class DetectionHelper {
  factory DetectionHelper() => _detectionHelper ?? DetectionHelper._instance();

  DetectionHelper._instance() {
    _detectionHelper = this;
  }

  static DetectionHelper? _detectionHelper;

  Future<String> detectFace(File image) async {
    final mean = [0.5, 0.5, 0.5];
    final std = [0.5, 0.5, 0.5];
    final _model = await PyTorchMobile.loadModel('assets/face.torchscript');
    return _model.getImagePrediction(
      image,
      244,
      244,
      'assets/labels.csv',
      mean: mean,
      std: std,
    );
  }
}
