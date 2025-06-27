import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart';
import 'package:TajwidKidz/Game/viewmodel/susun%20huruf/susun_huruf_viewmodel2.dart';
import 'package:audioplayers/audioplayers.dart';

class SusunHurufGame2 extends StatefulWidget {
  const SusunHurufGame2({super.key});

  @override
  State<SusunHurufGame2> createState() => _SusunHurufGame2State();
}

class _SusunHurufGame2State extends State<SusunHurufGame2> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _speak(String? fileName) async {
    if (fileName == null || fileName.isEmpty) return;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audios/susun_huruf/level2/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 24.0;
    final containerWidth = screenWidth - 2 * horizontalPadding;

    return ChangeNotifierProvider(
      create: (_) => SusunHurufViewmodel2(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
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
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: Consumer<SusunHurufViewmodel2>(
                builder: (context, controller, _) {
                  final question = controller.currentQuestion;

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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SusunHurufGame2(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  });

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        width: containerWidth,
                        height: 570,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Back Button
                            Positioned(
                              top: 0,
                              left: 0,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, size: 30),
                                onPressed: controller.currentQuestionIndex == 0
                                    ? null
                                    : () {
                                        controller.previousQuestion();
                                      },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${controller.score} pts',
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Center(
                                  child: Text(
                                    'Soal ${controller.currentQuestionIndex + 1} dari ${controller.questions.length}',
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 22),
                                      alignment: Alignment.centerLeft,
                                      width: containerWidth * 0.55,
                                      height: 95,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 165, 214, 167),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        question.text,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      width: containerWidth * 0.25,
                                      height: 95,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 165, 214, 167),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        question.word,
                                        style: const TextStyle(
                                          fontSize: 31,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  children: [
                                    SizedBox(width: containerWidth * 0.45),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(0, 153, 241, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.volume_up, color: Colors.white, size: 28),
                                          onPressed: () {
                                            _speak(question.audioPath);
                                          },
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        onPressed: controller.isAnswerComplete || controller.isQuestionAnswered
                                            ? null
                                            : controller.removeLastLetter,
                                        icon: const Icon(Icons.backspace),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: List.generate(
                                    question.correctAnswer.length,
                                    (index) {
                                      int reversedIndex = question.correctAnswer.length - 1 - index;
                                      String letter = '';
                                      if (reversedIndex < controller.userAnswer.length) {
                                        letter = controller.userAnswer[reversedIndex];
                                      }
                                      bool isCorrect = false;
                                      if (reversedIndex < controller.letterCorrectness.length) {
                                        isCorrect = controller.letterCorrectness[reversedIndex];
                                      }

                                      Color color = const Color.fromRGBO(224, 224, 224, 1);
                                      if (controller.isAnswerComplete && letter.isNotEmpty) {
                                        color = isCorrect
                                            ? const Color.fromRGBO(90, 193, 120, 1)
                                            : const Color.fromRGBO(242, 125, 125, 1);
                                      }

                                      // Calculate maxWidth for answer tiles
                                      final maxTileWidth = (containerWidth - (question.correctAnswer.length) * 16) / 4;

                                      return Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Row(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(maxWidth: maxTileWidth),
                                              height: 74,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: color,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                letter,
                                                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            if (index < question.correctAnswer.length - 1) const SizedBox(width: 12),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Huruf Acak',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 10,
                                  children: List.generate(
                                    question.options.length,
                                    (index) => _buildLetterOption(
                                      context,
                                      controller,
                                      question.options[index],
                                      index,
                                      maxWidth: (containerWidth - 4 * 16) / 4, // 4 options, 3 gaps
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 12, left: 14, right: 14),
                        width: containerWidth,
                        height: 150,
                        decoration: BoxDecoration(
                          color: controller.isAnswerComplete
                              ? (controller.isCurrentAnswerCorrect
                                  ? const Color.fromRGBO(90, 193, 120, 1)
                                  : const Color.fromRGBO(242, 125, 125, 1))
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.isAnswerComplete)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                child: Text(
                                  controller.isCurrentAnswerCorrect
                                      ? 'Bagus sekali, Jawaban kamu sangat tepat!'
                                      : 'Yah sayang sekali, Jawaban kamu belum tepat!',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child: ElevatedButton(
                                  onPressed: controller.isAnswerComplete
                                      ? () {
                                          controller.nextQuestion();
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(0, 153, 241, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                    foregroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  child: const Text('Lanjut'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLetterOption(
    BuildContext context,
    SusunHurufViewmodel2 controller,
    String letter,
    int index, {
    required double maxWidth,
  }) {
    bool alreadyUsed = controller.usedIndices.contains(index) || controller.isQuestionAnswered;
    return GestureDetector(
      onTap: alreadyUsed
          ? null
          : () {
              controller.addLetter(letter, index);
            },
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        height: 74,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: alreadyUsed ? Colors.grey[400] : const Color.fromRGBO(224, 224, 224, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          letter,
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}