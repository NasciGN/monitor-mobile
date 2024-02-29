import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/themes/custom_dark_theme.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      color: Theme.of(context).colorScheme.secondary,
      margin: const EdgeInsets.all(1),
      child: const Column(children: [
        Text(
          'Monitor Mobile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
    );
  }
}
