import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../data/game_tajwid_question.dart';
import '../../models/question_model.dart';

// Class untuk menyimpan state jawaban
class TajwidAnswer2 {
  final bool isCorrect;
  final String userAnswer;

  TajwidAnswer2({required this.isCorrect, required this.userAnswer});
}

class GameTajwid2ViewModel extends ChangeNotifier {
  final List<TajwidLevel2Question> _allQuestions = tajwidLevel2Questions;
  List<TajwidLevel2Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;

  bool isRecording = false;
  bool isFinished = false;

  final stt.SpeechToText _speech = stt.SpeechToText();

  final Map<int, TajwidAnswer2> _answers = {};
  TajwidAnswer2? get currentAnswer => _answers[_currentIndex];

  List<TajwidLevel2Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  TajwidLevel2Question get currentQuestion => _questions[_currentIndex];
  int get score => _score;
  int get correctAnswers => _correctAnswers;
  bool get isQuestionAnswered => _answers.containsKey(_currentIndex);

  VoidCallback? onGameFinished;

  GameTajwid2ViewModel() {
    _initializeGameQuestions();
  }

  // BARU: Method untuk mengacak dan menyiapkan soal untuk game
  void _initializeGameQuestions() {
    // 1. Buat salinan dari master data soal
    final tempList = List<TajwidLevel2Question>.from(_allQuestions);
    // 2. Acak urutan salinan tersebut
    tempList.shuffle();
    // 3. Gunakan list yang sudah diacak sebagai soal untuk game
    _questions = tempList;
  }

  Future<void> startListening() async {
    if (isQuestionAnswered) return;

    final permission = await Permission.microphone.request();
    if (!permission.isGranted) return;

    bool available = await _speech.initialize(
      onStatus: (status) {
        debugPrint("Speech Status: $status");
        if (status == "done" || status == "notListening") {
          isRecording = false;
          notifyListeners();
        }
      },
      onError: (error) {
        debugPrint("Speech Error: ${error.errorMsg}");
        _answers[_currentIndex] = TajwidAnswer2(
          isCorrect: false,
          userAnswer: "Gagal mengenali suara, ulangi.",
        );
        isRecording = false;
        notifyListeners();
      },
    );

    if (!available) {
      _answers[_currentIndex] = TajwidAnswer2(
        isCorrect: false,
        userAnswer: "Speech recognition tidak tersedia.",
      );
      isRecording = false;
      notifyListeners();
      return;
    }

    isRecording = true;
    notifyListeners();

    // Ambil dan pilih locale
    final locales = await _speech.locales();
    final List<String> preferredLocales = ["ar", "id_ID", "en_US"];
    String? selectedLocale;

    for (final loc in preferredLocales) {
      if (locales.any((l) => l.localeId == loc)) {
        selectedLocale = loc;
        break;
      }
    }

    debugPrint("Menggunakan locale: $selectedLocale");

    _speech.listen(
      localeId: selectedLocale,
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 5),
      partialResults: false,
      cancelOnError: true,
      onResult: (result) {
        debugPrint("Hasil suara: '${result.recognizedWords}'");
        if (result.recognizedWords.isEmpty) {
          _answers[_currentIndex] = TajwidAnswer2(
            isCorrect: false,
            userAnswer: "Tidak ada suara terdeteksi.",
          );
        } else {
          _processResult(result.recognizedWords);
        }

        isRecording = false;
        notifyListeners();
      },
      onSoundLevelChange: (level) {
        debugPrint("Mic level: $level");
      },
    );
  }

  void _processResult(String userAnswer) {
    final correct = currentQuestion.correctAnswer.toLowerCase().trim();
    final answer = userAnswer.toLowerCase().trim();

    bool isCorrect = answer == correct; // bisa disesuaikan jika ingin contain()

    if (isCorrect) {
      _score += 10;
      _correctAnswers++;
    }

    _answers[_currentIndex] = TajwidAnswer2(
      isCorrect: isCorrect,
      userAnswer: userAnswer,
    );

    _speech.stop();
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    } else {
      isFinished = true;
      onGameFinished?.call();
    }
    notifyListeners();
  }

  void resetGame() {
    _currentIndex = 0;
    _score = 0;
    _correctAnswers = 0;
    isRecording = false;
    isFinished = false;
    _answers.clear();
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinished = callback;
  }
}
