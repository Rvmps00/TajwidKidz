import '../models/question_model.dart';


//Level 1
final List<HijaiyahQuestion> susunHurufQuestions = [
  // 1
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'بَيْتٌ',
    correctAnswer: 'بيت',
    options: ['ت', 'ب', 'ص', 'ي', 'ج', 'ث', 'ب'],
    audioPath: "1.mp3",
  ),
  // 2
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'بَابٌ',
    correctAnswer: 'باب',
    options: ['ج', 'ا', 'ن', 'ب', 'ب'],
    audioPath: "2.mp3",
  ),
  // 3
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'نُورٌ',
    correctAnswer: 'نور',
    options: ['ر', 'ن', 'ف', 'و', 'ن', 'د'],
    audioPath: "3.mp3",
  ),
  // 4
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'قَلَمٌ',
    correctAnswer: 'قلم',
    options: ['ح', 'ا', 'م', 'ق', 'ل', 'ن'],
    audioPath: "4.mp3",
  ),
  // 5
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'بَيْتٌ',
    correctAnswer: 'بيت',
    options: ['ت', 'ب', 'ص', 'ي', 'ج', 'ث', 'ب'],
    audioPath: "5.mp3",
  ),
  // 6
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'مَاءٌ',
    correctAnswer: 'مَاءٌ',
    options: ['ا', 'ء', 'ب', 'م', 'ت', 'م', 'ل'],
    audioPath: "6.mp3",
  ),
  // 7
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'شَمْسٌ',
    correctAnswer: 'شمس',
    options: ['ر', 'س', 'ص', 'ن', 'د', 'ش', 'م'],
    audioPath: "7.mp3",
  ),
  // 8
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'طَعَامٌ',
    correctAnswer: 'طعام',
    options: ['ض', 'ا', 'ط', 'ع', 'م', 'ف', 'م'],
    audioPath: "8.mp3",
  ),
  // 9
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'كُرْسِيٌّ',
    correctAnswer: 'كرسي',
    options: ['ك', 'ش', 'ي', 'و', 'ر', 'س', 'ك'],
    audioPath: "9.mp3",
  ),
  // 10
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'قِطٌّ',
    correctAnswer: 'قط',
    options: ['ج', 'ب', 'ق', 'ط', 'ز', 'ط'],
    audioPath: "10.mp3",
  ),
];

//Level 2
final List<HijaiyahQuestion> susunHurufQuestions2 = [
  // Soal 1
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'كِتَابٌ', // Target Kata (dengan harakat)
    options: ['ك', 'ت', 'ا', 'ب', 'س', 'ط', 'ك'], // Huruf Acak
    correctAnswer: 'كتاب', // Jawaban (tanpa harakat)
    audioPath: "1.mp3",
  ),

  // Soal 2
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'طَعَامٌ',
    options: ['ط', 'ع', 'ا', 'م', 'ض', 'ف', 'م'],
    correctAnswer: 'طعام',
    audioPath: "2.mp3",
  ),

  // Soal 3
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'كُرْسِيٌّ',
    options: ['ك', 'ر', 'س', 'ي', 'و', 'ش', 'ك'],
    correctAnswer: 'كرسي',
    audioPath: "3.mp3",
  ),

  // Soal 4
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'وُرُودٌ',
    options: ['و', 'ر', 'و', 'د', 'ن', 'ز', 'ق'],
    correctAnswer: 'ورود',
    audioPath: "4.mp3",
  ),

  // Soal 5
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'جَمِيلٌ',
    options: ['ج', 'م', 'ي', 'ل', 'ن', 'ج', 'ت'],
    correctAnswer: 'جميل',
    audioPath: "5.mp3",
  ),

  // Soal 6
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'طِفْلٌ',
    options: ['ط', 'ف', 'ل', 'ص', 'ض', 'ط'],
    correctAnswer: 'طفل',
    audioPath: "6.mp3",
  ),

  // Soal 7
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'نَافِذَةٌ',
    options: ['ن', 'ا', 'ف', 'ذ', 'ة', 'د', 'ز'],
    correctAnswer: 'نافذة',
    audioPath: "7.mp3",
  ),

  // Soal 8
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'سَمَكٌ',
    options: ['س', 'م', 'ك', 'د', 'ب', 'ل'],
    correctAnswer: 'سمك',
    audioPath: "8.mp3",
  ),

  // Soal 9
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'دَفْتَرٌ',
    options: ['د', 'ف', 'ت', 'ر', 'ك', 'ن', 'ط'],
    correctAnswer: 'دفتر',
    audioPath: "9.mp3",
  ),

  // Soal 10
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'صَدِيقٌ',
    options: ['ص', 'د', 'ي', 'ق', 'ث', 'ش', 'ط'],
    correctAnswer: 'صديق',
    audioPath: "10.mp3",
  ),
];

//Level 3
final List<HijaiyahQuestion> susunHurufQuestions3 = [
  // Soal 1
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'كِتَابٌ', // Target Kata (untuk diucapkan TTS)
    options: ['ك', 'ت', 'ا', 'ب', 'ق', 'ث', 'س', 'ط', 'ك', 'ج'], // Huruf Acak
    correctAnswer: 'كتاب', // Jawaban (tanpa harakat)
    audioPath: "1.mp3",
  ),

  // Soal 2
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'طَعَامٌ',
    options: ['ط', 'ع', 'ا', 'م', 'ف', 'ض', 'غ', 'ق', 'ظ'],
    correctAnswer: 'طعام',
    audioPath: "2.mp3",
  ),

  // Soal 3
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'كُرْسِيٌّ',
    options: ['ك', 'ر', 'س', 'ي', 'ش', 'ق', 'ص', 'ل', 'ك'],
    correctAnswer: 'كرسي',
    audioPath: "3.mp3",
  ),

  // Soal 4
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'صَدِيقٌ',
    options: ['ص', 'د', 'ي', 'ق', 'ط', 'ض', 'ش', 'س', 'ث'],
    correctAnswer: 'صديق',
    audioPath: "4.mp3",
  ),

  // Soal 5
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'دَفْتَرٌ',
    options: ['د', 'ف', 'ت', 'ر', 'ط', 'ض', 'ن', 'ب', 'س'],
    correctAnswer: 'دفتر',
    audioPath: "5.mp3",
  ),

  // Soal 6
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'جَمِيلٌ',
    options: ['ج', 'م', 'ي', 'ل', 'ح', 'ن', 'خ', 'ت'],
    correctAnswer: 'جميل',
    audioPath: "6.mp3",
  ),

  // Soal 7
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'وُرُودٌ',
    options: ['و', 'ر', 'و', 'د', 'ز', 'ذ', 'ق', 'ن', 'ض'],
    correctAnswer: 'ورود',
    audioPath: "7.mp3",
  ),

  // Soal 8
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'مِفْتَاحٌ',
    options: ['م', 'ف', 'ت', 'ا', 'ح', 'د', 'ن', 'ق', 'ط'],
    correctAnswer: 'مفتاح',
    audioPath: "8.mp3",
  ),

  // Soal 9
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'نَافِذَةٌ',
    options: ['ن', 'ا', 'ف', 'ذ', 'ة', 'ز', 'ض', 'د', 'ش'],
    correctAnswer: 'نافذة',
    audioPath: "9.mp3",
  ),

  // Soal 10
  HijaiyahQuestion(
    text: 'Susun huruf ini\nmenjadi kata:',
    word: 'سَمَكٌ',
    options: ['س', 'م', 'ك', 'ش', 'ب', 'د', 'ل', 'ث'],
    correctAnswer: 'سمك',
    audioPath: "10.mp3",
  ),
];