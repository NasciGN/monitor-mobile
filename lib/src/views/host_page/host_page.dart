import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/host.dart';
import 'package:monitor_mobile/src/views/host_page/widgets/card_info_widget.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

final Host host = Get.arguments;

class _HostPageState extends State<HostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text(
                host.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
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
                      Text(
                        'Geral',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Expanded(
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
                                  title: 'Itens',
                                  theme:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CardInfo(
                                  title: 'Incidentes',
                                  theme: Theme.of(context).colorScheme.error),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 1000,
                width: double.infinity,
                decoration: _buildContainerDecoration(context),
              )
            ],
          ),
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
