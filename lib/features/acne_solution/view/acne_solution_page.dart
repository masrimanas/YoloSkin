// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:yolo_skin/features/acne_solution/data/repository/acne_repository.dart';
import 'package:yolo_skin/injection.dart' as di;
import 'package:yolo_skin/l10n/l10n.dart';

class AcneSolutionPage extends StatelessWidget {
  const AcneSolutionPage({super.key});

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
  File? _file;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: const Text('YoloSkin')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_file != null)
              Expanded(
                child: Image.file(
                  _file!,
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Gallery'),
                    onPressed: () async {
                      final result = await repo.getImageFromGallery();
                      result.fold(
                        (failure) => log(failure.message),
                        (data) => setState(() {
                          _file = data;
                        }),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('Camera'),
                    onPressed: () async {
                      final result = await repo.getImageFromCamera();
                      result.fold(
                        (failure) => log(failure.message),
                        (data) => setState(() {
                          _file = data;
                        }),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('Detect'),
                    onPressed: () async {
                      if (_file != null) {
                        final result = await repo.detectAcne(_file!);
                        result.fold(
                          (failure) => log(failure.message),
                          (data) async {
                            final result = data['result'].toString();
                            log(result);
                          },
                        );
                      }
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red[800]),
                    ),
                    onPressed: () {
                      setState(() {
                        _file = null;
                      });
                    },
                  ),
                ],
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
