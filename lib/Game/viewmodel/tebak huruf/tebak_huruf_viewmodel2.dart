import 'dart:math';
import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/data/tebak_huruf_question.dart';
import 'package:TajwidKidz/Game/models/question_model.dart';

class QuestionAnswerTebak2 {
  String? selectedAnswer;
  bool isAnswered;

  QuestionAnswerTebak2({
    this.selectedAnswer,
    this.isAnswered = false,
  });
}

class TebakHurufViewmodel2 extends ChangeNotifier {
  final List<HijaiyahQuestion2> _allQuestions = List.from(tebakHurufQuestions2);
  List<HijaiyahQuestion2> _questionsForGame = [];

  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;
  bool _isFinished = false;
  final Map<int, QuestionAnswerTebak2> _questionAnswers = {};
  VoidCallback? onGameFinishedCallback;

  // --- PERUBAHAN 1: Tambahkan state untuk pilihan sementara ---
  String? _tentativeSelectedAnswer;
  String? get tentativeSelectedAnswer => _tentativeSelectedAnswer;
  // -----------------------------------------------------------

  TebakHurufViewmodel2() {
    _initializeGameQuestions();
  }

  void _initializeGameQuestions() {
    final shuffledQuestions = _allQuestions.toList()..shuffle();
    _questionsForGame = shuffledQuestions.take(20).toList();
    _loadAnswerForQuestion(_currentIndex);
  }

  List<HijaiyahQuestion2> get questions => _questionsForGame;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int get correctAnswers => _correctAnswers;
  String? get selectedAnswer => _questionAnswers[_currentIndex]?.selectedAnswer;
  bool get isAnswered => _questionAnswers[_currentIndex]?.isAnswered ?? false;
  bool get isFinished => _isFinished;
  HijaiyahQuestion2 get currentQuestion => _questionsForGame[_currentIndex];

  // --- PERUBAHAN 2: Method baru untuk memilih opsi sementara ---
  void selectOption(String option) {
    if (isAnswered) return;
    _tentativeSelectedAnswer = option;
    notifyListeners();
  }
  // ----------------------------------------------------------

  // --- PERUBAHAN 3: Modifikasi method `answer` ---
  // Parameter dibuat opsional untuk menangani kedua tipe soal
  void answer([String? directAnswer]) {
    if (isAnswered) return;

    // Tentukan jawaban final: dari parameter (Tipe 1) atau dari pilihan sementara (Tipe 2)
    final String? finalAnswer = directAnswer ?? _tentativeSelectedAnswer;

    // Jika tidak ada jawaban yang bisa dikunci, jangan lakukan apa-apa
    if (finalAnswer == null) return;

    _questionAnswers[_currentIndex] = QuestionAnswerTebak2(
        selectedAnswer: finalAnswer,
        isAnswered: true,
    );

    if (finalAnswer == currentQuestion.correctAnswer) {
      _score += 10;
      _correctAnswers++;
    }
    notifyListeners();
  }
  // ----------------------------------------------------

  void _loadAnswerForQuestion(int questionIndex) {
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questionsForGame.length - 1) {
      _currentIndex++;
      // --- PERUBAHAN 4: Reset pilihan sementara untuk soal baru ---
      _tentativeSelectedAnswer = null;
      // ---------------------------------------------------------
      _loadAnswerForQuestion(_currentIndex);
    } else {
      _isFinished = true;
      onGameFinishedCallback?.call();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _tentativeSelectedAnswer = null; // Reset juga saat kembali
      _loadAnswerForQuestion(_currentIndex);
    }
  }

  void resetGame() {
    _initializeGameQuestions();
    _currentIndex = 0;
    _score = 0;
    _correctAnswers = 0;
    _isFinished = false;
    _questionAnswers.clear();
    // --- PERUBAHAN 5: Reset pilihan sementara saat reset game ---
    _tentativeSelectedAnswer = null;
    // ---------------------------------------------------------
    _loadAnswerForQuestion(_currentIndex);
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinishedCallback = callback;
  }
}