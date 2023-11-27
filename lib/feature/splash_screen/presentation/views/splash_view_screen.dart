
import 'package:charachters_info_app/feature/splash_screen/presentation/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SplashViewBody(),
    );
  }
}
