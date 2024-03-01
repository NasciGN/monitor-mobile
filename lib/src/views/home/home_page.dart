import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/controllers/api_controller.dart';
import 'package:monitor_mobile/src/models/host.dart';
import 'package:monitor_mobile/src/views/home/widgets/drawer_widget.dart';
import 'package:monitor_mobile/src/views/home/widgets/host_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchHosts();
  }

  List<Host> hosts = [];
  List<Host> searchHosts = [];
  GetData getData = GetData();
  bool isLoading = true;

  Future<void> fetchHosts() async {
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

    setState(() {
      searchHosts = List.from(hosts);

      isLoading = false;
    });
  }

  void _searchData(String query) {
    setState(() {
      searchHosts = hosts
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    print(searchHosts);
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

  AppBar _buildAppBar(BuildContext context) {
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
        TextField(
          onChanged: (value) => _searchData(value),
        ),
        isLoading && searchHosts.isNotEmpty
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: searchHosts.length,
                  itemBuilder: (context, index) {
                    return HostCard(host: searchHosts[index]);
                  },
                ),
              )
      ],
    );
  }
}
