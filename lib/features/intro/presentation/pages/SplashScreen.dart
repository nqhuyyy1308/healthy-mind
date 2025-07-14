import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => appRouter.go('/onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.primary,
      child: Image.asset('assets/images/splash-logo.png'),
    );
  }
}
