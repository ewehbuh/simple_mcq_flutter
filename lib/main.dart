import 'package:flutter/material.dart';
import 'package:quiz/data/question_list.dart';
import 'package:quiz/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'The Great Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int score = 0;
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: mainColor,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text("Question ${index + 1}/ ${questions.length}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 26.0,
                          )),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 8.0,
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      questions[index].question!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    for (int i = 0; i < questions[index].answers!.length; i++)
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 18.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            color: isPressed
                                ? questions[index]
                                        .answers!
                                        .entries
                                        .toList()[i]
                                        .value
                                    ? isTrue
                                    : isWrong
                                : secondColor,
                            onPressed: () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                setState(() {
                                  btnColor = isTrue;
                                });
                              } else {
                                setState(() {
                                  btnColor = isWrong;
                                });
                              }
                            },
                            child: Text(
                                questions[index].answers!.keys.toList()[i]),
                          )),
                    // const SizedBox(
                    //   height: .0,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            onPressed: isPressed
                                ? index + 1 == questions.length
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultScreen(score)));
                                      }
                                    : () {
                                        // physics:
                                        // NeverScrollableScrollPhysics();
                                        _controller!.nextPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.linear);
                                        setState(() {
                                          isPressed = false;
                                        });
                                      }
                                : null,
                            style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              side:
                                  BorderSide(color: Colors.orange, width: 1.0),
                            ),
                            child: Text(
                              index + 1 == questions.length
                                  ? "see results"
                                  : "Next Question",
                              //  style: Textstyle(
                              //     color:Colors.white
                              //  ),
                            )),
                      ],
                    )
                  ],
                );
              }),
        ));
  }
}

class Textstyle {}
