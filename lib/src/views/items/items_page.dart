import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';

import 'components/item_card.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  ItemDataController itemDataController = ItemDataController();
  final List<Item> items = Get.arguments;
  List<Item> searchItens = [];

  @override
  void initState() {
    super.initState();
    searchItens = items;
  }

  void _searchData(String query) {
    setState(() {
      searchItens = itemDataController.searchItensFilter(query, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: _buildAppBar(context),
          body: Padding(
            padding: _buildPadding(),
            child: _buildBody(),
          )),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

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
    return Column(
      children: [
        _buildTextField(),
        const SizedBox(
          height: 20,
        ),
        items.isNotEmpty
            ? _buildHostItensListView()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultpd * 2),
                child: Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      'Esse Host não possui itens ativos',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              )
      ],
    );
  }

  _buildHostItensListView() {
    return searchItens.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: searchItens.length,
              itemBuilder: (context, index) {
                return HostItemCard(
                  hostItem: searchItens[index],
                );
              },
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultpd * 2),
            child: Center(
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  'Nenhum item ativo encontrado neste Host.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
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
}
