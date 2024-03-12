import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';

class HostGraphCardSkeleton extends StatelessWidget {
  const HostGraphCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(defaultpd),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Container(
          height: 20,
          width: 250,
          color: Theme.of(context).colorScheme.primary,
        ),
        const Spacer(),
        Container(
          height: 20,
          width: 40,
          color: Theme.of(context).colorScheme.primary,
        )
      ]),
    );
  }
}
