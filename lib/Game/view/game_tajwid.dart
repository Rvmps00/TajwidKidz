import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Game/data/game_tajwid_question.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart';
import 'package:TajwidKidz/Game/viewmodel/game_tajwid_viewmodel.dart';

class GameTajwid extends StatelessWidget {
  const GameTajwid({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameTajwidViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFFAADBE9),
        appBar: AppBar(
            title: Text('Mini Game'),
            backgroundColor: Color(0xFF037A16),
          ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Consumer<GameTajwidViewModel>(
              builder: (context, controller, _) {
                final question = controller.currentQuestion;
                final FlutterTts flutterTts = FlutterTts();
                final currentQuestionAnswer = controller.getCurrentQuestionAnswer();

                return Center(
                  child: Container(
                    height: 629,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        // Back Button
                        Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, size: 30),
                            onPressed: (controller.level == 1 && controller.currentIndexInLevel == 0)
                                ? null
                                : () {
                                    controller.previousQuestion();
                                  },
                          ),
                        ),

                        Column(
                          children: [
                            Text(
                              'Level ${controller.level}: ${controller.levelName}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Soal ${controller.currentIndexInLevel + 1} dari 2',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 24),
                            
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: parseArabicWithHighlight(
                                      question.question,
                                      highlightColor: Color(0xFFBFE5FC), // Warna highlight biru muda
                                    ),
                                  ),

                                  const SizedBox(height: 24),
                                  
                                  GestureDetector(
                                    onTap: (controller.isRecording ||
                                    (currentQuestionAnswer != null && (currentQuestionAnswer.result.isNotEmpty)))
                                    ? null
                                    : () {
                                      controller.startListening();
                                    },
                                    child: Image.asset(
                                      (currentQuestionAnswer != null && currentQuestionAnswer.result.isNotEmpty)
                                          ? 'assets/images/icon_mic_disable.png'
                                          : controller.isRecording
                                              ? 'assets/images/icon_mic_recording.png'
                                              : 'assets/images/icon_mic.png',
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  GestureDetector(
                                    onTap: () async {
                                      await flutterTts.setLanguage("ar");
                                      await flutterTts.speak(question.word);
                                    },
                                    child: Image.asset(
                                      'assets/images/icon_speaker.png',
                                      width: 60,
                                    ),
                                  ),

                                  const SizedBox(height: 0),
                                ],
                              ),
                            ),

                            const Spacer(),

                            if (currentQuestionAnswer != null && currentQuestionAnswer.result.isNotEmpty && currentQuestionAnswer.result.contains("benar"))
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Color(0XFF5AC178),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Bacaan benar! Tajwid jelas!",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                            if (currentQuestionAnswer != null && currentQuestionAnswer.result.isNotEmpty && currentQuestionAnswer.result.contains("kurang"))
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Color(0XFFFF6E83),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Bacaan kurang jelas",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                            if (currentQuestionAnswer != null && currentQuestionAnswer.errorMessage.isNotEmpty)
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  currentQuestionAnswer.errorMessage,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            
                            const SizedBox(height: 16),
                            
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: controller.isRecording || !(currentQuestionAnswer != null && currentQuestionAnswer.result.isNotEmpty)
                                    ? null
                                    : () {
                                        if (controller.isFinished) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ResultScreen(
                                                score: controller.score,
                                                benar: controller.correctAnswers,
                                                totalQuestions: gameTajwidQuestions
                                                    .map((q) => q.questions.length)
                                                    .reduce((a, b) => a + b),
                                                onRetry: () {
                                                  controller.reset();
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (_) => const GameTajwid()),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        } else {
                                          controller.nextQuestion();
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0099F1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Lanjut',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

TextSpan parseArabicWithHighlight(String text, {Color highlightColor = const Color(0xFFBFE5FC)}) {
  List<TextSpan> spans = [];

  final regex = RegExp(r"'(.*?)'");
  int currentIndex = 0;

  for (final match in regex.allMatches(text)) {
    // Tambahkan teks sebelum highlight
    if (match.start > currentIndex) {
      spans.add(TextSpan(
        text: text.substring(currentIndex, match.start),
        style: const TextStyle(
          fontSize: 40,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ));
    }

    final highlightedText = match.group(1);
    spans.add(TextSpan(
      text: highlightedText,
      style: TextStyle(
        backgroundColor: highlightColor,
        fontSize: 40,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ));

    currentIndex = match.end;
  }

  if (currentIndex < text.length) {
    spans.add(TextSpan(
      text: text.substring(currentIndex),
      style: const TextStyle(
        fontSize: 40,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ));
  }

  return TextSpan(children: spans);
}