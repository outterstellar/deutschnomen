import 'dart:math';

import 'package:almanca_proje/constants.dart';
import 'package:almanca_proje/main.dart';
import 'package:almanca_proje/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Plural extends StatefulWidget {
  const Plural({super.key});

  @override
  State<Plural> createState() => _PluralState();
}

class _PluralState extends State<Plural> {
    static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return Plural();
      },
    );
  }
  late int question;
  late Word currentWord;
  late List answers = [];
  late String first;
  late String second;
  late String third;
  late int correctanswer;
  bool buttonsEnabled = true;
  Color firstcolor = Colors.blue;
  Color secondcolor = Colors.blue;
  Color thirdcolor = Colors.blue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        questions++;

    Random random = Random();
    while (true) {
      question = random.nextInt(Constants.words.length - 1);
      currentWord = Constants.words[question];
      if (currentWord.plural == "" ||
          currentWord.plural == " " ||
          currentWord.plural == "-") {
        continue;
      } else {
        break;
      }
    }
    answers.addAll(currentWord.otherPossiblePluralForms);
    answers.add(currentWord.plural);
    correctanswer = random.nextInt(2) + 1;
    if (correctanswer == 1) {
      first = answers[
          2]; // Because we added correct answer to the last part of the list.
      if (random.nextInt(1) == 0) {
        second = answers[0];
        third = answers[1];
      } else {
        second = answers[1];
        third = answers[0];
      }
    } else if (correctanswer == 2) {
      second = answers[
          2]; // Because we added correct answer to the last part of the list.
      if (random.nextInt(1) == 0) {
        first = answers[0];
        third = answers[1];
      } else {
        first = answers[1];
        third = answers[0];
      }
    } else {
      third = answers[
          2]; // Because we added correct answer to the last part of the list.
      if (random.nextInt(1) == 0) {
        first = answers[0];
        second = answers[1];
      } else {
        first = answers[1];
        second = answers[0];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: Center(
              child: Text(
            "${currentWord.article.name} ${currentWord.word}",
            style: Constants.wordTextStyle,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Bu Kelimenin Çoğulu Hangi Şıkta Doğru Verilmiştir?",
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
                    firstcolor = Colors.green;
                    correctQuestions++;
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
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(firstcolor)),
              child: Text(first),
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
                child: Text(second)),
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
                child: Text(third))
          ],
        )
      ],
    );
  }
}
