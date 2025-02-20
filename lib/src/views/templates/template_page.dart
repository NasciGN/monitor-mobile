import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/incidents/components/tag_section.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  final Template template = Get.arguments;
  HostsDataController hostsDataController = HostsDataController();

  ItemDataController itemDataController = ItemDataController();
  List<Host> hosts = [];
  List<Item> itens = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    _fecthHosts();
    _fetchItens();
  }

  Future<void> _fecthHosts() async {
    try {
      setState(() {});
      hosts =
          await hostsDataController.fetchHostsByTemplates(template.templateId);
    } catch (e) {
      print('Template error (_fetchHosts): $e');
    } finally {
      setState(() {});
    }
  }

  Future<void> _fetchItens() async {
    try {
      setState(() {});
      itens =
          await itemDataController.fetchItensByTempalte(template.templateId);
    } catch (e) {
      print('Template error (_fetchItens): $e');
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: _buildPadding(),
        child: _buildBody(context),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  Text _buildPageTitle(BuildContext context) {
    return Text(
      template.name,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Template',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          Get.offNamed('templates');
        },
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInformationSection(context),
        ],
      ),
    );
  }

  _buildInformationSection(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: defaultpd * 2, horizontal: defaultpd * 2),
        decoration: _buildContainerDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Informações', style: Theme.of(context).textTheme.titleMedium),
            _buildCardInformation(context, 'Nome', template.name),
            GestureDetector(
              onTap: () {
                Get.toNamed('hosts', arguments: hosts);
              },
              child: _buildCardInformation(context, 'Hosts',
                  hosts.isEmpty ? '(0)' : '(${hosts.length})'),
            ),
            _buildCardInformation(
                context, 'Itens', itens.isEmpty ? '(0)' : '(${itens.length})'),
            _buildCardInformation(context, 'Triggers',
                itens.isEmpty ? '(0)' : '(${itens.length})'),
            _buildCardInformation(context, 'Fornecedor', template.vendorName),
            _buildCardInformation(context, 'Versão', template.vendorVersion),
            TagSection(tags: template.tags),
            _buildCardInformation(context, 'Descrição', template.description),
          ],
        ));
  }

  _buildCardInformation(context, String label, String value) {
    return TemplateCardWidget(label: label, value: value);
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}

class TemplateCardWidget extends StatelessWidget {
  const TemplateCardWidget(
      {super.key, required this.label, required this.value});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpd),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
