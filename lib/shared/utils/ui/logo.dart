import 'package:flutter/material.dart';

class LogoAsset extends StatelessWidget {
  const LogoAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return         Container(
      child: Image.asset(
        'assets/images/logo.png',
        width: 100,
        height: 54,
      ),
    );
  }
}
