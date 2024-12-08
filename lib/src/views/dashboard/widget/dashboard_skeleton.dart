import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/triggers/triggers_data_controller.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/dashboard/widget/drawer_widget.dart';
import 'package:shimmer/shimmer.dart';

class DashboardPageSkeleton extends StatefulWidget {
  const DashboardPageSkeleton({super.key});

  @override
  State<DashboardPageSkeleton> createState() => _DashboardPageSkeletonState();
}

class _DashboardPageSkeletonState extends State<DashboardPageSkeleton> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSection('', _hostsBySeverity()),
          const SizedBox(
            height: defaultpd * 2,
          ),
          _buildSection('', _hostsByAvailability())
        ],
      ),
    );
  }

  _buildSection(String title, Widget child) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(26, 214, 214, 214),
      highlightColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: defaultpd * 2, horizontal: defaultpd * 2),
        decoration: _buildContainerDecoration(context),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all())),
            ),
            const SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }

  Column _hostsBySeverity() {
    return Column(
      children: [
        _buildIncidentRow(),
        _buildIncidentRow(),
        _buildIncidentRow(),
        _buildIncidentRow(),
        _buildIncidentRow(),
      ],
    );
  }

  Column _hostsByAvailability() {
    return Column(
      children: [
        _buildIncidentRow(),
      ],
    );
  }

  Widget _buildIncidentRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(26, 214, 214, 214),
        highlightColor: Theme.of(context).colorScheme.primary,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: _buildPadding(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10), border: Border.all());
  }
}
