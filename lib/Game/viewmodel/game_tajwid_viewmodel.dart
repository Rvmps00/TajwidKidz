import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:TajwidKidz/Game/data/game_tajwid_question.dart';
import 'package:TajwidKidz/Game/models/question_model.dart';

// Class untuk menyimpan state jawaban setiap pertanyaan
class QuestionAnswer {
  final String result;
  final String errorMessage;
  final String userAnswer;
  final bool isCorrect;

  QuestionAnswer({
    required this.result,
    required this.errorMessage,
    required this.userAnswer,
    required this.isCorrect,
  });
}

class GameTajwidViewModel extends ChangeNotifier {
  int _currentLevelIndex = 0;
  int _currentQuestionIndex = 0;
  int score = 0;
  int correctAnswers = 0;
  bool _isRecording = false;
  bool _isFinished = false;
  final stt.SpeechToText _speech = stt.SpeechToText();
  
  // Map untuk menyimpan jawaban setiap pertanyaan
  final Map<String, QuestionAnswer> _questionAnswers = {};

  GameTajwidQuestion get currentLevel => gameTajwidQuestions[_currentLevelIndex];
  TajwidQuestion get currentQuestion => currentLevel.questions[_currentQuestionIndex];
  int get level => currentLevel.level;
  String get levelName => currentLevel.levelName;
  int get currentIndexInLevel => _currentQuestionIndex;
  bool get isRecording => _isRecording;
  bool get isFinished => _isFinished;

  // Method untuk mendapatkan unique key untuk setiap pertanyaan
  String _getQuestionKey() => 'L${_currentLevelIndex}_Q${_currentQuestionIndex}';

  // Method untuk mendapatkan jawaban pertanyaan saat ini
  QuestionAnswer? getCurrentQuestionAnswer() {
    return _questionAnswers[_getQuestionKey()];
  }

  // Method untuk menyimpan jawaban pertanyaan
  void _saveQuestionAnswer({
    required String result,
    required String errorMessage,
    required String userAnswer,
    required bool isCorrect,
  }) {
    final key = _getQuestionKey();
    _questionAnswers[key] = QuestionAnswer(
      result: result,
      errorMessage: errorMessage,
      userAnswer: userAnswer,
      isCorrect: isCorrect,
    );
  }

  // Method untuk mengecek apakah pertanyaan sudah dijawab dengan benar atau salah
  bool get isQuestionAnswered {
    final answer = getCurrentQuestionAnswer();
    return answer != null && answer.result.isNotEmpty;
  }

  /// Meminta izin mikrofon
  Future<void> requestMicPermission() async {
    final status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  /// Memulai proses perekaman dan pengenalan suara
  Future<void> startListening() async {
    // Jika sudah ada jawaban yang benar atau salah, tidak bisa record lagi
    final currentAnswer = getCurrentQuestionAnswer();
    if (currentAnswer != null && currentAnswer.result.isNotEmpty) {
      return;
    }

    await requestMicPermission();

    bool available = await _speech.initialize(
      onStatus: (status) {
        debugPrint("Speech Status: $status");
        if (status == "done" || status == "notListening") {
          _isRecording = false;
          notifyListeners();
        }
      },
      onError: (error) {
        debugPrint("Speech Error: ${error.errorMsg}");
        _saveQuestionAnswer(
          result: "",
          errorMessage: "Gagal mengenali suara, Ulangi",
          userAnswer: "",
          isCorrect: false,
        );
        _isRecording = false;
        notifyListeners();
      },
    );

    if (!available) {
      _saveQuestionAnswer(
        result: "",
        errorMessage: "Speech recognition tidak tersedia.",
        userAnswer: "",
        isCorrect: false,
      );
      _isRecording = false;
      notifyListeners();
      return;
    }

    _isRecording = true;
    
    // Clear error message saat mulai record baru
    final key = _getQuestionKey();
    if (_questionAnswers.containsKey(key) && _questionAnswers[key]!.result.isEmpty) {
      _questionAnswers.remove(key);
    }
    
    notifyListeners();

    // 🔍 Ambil semua locale yang didukung perangkat
    final locales = await _speech.locales();
    debugPrint("Locale yang tersedia:");
    for (final locale in locales) {
      debugPrint(" - ${locale.localeId}");
    }

    // 🧠 Coba locale ID utama, fallback jika gagal
    final List<String> preferredLocales = [
      "id_ID", // Bahasa Indonesia
      "en_US", // Bahasa Inggris (umum)
      "ar", // Bahasa Arab
    ];

    // ✅ Temukan locale pertama yang tersedia
    String? selectedLocale;
    for (final loc in preferredLocales) {
      if (locales.any((l) => l.localeId == loc)) {
        selectedLocale = loc;
        break;
      }
    }

    debugPrint("Menggunakan locale: $selectedLocale");

    // 🗣️ Mulai mendengarkan
    _speech.listen(
      localeId: selectedLocale,
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 5),
      partialResults: false,
      cancelOnError: true,
      onResult: (result) {
        debugPrint("🔍 recognizedWords: '${result.recognizedWords}'");
        if (result.recognizedWords.isEmpty) {
          _saveQuestionAnswer(
            result: "",
            errorMessage: "Tidak ada suara terdeteksi.",
            userAnswer: "",
            isCorrect: false,
          );
        } else {
          _processResult(result.recognizedWords);
        }
        _isRecording = false;
        notifyListeners();
      },
      onSoundLevelChange: (level) {
        debugPrint("Mic level: $level");
      },
    );
  }

  /// Mengevaluasi hasil pengenalan suara
  void _processResult(String userAnswer) {
    final correct = currentQuestion.correctAnswer.toLowerCase().trim();
    final answer = userAnswer.toLowerCase().trim();

    bool isCorrect = answer == correct;
    String result = "";
    
    if (isCorrect) {
      result = "benar"; // Match UI feedback
      score += 10;
      correctAnswers++;
    } else {
      result = "kurang"; // Match UI feedback
    }
    
    _saveQuestionAnswer(
      result: result,
      errorMessage: "",
      userAnswer: userAnswer,
      isCorrect: isCorrect,
    );
    
    _speech.stop();
    notifyListeners();
  }

  /// Lanjut ke soal berikutnya
  void nextQuestion() {
    if (_currentQuestionIndex < currentLevel.questions.length - 1) {
      _currentQuestionIndex++;
    } else if (_currentLevelIndex < gameTajwidQuestions.length - 1) {
      _currentLevelIndex++;
      _currentQuestionIndex = 0;
    } else {
      _isFinished = true;
    }
    notifyListeners();
  }

  /// Kembali ke soal sebelumnya
  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    } else if (_currentLevelIndex > 0) {
      _currentLevelIndex--;
      _currentQuestionIndex = currentLevel.questions.length - 1;
    }
    notifyListeners();
  }

  /// Reset ulang game
  void reset() {
    _currentLevelIndex = 0;
    _currentQuestionIndex = 0;
    score = 0;
    correctAnswers = 0;
    _isRecording = false;
    _isFinished = false;
    _questionAnswers.clear();
    notifyListeners();
  }
}