import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/host.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/card_info_widget.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/host_details/host_detail_form.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/host_inventory/host_inventory_form.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final Host host = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.offNamed('/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageTitle(context),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 220,
                width: double.infinity,
                decoration: _buildContainerDecoration(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCardTitle(context, 'Geral'),
                      _buildGridView(context),
                    ]),
              ),
              Container(
                width: double.infinity,
                decoration: _buildContainerDecoration(context),
                child: HostDetailForm(
                  host: host,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: _buildContainerDecoration(context),
                child: HostInventoryForm(host: host),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _buildPageTitle(BuildContext context) {
    return Text(
      host.name,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Text _buildCardTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Expanded _buildGridView(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 30,
        children: [
          GestureDetector(
            onTap: () {},
            child: CardInfo(
                title: 'Itens', theme: Theme.of(context).colorScheme.tertiary),
          ),
          GestureDetector(
            onTap: () {},
            child: CardInfo(
                title: 'Incidentes',
                theme: Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
