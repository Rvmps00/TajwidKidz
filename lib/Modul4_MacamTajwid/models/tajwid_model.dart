class TajwidModel {
  final String number;
  final String title;
  final String otherTitle;
  final String influentialLetter;
  final String howToRead;
  final List<List<String>> exampleWord; // Ubah menjadi List of List
  final List<List<String>> exampleImage; // Ubah menjadi List of List

  TajwidModel({
    required this.number,
    required this.title,
    required this.otherTitle,
    required this.influentialLetter,
    required this.howToRead,
    required this.exampleWord,
    required this.exampleImage,
  });
}