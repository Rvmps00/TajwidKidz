// tebak_huruf_viewmodel.dart
import 'dart:math'; // Untuk Random
import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/data/tebak_huruf_question.dart'; // sesuaikan path jika beda
import '../../models/question_model.dart'; // sesuaikan path jika beda

class QuestionAnswerTebak {
  String? selectedAnswer;
  bool isAnswered;

  QuestionAnswerTebak({
    this.selectedAnswer,
    this.isAnswered = false,
  });

  QuestionAnswerTebak copyWith({
    String? selectedAnswer,
    bool? isAnswered,
  }) {
    return QuestionAnswerTebak(
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }
}

class TebakHurufViewmodel extends ChangeNotifier {
  final List<HijaiyahQuestion> _allQuestions = List.from(tebakHurufQuestions); // Salinan dari semua soal
  List<HijaiyahQuestion> _questionsForGame = []; // 10 soal yang dipilih untuk game saat ini

  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;
  String? _selectedAnswer;
  bool _isFinished = false;
  // Set<int> _answeredQuestions = {}; // Tidak lagi menggunakan Set ini dengan cara lama
                                      // karena index merujuk ke _questionsForGame

  final Map<int, QuestionAnswerTebak> _questionAnswers = {};

  VoidCallback? onGameFinishedCallback; // Mengganti nama agar lebih jelas

  TebakHurufViewmodel() {
    _initializeGameQuestions();
  }

void _initializeGameQuestions() {
  final shuffledQuestions = _allQuestions.toList()..shuffle();
  _questionsForGame = shuffledQuestions.take(20).toList();
  _loadAnswerForQuestion(_currentIndex);
}

  List<HijaiyahQuestion> get questions => _questionsForGame;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int get correctAnswers => _correctAnswers;
  String? get selectedAnswer => _questionAnswers[_currentIndex]?.selectedAnswer; // Ambil dari map
  bool get isAnswered => _questionAnswers[_currentIndex]?.isAnswered ?? false; // Ambil dari map
  bool get isFinished => _isFinished;
  // bool get isQuestionAnswered => _answeredQuestions.contains(_currentIndex); // Tidak dipakai lagi
  HijaiyahQuestion get currentQuestion => _questionsForGame[_currentIndex];


  void answer(String option) {
    // Cek apakah pertanyaan saat ini sudah dijawab sebelumnya berdasarkan _questionAnswers
    if (_questionAnswers[_currentIndex]?.isAnswered ?? false) return;

    // Simpan jawaban baru
    _questionAnswers[_currentIndex] = QuestionAnswerTebak(
        selectedAnswer: option,
        isAnswered: true,
    );
    // _selectedAnswer = option; // Tidak lagi langsung set _selectedAnswer
    // _answeredQuestions.add(_currentIndex); // Tidak lagi menggunakan _answeredQuestions

    if (option == currentQuestion.correctAnswer) {
      _score += 10;
      _correctAnswers++;
    }
    notifyListeners();
  }

  // _saveCurrentAnswer tidak lagi diperlukan secara eksplisit karena _questionAnswers diupdate di 'answer'
  // dan saat navigasi, kita akan load dari _questionAnswers

  void _loadAnswerForQuestion(int questionIndex) {
    // Tidak perlu set _selectedAnswer di sini lagi, karena getter akan mengambil dari map
    // Jika belum ada di map (pertanyaan baru), getter akan return null/false
    // yang merupakan kondisi default yang benar.
    // _selectedAnswer = _questionAnswers[questionIndex]?.selectedAnswer;
    // Ini memastikan UI rebuild dengan state yang benar untuk pertanyaan yang baru ditampilkan.
    notifyListeners(); 
  }

  void nextQuestion() {
    // Tidak perlu _saveCurrentAnswer() karena sudah dihandle di answer()
    // Dan saat navigasi, state sudah ada di _questionAnswers

    if (_currentIndex < _questionsForGame.length - 1) {
      _currentIndex++;
      _loadAnswerForQuestion(_currentIndex); // Untuk memastikan UI update jika ada state tersimpan
      // notifyListeners(); // _loadAnswerForQuestion sudah memanggil notifyListeners
    } else {
      _isFinished = true;
      onGameFinishedCallback?.call();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      // Tidak perlu _saveCurrentAnswer()
      _currentIndex--;
      _loadAnswerForQuestion(_currentIndex);
      // notifyListeners(); // _loadAnswerForQuestion sudah memanggil notifyListeners
    }
  }

  void resetGame() {
    _initializeGameQuestions(); // Pilih 10 soal baru secara acak
    _currentIndex = 0;
    _score = 0;
    _correctAnswers = 0;
    // _selectedAnswer = null; // Tidak perlu karena state diambil dari _questionAnswers
    _isFinished = false;
    // _answeredQuestions.clear(); // Tidak dipakai
    _questionAnswers.clear(); // Hapus semua jawaban tersimpan
    _loadAnswerForQuestion(_currentIndex); // Load state untuk pertanyaan pertama yang baru
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinishedCallback = callback;
  }
}