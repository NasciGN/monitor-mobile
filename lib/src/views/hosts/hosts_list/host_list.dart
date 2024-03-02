import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:monitor_mobile/src/controllers/api_controller.dart';
import 'package:monitor_mobile/src/models/host.dart';
import 'package:monitor_mobile/src/views/home/drawer_widget.dart';
import 'package:monitor_mobile/src/views/hosts/hosts_list/components/host_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchHosts();
  }

  List<Host> hosts = [];
  List<Host> searchHosts = [];
  GetData getData = GetData();
  bool isLoading = true;
  var teste;

  Future<void> _fetchHosts() async {
    setState(() {
      isLoading = true;
    });
    hosts.clear();
    String getCall =
        await rootBundle.loadString('assets/json/hosts/getHosts.json');
    final json = await jsonDecode(getCall);
    List<dynamic> data = await getData.getData(json);
    for (var host in data) {
      Host newHost = Host.fromJson(host);
      hosts.add(newHost);
    }
    await _getHostInterfaces();
    setState(() {
      searchHosts = List.from(hosts);
      isLoading = false;
    });
  }

  Future<void> _getHostInterfaces() async {
    final List<Future> futureHostInterfaces = [];
    String getCall = await rootBundle
        .loadString('assets/json/host_interface/getHostInterfaces.json');
    final json = await jsonDecode(getCall);

    for (var host in hosts) {
      json["params"]["hostids"] = host.id;
      futureHostInterfaces.add(getData.getData(json));
    }

    final List<dynamic> data = await Future.wait(futureHostInterfaces);

    for (int i = 0; i < hosts.length; i++) {
      Host host = hosts[i];
      var interfaceData = data[i];
      host.hostInterfaces = Host.interfaceFromJson(interfaceData);
    }
  }

  void _searchData(String query) {
    setState(() {
      searchHosts = hosts
          .where((element) =>
              element.host.toLowerCase().contains(query.toLowerCase()) ||
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.hostInterfaces
                  .any((element) => element.ip.contains(query)) ||
              element.hostGroups.any((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      drawer: const SideMenu(),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Dashboard',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8 * 4),
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
        isLoading && searchHosts.isEmpty
            ? _buildCircularLoading()
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

  Align _buildCircularLoading() {
    return const Align(
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  TextField _buildTextField() {
    return TextField(
      onChanged: (value) => _searchData(value),
      style: Theme.of(context).textTheme.displayMedium,
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
          style: Theme.of(context).textTheme.displayMedium,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.white), // Define a cor da borda quando não selecionado
        ),
        labelStyle: Theme.of(context).textTheme.displayMedium,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white), // Define a cor da borda quando selecionado
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }
}
