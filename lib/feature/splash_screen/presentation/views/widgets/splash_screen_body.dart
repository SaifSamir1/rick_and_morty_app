import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constnts/colors.dart';
import '../../../../../core/utils/constnts/strings.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/splash3.webp',
          ),
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: MyColors.myWhite,
              shadows: [
                Shadow(
                  blurRadius: 7,
                  color: MyColors.myGrey,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText(
                  'The characters of the Rick and Morty series',
                  speed: const Duration(seconds: 3),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 200,),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration( seconds: 7), () {
      Navigator.pushNamed(context, homeScreen);
    });
  }
}
