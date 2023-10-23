import 'package:almanca_proje/article.dart';
import 'package:almanca_proje/model.dart';
import 'package:flutter/material.dart';

class Constants {
  static List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.menu_book_rounded),
        label: 'Kelime Anlamı',
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: const Icon(Icons.more_horiz),
        label: 'Artikel',
        backgroundColor: Colors.amber.shade600),
    BottomNavigationBarItem(
        icon: const Icon(Icons.call_split_outlined),
        label: 'Çoğul',
        backgroundColor: Colors.red.shade600),
  ];
  static List<Word> words = [];
  static TextStyle wordTextStyle = const TextStyle(fontSize: 30);
  static TextStyle questionTextStyle = const TextStyle(fontSize: 20);
}
