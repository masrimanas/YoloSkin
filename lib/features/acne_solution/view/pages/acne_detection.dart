import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:yolo_skin/app/view/widgets/custom_button.dart';
import 'package:yolo_skin/features/acne_solution/acne_solution.dart';

class AcneDetectionPage extends StatelessWidget {
  const AcneDetectionPage({
    super.key,
    required this.photo,
  });
  static const route = '/detect-page';

  final File? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (photo != null)
              Expanded(
                flex: 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Image.asset('assets/dummy_result2.jpeg'),
                  ),
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 70,
                ),
                child: CustomButton(
                  text: 'Cek',
                  color: Colors.amber,
                  onPressed: () {
                    // ignore: inference_failure_on_function_invocation
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.popAndPushNamed(
                        context,
                        DetectionResultPage.route,
                        arguments: photo,
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
