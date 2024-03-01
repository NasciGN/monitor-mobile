import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      margin: const EdgeInsets.all(1),
      child: Text(
        'Monitor \nMobile',
        textAlign: TextAlign.center,
        style: _buildTextStyle(),
      ),
    );
  }

  _buildTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      letterSpacing: 8 / 4,
    );
  }
}
