import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/components/drawer_widget.dart';
import 'package:monitor_mobile/src/views/groups/components/group_card.dart';
import 'package:monitor_mobile/src/views/hosts/hosts_page/components/host_card_skeleton.dart';
import 'package:shimmer/shimmer.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final GroupDataController _groupDataController = GroupDataController();
  final HostsDataController _hostDataController = HostsDataController();
  List<Host> hosts = [];
  List<Group> groups = [];
  List<Group> searchGroups = [];
  bool _isLoading = false;

  Map<String, List<Host>> groupHostsMap = {};

  Future<void> _fetchGroups() async {
    try {
      setState(() {
        _isLoading = true;
      });
      List<Host> allHosts = await _hostDataController.fetchHosts();
      Map<String, List<Host>> groupedHosts = {};

      for (var host in allHosts) {
        for (var group in host.hostGroups) {
          if (!groupedHosts.containsKey(group.groupId)) {
            groupedHosts[group.groupId] = [];
          }
          groupedHosts[group.groupId]!.add(host);
        }
      }
      groupHostsMap = groupedHosts;
      groups = groupedHosts.keys.map((groupId) {
        final groupName = allHosts
            .firstWhere((host) =>
                host.hostGroups.any((group) => group.groupId == groupId))
            .hostGroups
            .firstWhere((group) => group.groupId == groupId)
            .name;
        return Group(groupId: groupId, name: groupName, flags: '', uuid: '');
      }).toList();
      setState(() {
        searchGroups = List.from(groups);
      });
    } catch (e) {
      print('Groups error (_fetchGroups): $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchGroups();
  }

  void _searchData(String query) {
    if (mounted) {
      setState(() {
        searchGroups = _groupDataController.searchGroupsFilter(query, groups);
      });
    }
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
            child: _buildBody(context), onRefresh: () => _fetchGroups()),
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
        'Grupos de Hosts',
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
            : groups.isEmpty
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
                : _buildGroupListView(),
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

  _buildGroupListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: searchGroups.length,
        itemBuilder: (context, index) {
          final group = searchGroups[index];
          final hostsForGroup = groupHostsMap[group.groupId] ?? [];
          return GestureDetector(
            onTap: () {
              Get.toNamed('hosts', arguments: hostsForGroup);
            },
            child: GroupCard(group: group, hostsForGroup: hostsForGroup),
          );
        },
      ),
    );
  }
}
