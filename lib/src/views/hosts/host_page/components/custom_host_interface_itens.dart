import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/models/models.dart';

class CustomHostInterfacesList extends StatelessWidget {
  const CustomHostInterfacesList({
    super.key,
    required this.host,
  });

  final Host host;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interfaces',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: host.hostInterfaces.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            host.hostInterfaces[index].useIp == '1'
                                ? host.hostInterfaces[index].ip
                                : host.hostInterfaces[index].dns,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: double.infinity,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    host.hostInterfaces[index].available == "1"
                                        ? Theme.of(context).colorScheme.tertiary
                                        : Theme.of(context).colorScheme.error),
                            child: Center(
                              child: Text(
                                host.hostInterfaces[index].interfaceTypeString,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
