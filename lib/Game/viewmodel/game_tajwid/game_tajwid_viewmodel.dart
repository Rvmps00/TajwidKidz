import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:TajwidKidz/Game/data/game_tajwid_question.dart';
import 'package:TajwidKidz/Game/models/question_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';

class QuestionAnswer {
  final String result;
  final String errorMessage;
  final String userAnswer;
  bool isCorrect;

  QuestionAnswer({
    required this.result,
    required this.errorMessage,
    required this.userAnswer,
    required this.isCorrect,
  });
}

class GameTajwidViewModel extends ChangeNotifier {
  List<GameTajwidQuestion> _shuffledGameData = [];

  int _currentLevelIndex = 0;
  int _currentQuestionIndex = 0;
  int score = 0;
  int correctAnswers = 0;
  bool _isRecording = false;
  bool _isFinished = false;

  final Map<String, QuestionAnswer> _questionAnswers = {};

  GameTajwidViewModel() {
    _initializeAndShuffleQuestions();
  }

  void _initializeAndShuffleQuestions() {
    final newGameData = <GameTajwidQuestion>[];

    for (final originalLevel in gameTajwidQuestions) {
      final shuffledQuestionsForLevel =
          List<TajwidQuestion>.from(originalLevel.questions)..shuffle();

      final newShuffledLevel = GameTajwidQuestion(
        level: originalLevel.level,
        levelName: originalLevel.levelName,
        questions: shuffledQuestionsForLevel,
      );
      newGameData.add(newShuffledLevel);
    }

    _shuffledGameData = newGameData;
  }

  GameTajwidQuestion get currentLevel => _shuffledGameData[_currentLevelIndex];

  TajwidQuestion get currentQuestion => currentLevel.questions[_currentQuestionIndex];
  int get level => currentLevel.level;
  String get levelName => currentLevel.levelName;
  int get currentIndexInLevel => _currentQuestionIndex;
  bool get isRecording => _isRecording;
  bool get isFinished => _isFinished;

  String _getQuestionKey() => 'L${_currentLevelIndex}_Q${_currentQuestionIndex}';

  QuestionAnswer? getCurrentQuestionAnswer() {
    return _questionAnswers[_getQuestionKey()];
  }

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

  bool get isQuestionAnswered {
    final answer = getCurrentQuestionAnswer();
    return answer != null && answer.result.isNotEmpty;
  }

  Future<void> requestMicPermission() async {
    final status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  Future<void> startListening() async {
    final currentAnswer = getCurrentQuestionAnswer();
    if (currentAnswer != null && currentAnswer.result.isNotEmpty) return;

    final recorder = AudioRecordController();
    final audio = await recorder.startRecording();

    if (audio == null) {
      _saveQuestionAnswer(
        result: "",
        errorMessage: "Izin mikrofon ditolak atau gagal mulai rekaman.",
        userAnswer: "",
        isCorrect: false,
      );
      notifyListeners();
      return;
    }

    _isRecording = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 5));

    final folder = 'recordings/Game';
    await recorder.stopAndUpload(audio, folderPath: folder);
    final fullPath = '$folder/${audio.fileName}';


    _isRecording = false;
    notifyListeners();

    _saveQuestionAnswer(
      result: "⏳ Menilai bacaan kamu...",
      errorMessage: "",
      userAnswer: fullPath,
      isCorrect: false,
    );
    notifyListeners();

    // ✅ Wait until file is ready on Firebase before evaluating
    final isReady = await _waitUntilFirebaseFileAccessible(fullPath);
    if (isReady) {
      await _evaluateWithRetry(fullPath, maxRetries: 2);
    } else {
      _saveQuestionAnswer(
        result: "",
        errorMessage: "❌ Gagal mengakses file audio di Firebase.",
        userAnswer: fullPath,
        isCorrect: false,
      );
    }
    
    notifyListeners();
  }

  Future<bool> _waitUntilFirebaseFileAccessible(String fullpath,
      {int maxRetries = 5}) async {
    int attempt = 0;
    while (attempt < maxRetries) {
      try {
        final ref = FirebaseStorage.instance.ref(fullpath);
        final url = await ref.getDownloadURL();
        if (url.isNotEmpty) return true;
      } catch (_) {
        // ignore and retry
      }

      attempt++;
      await Future.delayed(const Duration(seconds: 2));
    }
    return false;
  }

  Future<void> _evaluateWithRetry(String fullPath, {int maxRetries = 3}) async {
  int attempt = 0;
  while (attempt < maxRetries) {
    try {
      print("📡 Attempting evaluation for: $fullPath (attempt ${attempt + 1})");

      final result = await EvaluationController().evaluateFromFirebasePath(fullPath);

      final madScore = result?.mad ?? 0.0;
      final ghunnahScore = result?.ghunnah ?? 0.0;
      final ikhfaaScore = result?.ikhfa ?? 0.0;

      final isCorrect = madScore > 0.30 || ghunnahScore > 0.30 || ikhfaaScore > 0.30;

      print("✅ Evaluation result: mad=$madScore, ghunnah=$ghunnahScore, ikhfaa=$ikhfaaScore");
      print("🎯 Is Correct? $isCorrect");

      if (isCorrect) {
      correctAnswers++;
      score += 10; // atau poin lain sesuai ketentuan
    }

      _saveQuestionAnswer(
        result: 'Mad: $madScore, Ghunnah: $ghunnahScore, Ikhfaa: $ikhfaaScore',
        errorMessage: "",
        userAnswer: fullPath,
        isCorrect: isCorrect,
      );
      return;
    } catch (e) {
      print("⚠️ Evaluation failed on attempt ${attempt + 1}: $e");
      attempt++;
      if (attempt >= maxRetries) {
        _saveQuestionAnswer(
          result: "",
          errorMessage: "❌ Evaluasi gagal setelah $attempt percobaan. Error: ${e.toString()}",
          userAnswer: fullPath,
          isCorrect: false,
        );
        notifyListeners();
        break;
      }

      await Future.delayed(const Duration(seconds: 2));
    }
  }
}

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

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    } else if (_currentLevelIndex > 0) {
      _currentLevelIndex--;
      _currentQuestionIndex = currentLevel.questions.length - 1;
    }
    notifyListeners();
  }

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
