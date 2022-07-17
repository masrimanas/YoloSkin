// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class AcneSolutionView extends StatelessWidget {
  const AcneSolutionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: Text('Semangat'),
      ),
    );
  }
}

class AcneSolutionText extends StatelessWidget {
  const AcneSolutionText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text('Bisa!', style: theme.textTheme.headline1);
  }
}
