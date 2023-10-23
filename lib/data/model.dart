class Word{
  ArticleEnum article;
  String word;
  String meaning;
  List otherPossiblePluralForms; // This list should include 2 wrong possibilities.
  String plural;
  Word({required this.article, required this.word,required this.plural,required this.meaning,required this.otherPossiblePluralForms});
}  
enum ArticleEnum{
    der,
    die,
    das,
    none
}