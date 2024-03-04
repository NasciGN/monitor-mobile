import 'package:flutter/material.dart';
import 'card_info_widget.dart';

class GridViewCards extends StatelessWidget {
  const GridViewCards({
    super.key,
    required this.numberOfItens,
    required this.numberOfIncidents,
  });

  final String numberOfItens;
  final String numberOfIncidents;
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
          onTap: () {},
          child: CardInfo(
            title: 'Itens',
            theme: Theme.of(context).colorScheme.tertiary,
            number: numberOfItens,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: CardInfo(
            title: 'Incidentes',
            theme: Theme.of(context).colorScheme.error,
            number: numberOfIncidents,
          ),
        ),
      ],
    );
  }
}
