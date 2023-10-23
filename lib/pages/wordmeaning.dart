import 'dart:math';

import 'package:almanca_proje/data/constants.dart';
import 'package:almanca_proje/main.dart';
import 'package:almanca_proje/data/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordMeaning extends StatefulWidget {
  const WordMeaning({super.key});

  @override
  State<WordMeaning> createState() => _WordMeaningState();
}

class _WordMeaningState extends State<WordMeaning> {
    static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return WordMeaning();
      },
    );
  }
  late int question;
  late Word currentWord;
  late List answers = [];
  late int correctanswer;
  late String currentWordText;
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
    question = random.nextInt(Constants.words.length - 1);
    currentWord = Constants.words[question];
    if (random.nextInt(2) == 0) {
      while (true) {
        answers.add(Constants
            .words[random.nextInt(Constants.words.length - 1)].meaning);
        answers.add(Constants
            .words[random.nextInt(Constants.words.length - 1)].meaning);
        answers.add(currentWord.meaning);
        if (answers[0] == answers[1] ||
            answers[0] == answers[2] ||
            answers[1] == answers[2]) {
          answers = [];
          continue;
        } else {
          break;
        }
      }
          answers.shuffle();
    correctanswer = answers.indexOf(currentWord.meaning) + 1;
      currentWordText = currentWord.word;
    } else {
      while (true) {
        answers.add(
            Constants.words[random.nextInt(Constants.words.length - 1)].word);
        answers.add(
            Constants.words[random.nextInt(Constants.words.length - 1)].word);
        answers.add(currentWord.word);
        if (answers[0] == answers[1] ||
            answers[0] == answers[2] ||
            answers[1] == answers[2]) {
          answers = [];
          continue;
        } else {
          break;
        }
      }
          answers.shuffle();
    correctanswer = answers.indexOf(currentWord.word) + 1;
      currentWordText = currentWord.meaning;
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
            currentWordText.toCapitalized(),
            style: Constants.wordTextStyle,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Bu Kelimenin Anlamı Hangi Şıkta Doğru Verilmiştir?",
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
              child: Text(answers[0].toString().toTitleCase()),
            ),
            ElevatedButton(
                onPressed: () {
                  if (buttonsEnabled == true) {
                    buttonsEnabled = false;
                    if (correctanswer == 2) {
                      secondcolor = Colors.green;

                      correctQuestions++;
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
                child: Text(answers[1].toString().toTitleCase())),
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
                child: Text(answers[2].toString().toTitleCase()))
          ],
        )
      ],
    );
  }
}
