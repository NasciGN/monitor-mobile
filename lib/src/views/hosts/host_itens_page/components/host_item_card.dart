import 'package:flutter/material.dart';
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
        Get.offNamed("");
      },
      onLongPress: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
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
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
