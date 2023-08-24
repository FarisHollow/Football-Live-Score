import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Match1Screen extends StatelessWidget {
  const Match1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Football'),
        backgroundColor: Colors.indigoAccent,

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Football').doc('1_football_live').snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          if (snapshot.hasData) {
            final score = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 300),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Text(
                                  score.get('match_name'),

                                  style: Theme.of(context).textTheme.headline5,
                                ),

                              ),

                            ),
                          ),
                          subtitle: Column(
                            children: [
                               Text(
                                score.get('time'), // Display the time here
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Text(
                                    score.get('score_team_a').toString(),
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Text(':', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                                  Text(
                                    score.get('score_team_b').toString(),
                                    style: Theme.of(context).textTheme.titleLarge,
                                  )

                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    score.get('team_a'),
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(

                                      score.get('team_b'),
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(score.get('full_time'),
                                  style: Theme.of(context).textTheme.headline6,)

                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("Full Time", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),)
                              ],
                              )
                            ],

                          ),




                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     FirebaseFirestore.instance
      //         .collection('Football')
      //         .doc('1_football_live')
      //         .update({'match_name': "Argentina  VS Italy", 'score_team_b': 4});
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
