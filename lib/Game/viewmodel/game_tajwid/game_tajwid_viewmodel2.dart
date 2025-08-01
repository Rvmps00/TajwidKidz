import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../data/game_tajwid_question.dart';
import '../../models/question_model.dart';
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';

class TajwidAnswer2 {
  final bool isCorrect;
  final String userAnswer;
  final String result;
  final String errorMessage;

  TajwidAnswer2({
    required this.isCorrect,
    required this.userAnswer,
    required this.result,
    required this.errorMessage,
  });
}

class GameTajwid2ViewModel extends ChangeNotifier {
  final List<TajwidLevel2Question> _allQuestions = tajwidLevel2Questions;
  List<TajwidLevel2Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;
  bool _isRecording = false;
  bool isFinished = false;

  final Map<int, TajwidAnswer2> _answers = {};
  TajwidAnswer2? get currentAnswer => _answers[_currentIndex];

  List<TajwidLevel2Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  TajwidLevel2Question get currentQuestion => _questions[_currentIndex];
  int get score => _score;
  int get correctAnswers => _correctAnswers;
  bool get isRecording => _isRecording;
  bool get isQuestionAnswered => _answers.containsKey(_currentIndex);

  VoidCallback? onGameFinished;

  GameTajwid2ViewModel() {
    _initializeGameQuestions();
  }

  void _initializeGameQuestions() {
    final tempList = List<TajwidLevel2Question>.from(_allQuestions);
    tempList.shuffle();
    _questions = tempList;
  }

  Future<void> startListening() async {
    final currentAnswer = _answers[_currentIndex];
    if (currentAnswer != null && currentAnswer.result.isNotEmpty) return;

    final permission = await Permission.microphone.request();
    if (!permission.isGranted) {
      _saveQuestionAnswer(
        result: "",
        errorMessage: "Izin mikrofon ditolak.",
        userAnswer: "",
        isCorrect: false,
      );
      notifyListeners();
      return;
    }

    final recorder = AudioRecordController();
    final audio = await recorder.startRecording();

    if (audio == null) {
      _saveQuestionAnswer(
        result: "",
        errorMessage: "Gagal memulai rekaman.",
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
        // retry
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
        final result = await EvaluationController().evaluateFromFirebasePath(fullPath);

        final madScore = result?.mad ?? 0.0;
        final ghunnahScore = result?.ghunnah ?? 0.0;
        final ikhfaaScore = result?.ikhfa ?? 0.0;

        final isCorrect = madScore > 0.30 || ghunnahScore > 0.30 || ikhfaaScore > 0.30;

        if (isCorrect) {
          _correctAnswers++;
          _score += 10;
        }

        _saveQuestionAnswer(
          result: 'Mad: $madScore, Ghunnah: $ghunnahScore, Ikhfaa: $ikhfaaScore',
          errorMessage: "",
          userAnswer: fullPath,
          isCorrect: isCorrect,
        );
        return;
      } catch (e) {
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

  void _saveQuestionAnswer({
    required String result,
    required String errorMessage,
    required String userAnswer,
    required bool isCorrect,
  }) {
    _answers[_currentIndex] = TajwidAnswer2(
      result: result,
      errorMessage: errorMessage,
      userAnswer: userAnswer,
      isCorrect: isCorrect,
    );
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
    _isRecording = false;
    isFinished = false;
    _answers.clear();
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinished = callback;
  }
}
