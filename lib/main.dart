import 'dart:convert';

import 'package:almanca_proje/article.dart';
import 'package:almanca_proje/constants.dart';
import 'package:almanca_proje/model.dart';
import 'package:almanca_proje/plural.dart';
import 'package:almanca_proje/wordmeaning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  _loadData().then((value) {
    Constants.words = value.map((e) => Word(article: e[0] == "der" ? ArticleEnum.der : e[0] == "das" ? ArticleEnum.das : ArticleEnum.die, word: e[1], plural: e[2], meaning: e[3], otherPossiblePluralForms: e[4])).toList();
  });
  runApp(ScreenUtilInit(
    designSize: const Size(393, 808),
    builder: (context, child) {
      return const MyMaterialAppWidget();
    },
  ));
}

class MyMaterialAppWidget extends StatelessWidget {
  const MyMaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int correctQuestions = 0;
int wrongQuestions = 0;
int questions = 0;
int unfilledQuestions = 0;
int currentIndex = 1;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: CircleAvatar(
            backgroundColor: currentIndex == 0
                ? Colors.black
                : currentIndex == 1
                    ? Colors.amber.shade600
                    : Colors.red.shade600,
            foregroundColor: Colors.white,
            child: IconButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          actions: [
                            CupertinoButton(
                                child: const Text("Tamam"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$correctQuestions / $questions"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Başarı Yüzdesi : % ${(correctQuestions / questions * 100).toString() == "NaN" ? "0" : (correctQuestions / questions * 100).toStringAsFixed(0)}"),
                              ),
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.content_paste_search_outlined)),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => const MyMaterialAppWidget()));
          },
          backgroundColor: currentIndex == 0
              ? Colors.black
              : currentIndex == 1
                  ? Colors.amber.shade600
                  : Colors.red.shade600,
          child: const Icon(Icons.arrow_forward_ios_outlined)),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            changePages(index);
          },
          type: BottomNavigationBarType.shifting,
          items: Constants.bottomNavigationBarItems),
      body: returnWidget(),
    );
  }

  changePages(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

Widget returnWidget() {
  debugPrint(currentIndex.toString());
  switch (currentIndex) {
    case 0:
      return const WordMeaning();

    case 1:
      return const Article();

    default:
      return const Plural(); // Because there isn't any case that can't be the fourth one.
  } // And there will be an error when we don't write a default case.
}
Future <List<dynamic>> _loadData() async{
  String jsonString = await rootBundle.loadString("lib/list.json");
  return json.decode(jsonString).toList();
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}