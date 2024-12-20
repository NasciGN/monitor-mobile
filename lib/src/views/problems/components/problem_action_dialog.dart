import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:share_plus/share_plus.dart';

class ProblemActionDialog extends StatefulWidget {
  const ProblemActionDialog({super.key});

  @override
  State<ProblemActionDialog> createState() => _ProblemActionDialogState();
}

class _ProblemActionDialogState extends State<ProblemActionDialog> {
  String getSeverity(String severity) {
    switch (severity) {
      case '0':
        return "Não classificado";
      case '1':
        return "Informação";
      case '2':
        return "Aviso";
      case '3':
        return "Média";
      case '4':
        return "Alta";
      case '5':
        return "Desastre";
      default:
        return "";
    }
  }

  Problem problem = Get.arguments['problem'];
  Host host = Get.arguments['host'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const BeveledRectangleBorder(),
      backgroundColor: darkScdBgColor,
      alignment: Alignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Suprimir incidente',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Share.share(
                  'Incidente\nHost: ${host.name}\n${problem.name}\n\n\nDuração: ${problem.newClock}\nIP do Host: ${host.mainInterface.isNotEmpty ? host.mainInterface[0].ip : 0}\nSeveridade: ${getSeverity(problem.severity)}',
                  subject: 'Incidente');
            },
            child: Row(
              children: [
                Text(
                  'Compartilhar',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                const FaIcon(FontAwesomeIcons.arrowUpFromBracket)
              ],
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
