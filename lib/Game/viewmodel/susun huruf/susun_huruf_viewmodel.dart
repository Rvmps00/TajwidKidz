import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/data/susun_huruf_question.dart';
import '../../models/question_model.dart';

class QuestionAnswer {
  List<String> userAnswer;
  List<int> usedIndices;
  bool isCorrect;
  List<bool> letterCorrectness;
  bool isAnswerComplete;

  QuestionAnswer({
    required this.userAnswer,
    required this.usedIndices,
    required this.isCorrect,
    required this.letterCorrectness,
    required this.isAnswerComplete,
  });

  QuestionAnswer copyWith({
    List<String>? userAnswer,
    List<int>? usedIndices,
    bool? isCorrect,
    List<bool>? letterCorrectness,
    bool? isAnswerComplete,
  }) {
    return QuestionAnswer(
      userAnswer: userAnswer ?? List.from(this.userAnswer),
      usedIndices: usedIndices ?? List.from(this.usedIndices),
      isCorrect: isCorrect ?? this.isCorrect,
      letterCorrectness: letterCorrectness ?? List.from(this.letterCorrectness),
      isAnswerComplete: isAnswerComplete ?? this.isAnswerComplete,
    );
  }
}

class SusunHurufViewmodel extends ChangeNotifier {
  // DIUBAH: Buat 2 list: satu untuk master data, satu untuk soal di game
  final List<HijaiyahQuestion> _allQuestions = susunHurufQuestions; // Master data semua soal
  List<HijaiyahQuestion> _questions = []; // Daftar soal yang sudah diacak untuk game saat ini

  int _currentQuestionIndex = 0;
  int _score = 0;
  int correctAnswers = 0;
  
  final Map<int, QuestionAnswer> _questionAnswers = {};

  List<String> _userAnswer = [];
  List<int> _usedIndices = [];
  bool _isCorrect = false;
  List<bool> _letterCorrectness = [];
  bool _isAnswerComplete = false;
  
  final Set<int> _answeredQuestions = {};

  VoidCallback? onGameFinished;
  // DIUBAH: Panggil method untuk mengacak soal di constructor
  SusunHurufViewmodel() {
    _initializeGameQuestions();
  }

  // BARU: Method untuk mengacak dan menyiapkan soal untuk game
  void _initializeGameQuestions() {
    // 1. Buat salinan dari master data soal
    final tempList = List<HijaiyahQuestion>.from(_allQuestions);
    // 2. Acak urutan salinan tersebut
    tempList.shuffle();
    // 3. Gunakan list yang sudah diacak sebagai soal untuk game
    _questions = tempList;
  }

  List<HijaiyahQuestion> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  List<String> get userAnswer => _userAnswer;
  List<int> get usedIndices => _usedIndices;
  List<bool> get letterCorrectness => _letterCorrectness;
  HijaiyahQuestion get currentQuestion => _questions[_currentQuestionIndex];
  bool get isCorrect => _isCorrect;
  bool get isAnswerComplete => _isAnswerComplete;
  bool get isCurrentAnswerCorrect => userAnswer.join('') == currentQuestion.correctAnswer;
  bool get isQuestionAnswered => _answeredQuestions.contains(_currentQuestionIndex);

  void addLetter(String letter, int index) {
    if (isQuestionAnswered) return;

    if (_userAnswer.length < currentQuestion.correctAnswer.length && !_usedIndices.contains(index)) {
      _userAnswer.add(letter);
      _usedIndices.add(index);
      checkAnswer();
      notifyListeners();
    }
  }

  void removeLastLetter() {
    if (isQuestionAnswered) return;

    if (!_isAnswerComplete && _userAnswer.isNotEmpty) {
      _userAnswer.removeLast();
      _usedIndices.removeLast();
      checkAnswer();
      notifyListeners();
    }
  }

  void removeLetterAtIndex(int answerIndex) {
    if (isQuestionAnswered) return;

    if (!_isAnswerComplete && answerIndex >= 0 && answerIndex < _userAnswer.length) {
      _userAnswer.removeAt(answerIndex);
      _usedIndices.removeAt(answerIndex);
      checkAnswer();
      notifyListeners();
    }
  }

  void checkAnswer() {
    String answer = _userAnswer.join();

    _letterCorrectness = List.generate(currentQuestion.correctAnswer.length, (i) {
      if (i >= _userAnswer.length) return false;
      return _userAnswer[i] == currentQuestion.correctAnswer[i];
    });

    bool wasCorrectBefore = _isCorrect;
    _isCorrect = (answer == currentQuestion.correctAnswer);
    _isAnswerComplete = _userAnswer.length == currentQuestion.correctAnswer.length;

    if (_isCorrect && !wasCorrectBefore && !_answeredQuestions.contains(_currentQuestionIndex)) {
      correctAnswers++;
      _score += 10;
      _answeredQuestions.add(_currentQuestionIndex);
    }
    if (_isAnswerComplete && !_isCorrect && !_answeredQuestions.contains(_currentQuestionIndex)) {
      _answeredQuestions.add(_currentQuestionIndex);
    }

    notifyListeners();
  }

  void _saveCurrentAnswer() {
    _questionAnswers[_currentQuestionIndex] = QuestionAnswer(
      userAnswer: List.from(_userAnswer),
      usedIndices: List.from(_usedIndices),
      isCorrect: _isCorrect,
      letterCorrectness: List.from(_letterCorrectness),
      isAnswerComplete: _isAnswerComplete,
    );
  }

  void _loadAnswerForQuestion(int questionIndex) {
    if (_questionAnswers.containsKey(questionIndex)) {
      final savedAnswer = _questionAnswers[questionIndex]!;
      _userAnswer = List.from(savedAnswer.userAnswer);
      _usedIndices = List.from(savedAnswer.usedIndices);
      _isCorrect = savedAnswer.isCorrect;
      _letterCorrectness = List.from(savedAnswer.letterCorrectness);
      _isAnswerComplete = savedAnswer.isAnswerComplete;
    } else {
      // Clear state for unanswered question
      _userAnswer.clear();
      _usedIndices.clear();
      _isCorrect = false;
      _letterCorrectness.clear();
      _isAnswerComplete = false;
    }
  }

  void nextQuestion() {

    if (_isAnswerComplete) {
      _saveCurrentAnswer();
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _loadAnswerForQuestion(_currentQuestionIndex);
      notifyListeners();
    } else {
      onGameFinished?.call();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {

      if (_isAnswerComplete || _userAnswer.isNotEmpty) {
        _saveCurrentAnswer();
      }

      _currentQuestionIndex--;
      _loadAnswerForQuestion(_currentQuestionIndex);
      notifyListeners();
    }
  }
  
  // DIUBAH: Tambahkan pemanggilan method pengacakan soal di sini
  void resetGame() {
    _initializeGameQuestions(); // <--- BARU: Acak lagi soalnya saat reset
    _currentQuestionIndex = 0;
    _score = 0;
    correctAnswers = 0;
    _userAnswer.clear();
    _usedIndices.clear();
    _isCorrect = false;
    _letterCorrectness.clear();
    _isAnswerComplete = false;
    _answeredQuestions.clear();
    _questionAnswers.clear();
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinished = callback;
  }
}