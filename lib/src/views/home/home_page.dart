import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/home/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        iconTheme: Theme.of(context).iconTheme,
      ),
      drawer: const SideMenu(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: _buildPadding(),
    );
  }

  _buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(16 * 4),
      child: _buildColumn(),
    );
  }

  _buildColumn() {
    return Column(
      children: [Text('data')],
    );
  }
}
