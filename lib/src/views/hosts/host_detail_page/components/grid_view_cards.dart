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
      crossAxisSpacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/host_itens', arguments: itens);
          },
          child: CardInfo(
            title: 'Itens',
            theme: Theme.of(context).colorScheme.tertiary,
            number: itens.length.toString(),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/host_incidents', arguments: problems);
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
