import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live score app'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Football')
              .doc('1_football_live')
          // .collection('abs')
          // .doc('dfdf')
          // .collection('abs')
          // .doc('dfdf')
          // .collection('abs')
          // .doc('dfdf')
          // .collection('abs')
          // .doc('dfdf')
          // .collection('abs')
          // .doc('dfdf')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            print(snapshot.data?.data());
            if (snapshot.hasData) {
              final score = snapshot.data!;
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      score.get('match_name'),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              score.get('score_team_a').toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              score.get('team_a'),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Text('vs'),
                        Column(
                          children: [
                            Text(
                              score.get('score_team_b').toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              score.get('team_b'),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('Football')
              .doc('1_football_live')
              .update({'match_name': "ARG VS IT", 'score_team_b': 7});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}