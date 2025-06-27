import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/data/tebak_huruf_question.dart';
import '../models/question_model.dart';

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
  final List<HijaiyahQuestion> _questions = tebakHurufQuestions;
  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;
  String? _selectedAnswer;
  bool _isFinished = false;
  final Set<int> _answeredQuestions = {};

  // Store answers for each question
  final Map<int, QuestionAnswerTebak> _questionAnswers = {};

  VoidCallback? onGameFinished;

  List<HijaiyahQuestion> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int get correctAnswers => _correctAnswers;
  String? get selectedAnswer => _selectedAnswer;
  bool get isAnswered => _selectedAnswer != null;
  bool get isFinished => _isFinished;
  bool get isQuestionAnswered => _answeredQuestions.contains(_currentIndex);
  HijaiyahQuestion get currentQuestion => _questions[_currentIndex];

  void answer(String option) {
    if (isQuestionAnswered) return; // Prevent re-answering

    _selectedAnswer = option;
    _answeredQuestions.add(_currentIndex);

    if (option == currentQuestion.correctAnswer) {
      _score += 10;
      _correctAnswers++;
    }

    notifyListeners();
  }

  void _saveCurrentAnswer() {
    _questionAnswers[_currentIndex] = QuestionAnswerTebak(
      selectedAnswer: _selectedAnswer,
      isAnswered: _selectedAnswer != null,
    );
  }

  void _loadAnswerForQuestion(int questionIndex) {
    if (_questionAnswers.containsKey(questionIndex)) {
      final savedAnswer = _questionAnswers[questionIndex]!;
      _selectedAnswer = savedAnswer.selectedAnswer;
    } else {
      // Clear state for unanswered question
      _selectedAnswer = null;
    }
  }

  void nextQuestion() {
    // Save current answer before moving to next question
    if (_selectedAnswer != null) {
      _saveCurrentAnswer();
    }

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _loadAnswerForQuestion(_currentIndex);
      notifyListeners();
    } else {
      _isFinished = true;
      onGameFinished?.call();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      // Save current answer before moving to previous question
      if (_selectedAnswer != null) {
        _saveCurrentAnswer();
      }

      _currentIndex--;
      _loadAnswerForQuestion(_currentIndex);
      notifyListeners();
    }
  }

  void resetGame() {
    _currentIndex = 0;
    _score = 0;
    _correctAnswers = 0;
    _selectedAnswer = null;
    _isFinished = false;
    _answeredQuestions.clear();
    _questionAnswers.clear();
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinished = callback;
  }
}