import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/triggers/triggers_data_controller.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/widget/drawer_widget.dart';
import 'package:monitor_mobile/src/views/hosts/components/host_card_skeleton.dart';
import 'package:shimmer/shimmer.dart';

import 'components/incident_card.dart';

class IncidentsListPage extends StatefulWidget {
  const IncidentsListPage({super.key});

  @override
  State<IncidentsListPage> createState() => _IncidentsListPageState();
}

class _IncidentsListPageState extends State<IncidentsListPage> {
  final GetData getData = GetData();
  TriggerDataController triggerDataController = TriggerDataController();
  List<Trigger> triggers = [];

  bool isLoading = false;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _fetchIncidents();
    setState(() {
      count = 0;
    });
  }

  Future<void> _fetchIncidents() async {
    setState(() {
      isLoading = true;
      triggers = [];
    });

    try {
      triggers = await triggerDataController.fetchActiveTriggers();
      setState(() {
        isLoading = false;
        triggers;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleRefresh() async {
    await _fetchIncidents();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      drawer: const SideMenu(),
      body: Padding(
        padding: _buildPadding(),
        child: RefreshIndicator(
            child: _buildBody(), onRefresh: () => _handleRefresh()),
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
    );
  }

  _buildBody() {
    return Column(
      children: [
        isLoading && triggers.isEmpty
            ? Expanded(
                child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(26, 214, 214, 214),
                highlightColor: Theme.of(context).colorScheme.primary,
                child: ListView.separated(
                    itemBuilder: (context, index) => CardHostSkeleton(
                          context: context,
                        ),
                    separatorBuilder: ((context, index) => const SizedBox(
                          height: 16,
                        )),
                    itemCount: 6),
              ))
            : _buildIncidentListView(),
      ],
    );
  }

  _buildIncidentListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: triggers.length,
        itemBuilder: (context, index) {
          return IncidentCard(trigger: triggers[index]);
        },
      ),
    );
  }
}
