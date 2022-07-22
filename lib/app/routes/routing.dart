import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:yolo_skin/features/acne_solution/view/pages/acne_detection.dart';
import 'package:yolo_skin/features/acne_solution/view/pages/acne_main.dart';
import 'package:yolo_skin/features/acne_solution/view/pages/detection_result.dart';

Route<dynamic>? generatedRoute(RouteSettings settings) {
  switch (settings.name) {
    case AcneMainPage.route:
      return MaterialPageRoute(builder: (_) => const AcneMainPage());
    case AcneDetectionPage.route:
      final photo = settings.arguments! as File;
      return MaterialPageRoute(
        builder: (_) => AcneDetectionPage(
          photo: photo,
        ),
        settings: settings,
      );
    case DetectionResultPage.route:
      final photo = settings.arguments! as File;
      return MaterialPageRoute(
        builder: (_) => DetectionResultPage(
          photo: photo,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page Not Found!'),
          ),
        ),
      );
  }
}
