import 'package:almanca_proje/model.dart';
import 'package:flutter/material.dart';

class Constants {
  static List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.menu_book_rounded),
        label: 'Kelime Anlamı',
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz),
        label: 'Artikel',
        backgroundColor: Colors.amber.shade600),
    BottomNavigationBarItem(
        icon: Icon(Icons.call_split_outlined),
        label: 'Çoğul',
        backgroundColor: Colors.red.shade600),
  ];
  static List<Word> words = [
    Word(
        article: ArticleEnum.die,
        word: "Abfahrt",
        plural: "Abfahrten",
        meaning: "Kalkış",
        otherPossiblePluralForms: ["Abfahrten", "Abfährt"]),
    Word(
        article: ArticleEnum.der,
        word: "Absender",
        plural: "Absender",
        meaning: "Gönderen",
        otherPossiblePluralForms: ["Absendern", "Äbsender"]),
    Word(
        article: ArticleEnum.die,
        word: "Adresse",
        plural: "Adressen",
        meaning: "Adres",
        otherPossiblePluralForms: ["Adresse", "Adresses"]),
    Word(
        article: ArticleEnum.das,
        word: "Alter",
        plural: "Alter",
        meaning: "Yaş",
        otherPossiblePluralForms: ["Altern", "Ältern"]),
    Word(
        article: ArticleEnum.das,
        word: "Angebot",
        plural: "Angebote",
        meaning: "Teklif",
        otherPossiblePluralForms: ["Angebot", "Ängebot"]),
    Word(
        article: ArticleEnum.der,
        word: "Anfang",
        plural: "Anfänge",
        meaning: "Başlangıç",
        otherPossiblePluralForms: ["Anfang", "Anfange"]),
    Word(
        article: ArticleEnum.die,
        word: "Anfunkt",
        plural: "-",
        meaning: "Varış",
        otherPossiblePluralForms: ["",""])
  ];
  static TextStyle wordTextStyle = TextStyle(fontSize: 30);
  static TextStyle questionTextStyle = TextStyle(fontSize: 20);
}
