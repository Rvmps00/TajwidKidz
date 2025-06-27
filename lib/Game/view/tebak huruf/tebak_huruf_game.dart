// tebak_huruf_game.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart'; // sesuaikan path
import 'package:TajwidKidz/Game/viewmodel/tebak%20huruf/tebak_huruf_viewmodel.dart'; // sesuaikan path
import 'package:audioplayers/audioplayers.dart';

bool isArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}

class TebakHurufGame extends StatefulWidget {
  const TebakHurufGame({super.key});

  @override
  State<TebakHurufGame> createState() => _TebakHurufGameState();
}

class _TebakHurufGameState extends State<TebakHurufGame> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _speak(String? fileName) async {
    if (fileName == null || fileName.isEmpty) return;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audios/modul1/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 16.0;

    return ChangeNotifierProvider(
      create: (_) => TebakHurufViewmodel(),
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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
                    child: Center(
                      child: Consumer<TebakHurufViewmodel>(
                        builder: (context, controller, _) {
                          if (controller.questions.isEmpty) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          final question = controller.currentQuestion;

                          controller.setOnGameFinished(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  score: controller.score,
                                  totalQuestions: controller.questions.length,
                                  benar: controller.correctAnswers,
                                  onRetry: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TebakHurufGame()));
                                  },
                                ),
                              ),
                            );
                          });

                          final containerWidth = screenWidth - 2 * horizontalPadding;
                          final bool currentQuestionIsCorrectlyAnswered = controller.isAnswered && controller.selectedAnswer == question.correctAnswer;

                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            width: containerWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back, size: 30),
                                    onPressed: controller.currentIndex == 0
                                        ? null
                                        : () {
                                            controller.previousQuestion();
                                          },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min, // Penting agar Column hanya setinggi kontennya
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                                        child: Text(
                                          '${controller.score} pts',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Soal ${controller.currentIndex + 1} dari ${controller.questions.length}',
                                      style: const TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 20),
                                    // ... (Sisa konten Column seperti Row pertanyaan, ikon speaker, opsi, feedback) ...
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 165, 214, 167),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Text(
                                              question.text,
                                              maxLines: 2,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 165, 214, 167),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Text(
                                              question.word,
                                              style: TextStyle(
                                                fontSize: isArabic(question.word) ? 40 : 20,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                    const SizedBox(height: 28),

                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: _buildOption(context, controller, question.options[0], index: 0, maxWidth: (containerWidth - 8 - 28) / 2),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: _buildOption(context, controller, question.options[1], index: 1, maxWidth: (containerWidth - 8 - 28) / 2),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 8),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: _buildOption(context, controller, question.options[2], index: 2, maxWidth: (containerWidth - 8 - 28) / 2),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: _buildOption(context, controller, question.options[3], index: 3, maxWidth: (containerWidth - 8 - 28) / 2),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 14),

                                    if (controller.isAnswered)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                        child: currentQuestionIsCorrectlyAnswered
                                            ? Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
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

                                                  const SizedBox(height: 8),

                                                  const Text(
                                                    'Hebat! Jawabanmu benar!',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color.fromRGBO(90, 193, 120, 1),
                                                    ),
                                                  ),

                                                  const SizedBox(height: 8),

                                                  if (question.correctImagePath != null && question.correctImagePath!.isNotEmpty)
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                      child: Image.asset(
                                                        question.correctImagePath!,
                                                        height: 80,
                                                        errorBuilder: (context, error, stackTrace) {
                                                          return const Text('Gambar tidak ada', style: TextStyle(fontSize: 10));
                                                        },
                                                      ),
                                                    ),

                                                  const SizedBox(height: 8),

                                                  if (question.notes != null && question.notes!.isNotEmpty)
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 4.0),
                                                      child: Text(
                                                        question.notes!,
                                                        textAlign: TextAlign.center,
                                                        style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : Text(
                                                "Yuk coba lagi! Jawaban yang\nbenar adalah '${question.correctAnswer}'",
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(242, 125, 125, 1),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    const SizedBox(height: 24),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:10),
                                      child: SizedBox(
                                        width: containerWidth - 28,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: controller.isAnswered
                                                ? const Color.fromRGBO(0, 153, 241, 1)
                                                : const Color.fromRGBO(0, 102, 170, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: controller.isAnswered
                                              ? () {
                                                  controller.nextQuestion();
                                                }
                                              : null,
                                          child: const Text(
                                            'Lanjut',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


  Widget _buildOption(
    BuildContext context,
    TebakHurufViewmodel controller,
    String option, {
    required int index,
    double? maxWidth,
  }) {
    final bool isCurrentQuestionAnswered = controller.isAnswered;
    final String? currentSelectedAnswer = controller.selectedAnswer;
    final String correctAnswer = controller.currentQuestion.correctAnswer;

    Color bgColor = const Color.fromRGBO(224, 224, 224, 1);
    Color textColor = Colors.black;

    if (isCurrentQuestionAnswered) {
      if (option == correctAnswer) {
        bgColor = const Color.fromRGBO(90, 193, 120, 1);
        textColor = Colors.white;
      } else if (option == currentSelectedAnswer) {
        bgColor = const Color.fromRGBO(242, 125, 125, 1);
        textColor = Colors.white;
      }
    }

    return SizedBox(
      width: maxWidth,
      height: 100, 
      child: GestureDetector(
        onTap: isCurrentQuestionAnswered
            ? null
            : () {
                controller.answer(option);
              },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                left: 12,
                child: Text(
                  '${String.fromCharCode(65 + index)}.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: isArabic(option) ? 36 : 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}