import 'package:flutter/material.dart';
import 'package:state_exercise/resources/strings.dart';
import 'package:state_exercise/resources/widgets/information_card.dart';

class InformationScreen extends StatelessWidget {
  final String avgScore;
  final String rank;
  const InformationScreen({Key? key, required this.avgScore, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(information),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InformationCard(
          avgScore: avgScore,
          rank: rank,
        ),
      ),
    );
  }
}
