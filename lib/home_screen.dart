import 'package:flutter/material.dart';
import 'package:football_live/match1screen.dart';
import 'package:football_live/match2screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: ListTile(
              title: const Text("Argentina vs Italy", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Live"),
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: () {
                // Navigate to another screen when the tile is pressed
                Get.to(const Match1Screen());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7),
            child: ListTile(
              title: const Text("Brazil vs Japan", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Live"),
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: () {
                // Navigate to another screen when the tile is pressed
                Get.to(const Match2Screen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
