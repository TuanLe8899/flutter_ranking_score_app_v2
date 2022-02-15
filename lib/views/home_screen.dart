import 'package:flutter/material.dart';
import 'package:state_exercise/resources/strings.dart';
import 'package:state_exercise/resources/widgets/information_card.dart';
import 'package:state_exercise/resources/widgets/text_input_widget.dart';
import 'package:state_exercise/views/information_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? scoreMathController,
      scoreLiteratureController,
      scoreEnglishController;
  String avgScore = "Chưa xác định";
  String rank = "Chưa xác định";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoreMathController = TextEditingController();
    scoreLiteratureController = TextEditingController();
    scoreEnglishController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) print("State đã có rồi");
    return Scaffold(
        appBar: AppBar(
          title: const Text(studentAdjustment),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                TextInputWidget(
                    labelText: "Điểm Toán",
                    hintText: "Nhập điểm Toán",
                    controller: scoreMathController
                ),
                TextInputWidget(
                    labelText: "Điểm Văn",
                    hintText: "Nhập điểm Văn",
                    controller: scoreLiteratureController
                ),
                TextInputWidget(
                    labelText: "Điểm Anh",
                    hintText: "Nhập điểm Anh",
                    controller: scoreEnglishController
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double scoreMath = double.parse(scoreMathController!.text);
                      double scoreLiterature = double.parse(scoreLiteratureController!.text);
                      double scoreEnglish = double.parse(scoreEnglishController!.text);

                      avgScore = ((scoreMath + scoreLiterature + scoreEnglish)/3).toStringAsFixed(2);
                      rank = adjustStudent(avgScore: double.parse(avgScore)).toString();
                    });
                  },
                  child: const Text(adjustmentTitle),
                ),
                InformationCard(
                  avgScore: avgScore,
                  rank: rank,
                ),
                TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) => InformationScreen(avgScore: avgScore, rank: rank));
                    Navigator.push(context, route);
                  },
                  child: const Text(changePage),
                ),
              ],
            ),
          ),
        ),
    );
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  String adjustStudent({required double avgScore}) {
    if(avgScore < 3) rank = "Kém";
    else if(avgScore >=3 && avgScore < 5) rank = "Yếu";
    else if(avgScore >=5 && avgScore < 7.5) rank = "Trung bình";
    else if(avgScore >= 7.5 && avgScore < 8) rank = "Khá";
    else if(avgScore >= 8 && avgScore <= 9) rank = "Giỏi";
    else rank = "Xuất sắc";

    return rank;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scoreMathController!.dispose();
    scoreLiteratureController!.dispose();
    scoreEnglishController!.dispose();
  }
}
