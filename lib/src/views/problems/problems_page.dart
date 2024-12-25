import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/event/event_data_controller.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/hosts/hosts_page/components/host_card_skeleton.dart';
import 'package:monitor_mobile/src/views/incidents/components/incident_card.dart';
import 'package:shimmer/shimmer.dart';

class HostIncidentsPage extends StatefulWidget {
  const HostIncidentsPage({super.key});

  @override
  State<HostIncidentsPage> createState() => _HostIncidentsPageState();
}

class _HostIncidentsPageState extends State<HostIncidentsPage> {
  EventDataController eventDataController = EventDataController();
  List<Problem> problems = Get.arguments['problems'];
  List<Event> events = [];
  List<String> ids = [];
  Host host = Get.arguments['host'];
  bool isLoading = false;

  Future<void> _fetchIncidents() async {
    setState(() {
      isLoading = true;
      events = [];
      ids = [];
    });
    try {
      for (var problem in problems) {
        ids.add(problem.eventid);
      }
      events = await eventDataController.fetchEventsByTrigger(ids);

      setState(() {
        isLoading = false;
        problems;
        events;
      });
    } catch (e) {
      print('Incidents error (_fetchIncidents): $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  initState() {
    super.initState();
    _fetchIncidents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: _buildPadding(),
        child: _buildBody(context),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        'Incidentes',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          }),
    );
  }

  _buildBody(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: const Color.fromARGB(26, 214, 214, 214),
            highlightColor: Theme.of(context).colorScheme.primary,
            child: ListView.separated(
              itemBuilder: (context, index) => CardHostSkeleton(
                context: context,
              ),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 16,
                  )),
              itemCount: 6,
            ),
          )
        : events.isEmpty
            ? ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: defaultpd * 10,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.boxOpen,
                        size: defaultpd * 4,
                        color: Colors.white70,
                      ),
                      Text(
                        'Sem dados encontrados.',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              )
            : _buildIncidentListView();
  }

  _buildIncidentListView() {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return IncidentCard(events: events[index]);
      },
    );
  }
}
