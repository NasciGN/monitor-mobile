import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.theme,
    required this.title,
    required this.number,
  });

  final Color theme;
  final String title;
  final String number;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration:
          BoxDecoration(color: theme, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Spacer(),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: 18,
            )
          ],
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(number == '' ? '0' : number,
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
        )
      ]),
    );
  }
}
