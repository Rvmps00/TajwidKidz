class HijaiyahQuestion {
  final String text;
  final String word;
  final String correctAnswer;
  final List<String> options;
  final String? notes;
  final String? correctImagePath;
  final String? audioPath;

  HijaiyahQuestion({
    required this.text,
    required this.word,
    required this.correctAnswer,
    required this.options,
    this.notes,
    this.correctImagePath,
    this.audioPath,
  });
}

enum QuestionType {
  listenAndChooseText,
  seeAndChooseAudio,
}

class HijaiyahQuestion2 {
  final QuestionType type;
  final String text; // Teks instruksi
  
  // Untuk stimulus/soal
  final String? questionWord; // Kata yg diucapkan ATAU ditampilkan. Cth: "fa" atau "ج"
  final String? questionImagePath; // Gambar yg ditampilkan sbg soal
  final String? questionNotes; // Catatan yg ditampilkan sbg soal

  // Untuk opsi & jawaban
  final List<String> options;
  final String correctAnswer;

  // Untuk feedback (setelah menjawab benar)
  final String? feedbackImagePath;
  final String? feedbackNotes;

  final String? audioPath;
  final List<String>? optionsAudioPath;

  HijaiyahQuestion2({
    required this.type,
    required this.text,
    required this.options,
    required this.correctAnswer,

    this.questionWord,
    this.questionImagePath,
    this.questionNotes,
    this.feedbackImagePath,
    this.feedbackNotes,
    this.audioPath,
    this.optionsAudioPath,
  });
}

class SusunHurufQuestion {
  final String question;
  final List<String> fragments;
  final String answer;

  SusunHurufQuestion({
    required this.question,
    required this.fragments,
    required this.answer,
  });
}

class GameTajwidQuestion {
  final int level;
  final String levelName;
  final List<TajwidQuestion> questions;

  GameTajwidQuestion({
    required this.level,
    required this.levelName,
    required this.questions,
  });
}

class TajwidQuestion {
  final String question;
  final String word;
  final String correctAnswer;
  final String audioPath;

  TajwidQuestion({
    required this.question,
    required this.word,
    required this.correctAnswer,
    required this.audioPath,
  });
}

class TajwidLevel2Question {
  // Nama hukum tajwid, e.g., "Imālah"
  final String ruleName;
  
  // Ayat lengkap dengan tanda kutip " " untuk highlight
  final String verse;
  
  // Contoh bacaan yang benar (untuk TTS)
  final String audioExample;
  
  // Teks yang akan dibandingkan dengan hasil rekaman suara pengguna
  final String correctAnswer;
  
  // Feedback jika ucapan pengguna benar
  final String positiveFeedback;
  
  // Feedback jika ucapan pengguna salah
  final String correctiveFeedback;

  final String audioPath;

  TajwidLevel2Question({
    required this.ruleName,
    required this.verse,
    required this.audioExample,
    required this.correctAnswer,
    required this.positiveFeedback,
    required this.correctiveFeedback,
    required this.audioPath,
  });
}
