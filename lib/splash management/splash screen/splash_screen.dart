import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasil/splash%20management/splash%20bloc/splashscreen_cubit.dart';

import '../../home management/home screens/home.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../register/register screens/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashscreenCubit, SplashscreenState>(
      listener: (context, state) {
        if (state is OnBoardingScreenState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
              (route) => false);
        }

        if (state is RegisterScreenState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
              (route) => false);
        }

        if (state is HomeScreenState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
        }
      },
      builder: (context, state) {
        //  MySize().init(context);
        return Scaffold(
          body: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 150.0.w,
              height: 150.0.h,
            ),
          ),
        );
      },
    );
  }
}
