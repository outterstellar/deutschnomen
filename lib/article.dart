import 'dart:math';

import 'package:almanca_proje/constants.dart';
import 'package:almanca_proje/main.dart';
import 'package:almanca_proje/model.dart';
import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  late int question;
  late Word currentWord;
  late List answers = ["der", "die", "das"];
  late int correctanswer;
  bool buttonsEnabled = true;
  Color firstcolor = Colors.blue;
  Color secondcolor = Colors.blue;
  Color thirdcolor = Colors.blue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Random random = Random();
    question = random.nextInt(Constants.words.length - 1);
    currentWord = Constants.words[question];
    correctanswer = answers.indexOf(currentWord.article.name) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: Center(
              child: Text(
            currentWord.word,
            style: Constants.wordTextStyle,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Bu Kelimenin Artikeli Hangi Şıkta Doğru Verilmiştir?",
            style: Constants.questionTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (buttonsEnabled == true) {
                  buttonsEnabled = false;
                  if (correctanswer == 1) {
                    correctQuestions++;
                    firstcolor = Colors.green;
                  } else {
                    wrongQuestions++;

                    firstcolor = Colors.red;
                    if (correctanswer == 2) {
                      secondcolor = Colors.green;
                    } else {
                      thirdcolor = Colors.green;
                    }
                  }
                }
                setState(() {});
              },
              child: Text("der"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(firstcolor)),
            ),
            ElevatedButton(
                onPressed: () {
                  if (buttonsEnabled == true) {
                    buttonsEnabled = false;
                    if (correctanswer == 2) {
                      correctQuestions++;
                      secondcolor = Colors.green;
                    } else {
                      wrongQuestions++;

                      secondcolor = Colors.red;
                      if (correctanswer == 1) {
                        firstcolor = Colors.green;
                      } else {
                        thirdcolor = Colors.green;
                      }
                    }
                  }
                  setState(() {});
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondcolor)),
                child: Text("die")),
            ElevatedButton(
                onPressed: () {
                  if (buttonsEnabled == true) {
                    buttonsEnabled = false;
                    if (correctanswer == 3) {
                      correctQuestions++;
                      thirdcolor = Colors.green;
                    } else {
                      wrongQuestions++;

                      thirdcolor = Colors.red;
                      if (correctanswer == 2) {
                        secondcolor = Colors.green;
                      } else {
                        firstcolor = Colors.green;
                      }
                    }
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(thirdcolor)),
                child: Text("das"))
          ],
        )
      ],
    );
  }
}
