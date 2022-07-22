import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yolo_skin/app/view/widgets/custom_bottom_sheet.dart';
import 'package:yolo_skin/app/view/widgets/custom_button.dart';
import 'package:yolo_skin/features/acne_solution/view/widgets/check_view.dart';

class DetectionResultPage extends StatelessWidget {
  const DetectionResultPage({
    super.key,
    required this.photo,
  });
  static const route = '/result-page';

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
                flex: 5,
                child: Center(
                  child: Image.asset('assets/dummy_result.jpeg'),
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'Rekomendasi Produk:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        'Produk ${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
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
                  text: 'Ganti foto',
                  color: Colors.amber,
                  onPressed: () {
                    customBottomSheet(
                      context: context,
                      child: CheckView(
                        file: photo,
                      ),
                    );
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
