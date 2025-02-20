import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/event/event_data_controller.dart';
import 'package:monitor_mobile/src/controllers/problem/problem_data_controller.dart';

import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/components/drawer_widget.dart';
import 'package:monitor_mobile/src/views/hosts/hosts_page/components/host_card_skeleton.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'components/incident_card.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  final GetData getData = GetData();
  EventDataController eventDataController = EventDataController();
  ProblemDataController problemDataController = ProblemDataController();

  List<String> ids = [];
  List<Problem> problems = [];
  List<Event> events = [];
  List<Event> filteredEvents = [];
  bool isLoading = false;
  String selectedSeverity = '';

  @override
  void initState() {
    super.initState();
    _fetchIncidents();
    selectedSeverity = Get.arguments ?? '';
  }

  Future<void> _fetchIncidents() async {
    setState(() {
      isLoading = true;
      problems = [];
      events = [];
      ids = [];
    });

    try {
      problems = await problemDataController.fetchProblems();

      for (var problem in problems) {
        ids.add(problem.eventid);
      }

      events = await eventDataController.fetchEventsByTrigger(ids);
      _applySeverityFilter();

      setState(() {
        isLoading = false;
        problems;
        events;
      });
    } catch (e) {
      print('Error (_fetchIncidents): $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _applySeverityFilter() {
    setState(() {
      if (selectedSeverity == '') {
        filteredEvents = events;
      } else {
        filteredEvents = events
            .where((event) => event.severity == selectedSeverity)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
      drawer: const SideMenu(),
      body: Padding(
        padding: _buildPadding(),
        child: RefreshIndicator(
            child: _buildBody(context), onRefresh: () => _fetchIncidents()),
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
      iconTheme: Theme.of(context).iconTheme,
      actions: selectedSeverity.isNotEmpty
          ? [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.filterCircleXmark),
                tooltip: 'Remover filtro',
                onPressed: () {
                  setState(() {
                    selectedSeverity = '';
                    _applySeverityFilter();
                  });
                },
              ),
            ]
          : null,
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
      itemCount: filteredEvents.length,
      itemBuilder: (context, index) {
        return IncidentCard(events: filteredEvents[index]);
      },
    );
  }
}
