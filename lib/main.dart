import 'package:almanca_proje/article.dart';
import 'package:almanca_proje/constants.dart';
import 'package:almanca_proje/plural.dart';
import 'package:almanca_proje/wordmeaning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(393, 808),
    builder: (context, child) {
      return MyMaterialAppWidget();
    },
  ));
}

class MyMaterialAppWidget extends StatelessWidget {
  const MyMaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

int currentIndex = 1;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: IconButton(
              onPressed: () {
                showCupertinoDialog(context: context, builder: (context){
                  return CupertinoAlertDialog(
                    actions: [
                      CupertinoButton(child: Text("Tamam"), onPressed: (){
                        Navigator.of(context).pop();
                      })
                    ],
                    content: Column(
           children: [
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(correctQuestions.toString() + " / " + (correctQuestions + wrongQuestions).toString()),
              ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Başarı Yüzdesi : % " + ((correctQuestions / (correctQuestions + wrongQuestions)*100).toString() == "NaN" ? "0" : (correctQuestions / (correctQuestions + wrongQuestions)*100).toStringAsFixed(0))),
            ),

          ],
        ),
                  );
                });
              }, icon: Icon(Icons.content_paste_search_outlined))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios_outlined),
          onPressed: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => MyMaterialAppWidget()));
          },
          backgroundColor: currentIndex == 0
              ? Colors.black
              : currentIndex == 1
                  ? Colors.amber.shade600
                  : Colors.red.shade600),
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
      return WordMeaning();

    case 1:
      return Article();

    default:
      return Plural(); // Because there isn't any case that can't be the fourth one.
  } // And there will be an error when we don't write a default case.
}
