import 'package:flutter/material.dart';

import 'widget/splash_body_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBodyWidget(),
    );
  }
}
