import 'dart:async';
import 'dart:developer' show log;
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:yolo_skin/app/view/widgets/big_button.dart';
import 'package:yolo_skin/features/acne_solution/data/repository/acne_repository.dart';
import 'package:yolo_skin/features/acne_solution/view/pages/acne_detection.dart';
import 'package:yolo_skin/injection.dart' as di;

class CheckView extends StatefulWidget {
  const CheckView({
    super.key,
    required this.file,
  });
  final File? file;

  @override
  State<CheckView> createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  final repo = AcneRepositoryImpl(di.locator());
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Ambil foto dari',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigButton(
                icon: Icons.image_outlined,
                text: 'Gallery',
                color: Colors.grey,
                size: 100,
                onTap: () async {
                  final result = await repo.getImageFromGallery();
                  result.fold(
                    (failure) => log(failure.message),
                    (data) => setState(() {
                      _file = data;
                    }),
                  );

                  unawaited(
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      AcneDetectionPage.route,
                      arguments: _file,
                    ),
                  );
                },
              ),
              BigButton(
                icon: Icons.camera_alt_outlined,
                text: 'Camera',
                color: Colors.grey,
                size: 100,
                onTap: () async {
                  final result = await repo.getImageFromCamera();
                  result.fold(
                    (failure) => log(failure.message),
                    (data) => setState(() {
                      _file = data;
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
