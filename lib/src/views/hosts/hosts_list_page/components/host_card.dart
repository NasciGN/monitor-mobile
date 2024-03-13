import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/host.dart';

class HostCard extends StatefulWidget {
  const HostCard({
    super.key,
    required this.host,
  });

  final Host host;

  @override
  State<HostCard> createState() => _HostCardState();
}

class _HostCardState extends State<HostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/host_page", arguments: widget.host);
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
                    widget.host.name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displaySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                widget.host.hostInterfaces
                        .any((element) => element.available.contains('1'))
                    ? Text(
                        'Ativo',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    : Text('Inativo',
                        style: Theme.of(context).textTheme.displaySmall)
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.host.hostInterfaces.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: widget.host.hostInterfaces.any((element) =>
                                    element.available.contains('1'))
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                                widget
                                    .host.mainInterface[0].interfaceTypeString,
                                style:
                                    Theme.of(context).textTheme.displaySmall)),
                      )
                    : const SizedBox.shrink(),
                const Spacer(),
                widget.host.mainInterface.isNotEmpty
                    ? Text(
                        widget.host.mainInterface[0].useIp == '1'
                            ? widget.host.mainInterface[0].ip
                            : widget.host.mainInterface[0].dns,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
