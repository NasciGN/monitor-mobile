import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/problems/components/problem_card.dart';

class ProblemsListPage extends StatefulWidget {
  const ProblemsListPage({super.key});

  @override
  State<ProblemsListPage> createState() => _ProblemsListPageState();
}

class _ProblemsListPageState extends State<ProblemsListPage> {
  List<Problem> problems = Get.arguments['problems'];
  Host host = Get.arguments['host'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
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
        'Incidentes',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          }),
    );
  }

  _buildBody() {
    return problems.isNotEmpty
        ? _buildColumn()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultpd * 2),
            child: Center(
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  'Este Host não possui incidentes ativos.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          );
  }

  _buildColumn() {
    return Column(
      children: [_buildHostItensListView()],
    );
  }

  _buildHostItensListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: problems.length,
        itemBuilder: (context, index) {
          return HostProblemCard(
            hostProblem: problems[index],
            host: host,
          );
        },
      ),
    );
  }
}
