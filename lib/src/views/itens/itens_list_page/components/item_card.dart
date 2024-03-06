import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/item.dart';

class HostItemCard extends StatefulWidget {
  const HostItemCard({
    super.key,
    required this.hostItem,
  });

  final Item hostItem;

  @override
  State<HostItemCard> createState() => _HostItemCardState();
}

class _HostItemCardState extends State<HostItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/item_page', arguments: widget.hostItem);
      },
      onLongPress: () {
        Get.offNamed("");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 85,
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hostItem.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.displaySmall,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Ultimo valor: ${widget.hostItem.newLastValue} ${widget.hostItem.newUnits}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
