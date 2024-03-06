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
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.hostItem.name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displaySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 15,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "Ultimo valor:",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Spacer(),
                Text(
                  "Última checagem:",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: Text(
                      "${widget.hostItem.newLastValue} ${widget.hostItem.newUnits}",
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis),
                ),
                const Spacer(),
                Text(
                  widget.hostItem.newLastClock,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
