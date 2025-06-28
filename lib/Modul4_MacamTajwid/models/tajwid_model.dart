class TajwidModel {
  final String number;
  final String title;
  final String otherTitle;
  final String influentialLetter;
  final String howToRead;
  final List<List<String>> exampleWord;
  final List<List<String>> exampleImage;

  final List<String> exampleAudio;// Ganti jadi hanya 1 file audio per tajwid

  TajwidModel({
    required this.number,
    required this.title,
    required this.otherTitle,
    required this.influentialLetter,
    required this.howToRead,
    required this.exampleWord,
    required this.exampleImage,
    required this.exampleAudio,
  });
}
