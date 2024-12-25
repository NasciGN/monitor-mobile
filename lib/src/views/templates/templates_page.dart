import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/components/drawer_widget.dart';
import 'package:monitor_mobile/src/views/hosts/hosts_page/components/host_card_skeleton.dart';
import 'package:shimmer/shimmer.dart';

import 'components/template_card.dart';

class TemplatesPage extends StatefulWidget {
  const TemplatesPage({super.key});

  @override
  State<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends State<TemplatesPage> {
  final TemplateDataController _templateDataController =
      TemplateDataController();
  List<Template> templates = [];
  List<Template> searchTemplates = [];
  bool _isLoading = false;

  Future<void> _fetchTemplates() async {
    try {
      setState(() {
        _isLoading = true;
      });
      templates = await _templateDataController.fetchTemplates();
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        searchTemplates = List.from(templates);
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTemplates();
  }

  void _searchData(String query) {
    if (mounted) {
      setState(() {
        searchTemplates =
            _templateDataController.searchTemplatesFilter(query, templates);
      });
    }
  }

  Future<void> _handleRefresh() async {
    _fetchTemplates();
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
            child: _buildBody(context), onRefresh: () => _handleRefresh()),
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
        'Templates',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildTextField(),
        const SizedBox(
          height: 20,
        ),
        _isLoading
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
                    itemCount: 6,
                  ),
                ),
              )
            : templates.isEmpty
                ? Expanded(
                    child: ListView(
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
                    ),
                  )
                : _buildTemplateListView(),
      ],
    );
  }

  TextField _buildTextField() {
    return TextField(
      onChanged: (value) => _searchData(value),
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: _buildTextFieldDecoration(),
    );
  }

  InputDecoration _buildTextFieldDecoration() {
    return InputDecoration(
        suffix: const FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
        ),
        label: Text(
          'Pesquisar',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }

  _buildTemplateListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: searchTemplates.length,
        itemBuilder: (context, index) {
          return TemplateCard(searchTemplates: searchTemplates[index]);
        },
      ),
    );
  }
}
