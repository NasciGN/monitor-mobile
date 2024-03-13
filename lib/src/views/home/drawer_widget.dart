import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultpd * 4, horizontal: defaultpd * 2),
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
                onTap: () {
                  print('Logout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.powerOff,
                      size: defaultpd * 2,
                    ),
                    const SizedBox(
                      width: defaultpd * 2,
                    ),
                    Text(
                      'Desconectar',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Spacer(),
                    const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: defaultpd * 2,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
