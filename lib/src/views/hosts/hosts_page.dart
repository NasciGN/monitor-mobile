import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/widget/drawer_widget.dart';
import 'package:monitor_mobile/src/views/hosts/components/host_card.dart';
import 'package:shimmer/shimmer.dart';
import 'components/host_card_skeleton.dart';

class HostsPage extends StatefulWidget {
  const HostsPage({super.key});

  @override
  State<HostsPage> createState() => _HostsPageState();
}

class _HostsPageState extends State<HostsPage> {
  final GetData getData = GetData();
  final HostsDataController hostsDataController = HostsDataController();
  List<Host> hosts = [];
  List<Host> searchHosts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHosts();
  }

  Future<void> _fetchHosts() async {
    setState(() {
      isLoading = true;
    });
    try {
      hosts = await hostsDataController.fetchHosts();
      setState(() {
        searchHosts = List.from(hosts);
        isLoading = false;
      });
    } catch (e) {
      print('Erro ao atribuir as listas de hosts para a lista de pesquisa: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _searchData(String query) {
    if (mounted) {
      setState(() {
        searchHosts = hostsDataController.searchHostsFilter(query, hosts);
      });
    }
  }

  Future<void> _handleRefresh() async {
    await _fetchHosts();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(context),
        drawer: const SideMenu(),
        body: RefreshIndicator(
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
        'Hosts',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  _buildBody() {
    return Padding(
      padding: _buildPadding(),
      child: _buildColumn(),
    );
  }

  _buildColumn() {
    return Column(
      children: [
        _buildTextField(),
        const SizedBox(
          height: 20,
        ),
        isLoading
            ? Expanded(
                child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(26, 214, 214, 214),
                highlightColor: Theme.of(context).colorScheme.primary,
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        CardHostSkeleton(context: context),
                    separatorBuilder: ((context, index) => const SizedBox(
                          height: 16,
                        )),
                    itemCount: 6),
              ))
            : searchHosts.isEmpty
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
                : _buildHostsListView()
      ],
    );
  }

  _buildHostsListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: searchHosts.length,
        itemBuilder: (context, index) {
          return HostCard(host: searchHosts[index]);
        },
      ),
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
}
