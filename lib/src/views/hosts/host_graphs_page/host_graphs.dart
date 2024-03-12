import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/hosts/host_graphs_page/components/host_graph_card.dart';
import 'package:monitor_mobile/src/views/hosts/host_graphs_page/components/host_graph_card_skeleton.dart';
import 'package:shimmer/shimmer.dart';

class HostGraphs extends StatefulWidget {
  const HostGraphs({super.key});

  @override
  State<HostGraphs> createState() => _HostGraphsState();
}

class _HostGraphsState extends State<HostGraphs> {
  String hostId = Get.arguments;
  HostGraphDataController hostGraphDataController = HostGraphDataController();
  List<Graph> hostGraphs = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchHostGraphs();
  }

  Future<void> fetchHostGraphs() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    hostGraphs = await hostGraphDataController.fetchGraphs(hostId);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: hostGraphs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed('/item_graph',
                arguments: "/chart2.php?graphid=${hostGraphs[index].graphid}");
          },
          child: HostGraphCard(
            hostGraph: hostGraphs[index],
          ),
        );
      },
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(defaultpd * 4),
      child: _isLoading
          ? Expanded(
              child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(26, 240, 240, 240),
              highlightColor: Theme.of(context).colorScheme.primary,
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      const HostGraphCardSkeleton(),
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 16,
                      )),
                  itemCount: 12),
            ))
          : hostGraphs.isNotEmpty
              ? _buildListView()
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultpd * 2),
                  child: Center(
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Este Host não possui gráficos.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Gráficos',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
