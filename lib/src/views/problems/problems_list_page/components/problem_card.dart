import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/problems/problem_action_page/problem_action.dart';

class HostProblemCard extends StatefulWidget {
  const HostProblemCard({
    super.key,
    required this.hostProblem,
    required this.host,
  });
  final Host host;
  final Problem hostProblem;

  @override
  State<HostProblemCard> createState() => _HostProblemCardState();
}

class _HostProblemCardState extends State<HostProblemCard> {
  Color? getBgColor(String severity) {
    switch (severity) {
      case '0':
        return notClassified["bgColor"];
      case '1':
        return information["bgColor"];
      case '2':
        return warning["bgColor"];
      case '3':
        return average["bgColor"];
      case '4':
        return high["bgColor"];
      case '5':
        return disaster["bgColor"];
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.dialog(const ProblemActionDialog(),
              arguments: {'problem': widget.hostProblem, 'host': widget.host});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 95,
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 5,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: getBgColor(widget.hostProblem.severity),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.hostProblem.name,
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          widget.hostProblem.newClock,
                          style: Theme.of(context).textTheme.labelSmall,
                        ))
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
