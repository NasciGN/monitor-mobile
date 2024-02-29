import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16 * 8),
      child: _buildColumn(),
    );
  }

  _buildColumn() {
    return Column(
      children: [],
    );
  }
}
