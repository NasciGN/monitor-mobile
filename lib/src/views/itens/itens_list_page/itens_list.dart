import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/models.dart';

import 'components/item_card.dart';

class HostItensListPage extends StatefulWidget {
  const HostItensListPage({super.key});

  @override
  State<HostItensListPage> createState() => _HostItensListPageState();
}

class _HostItensListPageState extends State<HostItensListPage> {
  final List<Item> itens = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        'Itens',
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
        _buildHostItensListView()
      ],
    );
  }

  _buildHostItensListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return HostItemCard(
            hostItem: itens[index],
          );
        },
      ),
    );
  }

  TextField _buildTextField() {
    return TextField(
      // onChanged: (value) => _searchData(value),
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
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: Theme.of(context).textTheme.displayMedium,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }
}
