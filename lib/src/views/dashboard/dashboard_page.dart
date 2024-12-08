import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/triggers/triggers_data_controller.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/widget/drawer_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  HostsDataController hostsDataController = HostsDataController();
  TriggerDataController triggerDataController = TriggerDataController();
  List<Host> hosts = [];
  List<Trigger> triggers = [];
  bool isLoading = false;

  Future<void> _fetchIncidents() async {
    try {
      triggers = await triggerDataController.fetchActiveTriggers();
    } catch (e) {}
  }

  Future<void> _fetchHosts() async {
    try {
      hosts = await hostsDataController.fetchHosts();
    } catch (e) {
      print('Erro ao atribuir as listas de hosts para a lista de pesquisa: $e');
    }
  }

  Future<void> _fetchData() async {
    try {
      setState(() {
        isLoading = true;
        hosts = [];
        triggers = [];
      });

      await _fetchHosts();
      await _fetchIncidents();

      setState(() {
        isLoading = false;
        hosts;
        triggers;
      });
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      drawer: const SideMenu(),
      body: Padding(
        padding: _buildPadding(),
        child: _buildBody(),
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
        'Dashboard',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  _buildBody() {
    return isLoading && hosts.isEmpty && triggers.isEmpty
        ? const Text('Carregando...')
        : SingleChildScrollView(
            child: Column(
              children: [
                _buildSection('Incidentes', _hostsBySeverity()),
                const SizedBox(
                  height: defaultpd * 2,
                ),
                _buildSection('Disponibilidade', _hostsByAvailability())
              ],
            ),
          );
  }

  _buildSection(String title, Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: defaultpd * 2, horizontal: defaultpd * 2),
      decoration: _buildContainerDecoration(context),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 10),
          child
        ],
      ),
    );
  }

  Column _hostsBySeverity() {
    int notClassified =
        triggers.where((trigger) => trigger.priority == '0').length;
    int information =
        triggers.where((trigger) => trigger.priority == '1').length;
    int warning = triggers.where((trigger) => trigger.priority == '2').length;
    int average = triggers.where((trigger) => trigger.priority == '3').length;
    int high = triggers.where((trigger) => trigger.priority == '4').length;
    int disaster = triggers.where((trigger) => trigger.priority == '5').length;
    return Column(
      children: [
        _buildIncidentRow(
            'Desastre', getSeverityColors('5')["bgColor"], disaster.toString()),
        _buildIncidentRow(
            'Alta', getSeverityColors('4')["bgColor"], high.toString()),
        _buildIncidentRow(
            'Média', getSeverityColors('3')["bgColor"], average.toString()),
        _buildIncidentRow(
            'Atenção', getSeverityColors('2')["bgColor"], warning.toString()),
        _buildIncidentRow('Informação', getSeverityColors('1')["bgColor"],
            information.toString()),
        _buildIncidentRow('Não Classificado', getSeverityColors('0')["bgColor"],
            notClassified.toString()),
      ],
    );
  }

  Column _hostsByAvailability() {
    int hostsUnknown =
        hosts.where((host) => host.activeAvailable == '0').length;
    int hostsAvailable =
        triggers.where((trigger) => trigger.priority == '1').length;
    int hostsUnavailable =
        triggers.where((trigger) => trigger.priority == '1').length;
    return Column(
      children: [
        _buildIncidentRow(
            'Disponível', availabilityAvailable, hostsAvailable.toString()),
        _buildIncidentRow('Indisponível', availabilityUnavailable,
            hostsUnavailable.toString()),
        _buildIncidentRow(
            'Desconhecido', availabilityUnknown, hostsUnknown.toString()),
        _buildIncidentRow('Total', availabilityTotal, hosts.length.toString()),
      ],
    );
  }

  Widget _buildIncidentRow(String label, Color? color, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: _buildPadding(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              count,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
