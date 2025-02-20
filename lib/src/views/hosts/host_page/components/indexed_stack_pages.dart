import 'package:flutter/material.dart';
import '../../../../models/models.dart';
import 'forms/host_infos/host_detail_form.dart';
import 'forms/host_inventory/host_inventory_form.dart';

class IndexedStackPages extends StatelessWidget {
  const IndexedStackPages({
    super.key,
    required this.selectIndex,
    required this.host,
  });

  final int selectIndex;
  final Host host;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectIndex,
      children: [HostDetailForm(host: host), HostInventoryForm(host: host)],
    );
  }
}
