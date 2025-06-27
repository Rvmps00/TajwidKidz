import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart';
import 'package:TajwidKidz/Game/viewmodel/game_tajwid/game_tajwid_viewmodel2.dart';
import 'package:audioplayers/audioplayers.dart';

class GameTajwid2 extends StatefulWidget {
  const GameTajwid2({super.key});

  @override
  State<GameTajwid2> createState() => _GameTajwid2State();
}

class _GameTajwid2State extends State<GameTajwid2> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _speak(String? fileName) async {
    if (fileName == null || fileName.isEmpty) return;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audios/tajwid/level2/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameTajwid2ViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFFAADBE9),
        appBar: AppBar(
          title: const Text(
            'Mini Game',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // 3. Buat AppBar juga transparan dan hilangkan shadow
          backgroundColor: Color(0xFF037A16),
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Consumer<GameTajwid2ViewModel>(
              builder: (context, controller, _) {
                if (controller.questions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                final question = controller.currentQuestion;
                final flutterTts = FlutterTts();

                // Set callback untuk navigasi saat game selesai
                controller.setOnGameFinished(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        score: controller.score,
                        benar: controller.correctAnswers,
                        totalQuestions: controller.questions.length,
                        onRetry: () {
                          controller.resetGame();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const GameTajwid2()));
                        },
                      ),
                    ),
                  );
                });

                return Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Bagian atas (Soal)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(question.ruleName, style: const TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Text('Soal ${controller.currentIndex + 1} dari ${controller.questions.length}', style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: parseArabicWithHighlight(
                                  question.verse,
                                  highlightColor: Colors.cyan.shade100,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Column(
                              children: [
                                _buildInteractionButton(
                                  iconPath: 'assets/images/icon_speaker.png',
                                  onTap: () {
                                    _speak(question.audioPath);
                                  },
                                ),
                                const SizedBox(height: 24),
                                _buildInteractionButton(
                                  iconPath: controller.isRecording
                                      ? 'assets/images/icon_mic_recording.png'
                                      : (controller.isQuestionAnswered // PERBAIKAN DI SINI
                                          ? 'assets/images/icon_mic_disable.png'
                                          : 'assets/images/icon_mic.png'),
                                  onTap: controller.isQuestionAnswered || controller.isRecording // PERBAIKAN DI SINI
                                      ? null
                                      : () => controller.startListening(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                        // Bagian bawah (Feedback dan Tombol Lanjut)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildFeedbackArea(controller),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                // onPressed: controller.isQuestionAnswered // PERBAIKAN DI SINI
                                //     ? () => controller.nextQuestion()
                                //     : null,
                                onPressed: () { controller.nextQuestion(); },
                                child: const Text('Lanjut', style: TextStyle(fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildInteractionButton({required String iconPath, required VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(iconPath),
    );
  }

  Widget _buildFeedbackArea(GameTajwid2ViewModel controller) {
    // PERBAIKAN: Gunakan `isQuestionAnswered` dan `currentAnswer`
    if (!controller.isQuestionAnswered) {
      return const SizedBox(height: 60); // Jaga ruang agar layout stabil
    }
    
    final answer = controller.currentAnswer!;
    final question = controller.currentQuestion;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: answer.isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(minHeight: 60),
      child: Text(
        answer.isCorrect ? question.positiveFeedback : question.correctiveFeedback,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: answer.isCorrect ? Colors.green.shade800 : Colors.red.shade800,
        ),
      ),
    );
  }
}

// Pastikan helper ini ada di file terpisah atau di file yang sama
TextSpan parseArabicWithHighlight(String text, {Color highlightColor = Colors.cyan}) {
  List<TextSpan> spans = [];
  final regex = RegExp(r'"(.*?)"');
  int currentIndex = 0;

  for (final match in regex.allMatches(text)) {
    if (match.start > currentIndex) {
      spans.add(TextSpan(
        text: text.substring(currentIndex, match.start),
        style: const TextStyle(fontSize: 32, fontFamily: 'LPMQ', color: Colors.black),
      ));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: TextStyle(
        backgroundColor: highlightColor,
        fontSize: 32,
        fontFamily: 'LPMQ',
        color: Colors.black,
      ),
    ));
    currentIndex = match.end;
  }

  if (currentIndex < text.length) {
    spans.add(TextSpan(
      text: text.substring(currentIndex),
      style: const TextStyle(fontSize: 32, fontFamily: 'LPMQ', color: Colors.black),
    ));
  }
  return TextSpan(children: spans);
}