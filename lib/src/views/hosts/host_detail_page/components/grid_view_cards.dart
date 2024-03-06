import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'card_info_widget.dart';

class GridViewCards extends StatelessWidget {
  const GridViewCards({
    super.key,
    required this.itens,
    required this.problems,
  });

  final List<Item> itens;
  final List<Problem> problems;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 30,
      children: [
        GestureDetector(
          onTap: () {
            if (_buildCheckListNotEmpty(itens)) {
              Get.toNamed('/host_itens', arguments: itens);
            } else {}
          },
          child: CardInfo(
            title: 'Itens',
            theme: Theme.of(context).colorScheme.tertiary,
            number: itens.length.toString(),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (_buildCheckListNotEmpty(problems)) {
              Get.toNamed('/host_incidents', arguments: problems);
            } else {}
          },
          child: CardInfo(
            title: 'Incidentes',
            theme: Theme.of(context).colorScheme.error,
            number: problems.length.toString(),
          ),
        ),
      ],
    );
  }
}

_buildCheckListNotEmpty(List list) {
  if (list.isNotEmpty) {
    return true;
  }
}
