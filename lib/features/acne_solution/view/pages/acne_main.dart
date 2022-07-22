// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:yolo_skin/app/view/widgets/custom_bottom_sheet.dart';
import 'package:yolo_skin/app/view/widgets/custom_button.dart';
import 'package:yolo_skin/features/acne_solution/data/repository/acne_repository.dart';
import 'package:yolo_skin/features/acne_solution/view/widgets/check_view.dart';
import 'package:yolo_skin/injection.dart' as di;

class AcneMainPage extends StatelessWidget {
  const AcneMainPage({super.key});
  static const route = '/acne-main';

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => AcneSolutionCubit(),
    //   child: const AcneSolutionView(),
    // );
    return const AcneSolutionView();
  }
}

class AcneSolutionView extends StatefulWidget {
  const AcneSolutionView({super.key});

  @override
  State<AcneSolutionView> createState() => _AcneSolutionViewState();
}

class _AcneSolutionViewState extends State<AcneSolutionView> {
  final repo = AcneRepositoryImpl(di.locator());
  File? file;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: const Text('YoloSkin')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: CustomButton(
                text: 'Cek Jerawat',
                color: Colors.amber,
                radius: 20,
                onPressed: () {
                  customBottomSheet(
                    context: context,
                    child: CheckView(
                      file: file,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AcneSolutionText extends StatelessWidget {
//   const AcneSolutionText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Text('Bisa!', style: theme.textTheme.headline1);
//   }
// }
