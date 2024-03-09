import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemGraph extends StatefulWidget {
  const ItemGraph({super.key});

  @override
  State<ItemGraph> createState() => _ItemGraphState();
}

class _ItemGraphState extends State<ItemGraph> {
  final String itemID = Get.arguments;
  @override
  Widget build(BuildContext context) {
    String graphUrl = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(children: [
        Image.network(
          graphUrl,
          headers: const {'cookie': ""},
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        )
      ]),
    );
  }
}
