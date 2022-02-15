import 'package:flutter/material.dart';
import 'package:state_exercise/resources/strings.dart';

class InformationCard extends StatelessWidget {
  final String avgScore;
  final String rank;
  const InformationCard({Key? key, required this.avgScore, required this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: const EdgeInsets.all(0),
          color: Colors.amber,
          child: Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                const Text(information, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                Text(averageScore + ": " + avgScore),
                Text(adjustmentResult + ": " + rank),
              ],
            ),
          )),
    );
  }
}
