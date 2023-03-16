import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/main.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color secondColor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Congratulations",
                style: TextStyle(color: Colors.white, fontSize: 38.0)),
            SizedBox(height: 20.0),
            Text("Your score is:",
                style: TextStyle(color: Colors.white, fontSize: 28.0)),
            SizedBox(height: 50.0),
            Text("${widget.score}",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 80.0,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 60.0,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)));
                },
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("Repeat the Quiz"))
          ],
        ),
      ),
    );
  }
}
