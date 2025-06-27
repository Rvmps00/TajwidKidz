import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart';
import 'package:TajwidKidz/Game/viewmodel/susun%20huruf/susun_huruf_viewmodel3.dart';
import 'package:audioplayers/audioplayers.dart';

class SusunHurufGame3 extends StatefulWidget {
  const SusunHurufGame3({super.key});

  @override
  State<SusunHurufGame3> createState() => _SusunHurufGame3State();
}

class _SusunHurufGame3State extends State<SusunHurufGame3> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _speak(String? fileName) async {
    if (fileName == null || fileName.isEmpty) return;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audios/susun_huruf/level3/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 24.0;
    final containerWidth = screenWidth - 2 * horizontalPadding;

    return ChangeNotifierProvider(
      // Gunakan ViewModel Level 3
      create: (_) => SusunHurufViewmodel3(),
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
            builder: (context, viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
                    child: Center(
                      child: Consumer<SusunHurufViewmodel3>(
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
                                        builder: (_) => const SusunHurufGame3(),
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
                                // Hapus tinggi tetap agar container bisa menyesuaikan isinya
                                // height: 570,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  children: [
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
                                      mainAxisSize: MainAxisSize.min, // Agar column menyesuaikan tinggi konten
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
                                                question.text, // "Susun huruf ini..."
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
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(0, 153, 241, 1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(Icons.volume_up, color: Colors.white, size: 32),
                                                  onPressed: () {
                                                    _speak(question.audioPath);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 14),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: controller.isAnswerComplete || controller.isQuestionAnswered
                                                  ? null
                                                  : controller.removeLastLetter,
                                              icon: const Icon(Icons.backspace),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        // --- PERBAIKAN UTAMA DI SINI ---
                                        SizedBox(
                                          height: 74, // Beri tinggi tetap untuk area jawaban
                                          child: Directionality(
                                            textDirection: TextDirection.rtl, // Set arah ke kanan-ke-kiri
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              // reverse: true, // Tidak lagi diperlukan
                                              itemCount: question.correctAnswer.length,
                                              separatorBuilder: (context, index) => const SizedBox(width: 12),
                                              itemBuilder: (context, index) {
                                                // Logika untuk menampilkan kotak jawaban
                                                String letter = '';
                                                if (index < controller.userAnswer.length) {
                                                  // Logika dipermudah, cukup gunakan index
                                                  letter = controller.userAnswer[index];
                                                }
                                                bool isCorrect = false;
                                                if (index < controller.letterCorrectness.length) {
                                                  isCorrect = controller.letterCorrectness[index];
                                                }
                                                Color color = const Color.fromRGBO(224, 224, 224, 1);
                                                if (controller.isAnswerComplete && letter.isNotEmpty) {
                                                  color = isCorrect
                                                      ? const Color.fromRGBO(90, 193, 120, 1)
                                                      : const Color.fromRGBO(242, 125, 125, 1);
                                                }
                                                return Container(
                                                  width: 74, // Lebar tetap untuk setiap kotak jawaban
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: color,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Text(
                                                    letter,
                                                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Huruf Acak',
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          height: 160, // Beri tinggi yang cukup untuk 2 baris
                                          child: GridView.builder(
                                            itemCount: question.options.length,
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,      // 4 item per baris
                                              crossAxisSpacing: 10,   // Jarak horizontal
                                              mainAxisSpacing: 10,    // Jarak vertikal
                                              childAspectRatio: 1,      // Membuat item berbentuk persegi
                                            ),
                                            itemBuilder: (context, index) {
                                              return _buildLetterOption(
                                                context,
                                                controller,
                                                question.options[index],
                                                index,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Feedback Container
                              Container(
                                padding: const EdgeInsets.only(top: 20, bottom: 12, left: 14, right: 14),
                                width: containerWidth,
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
                                  mainAxisSize: MainAxisSize.min, // Agar menyesuaikan tinggi konten
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.isAnswerComplete)
                                      Text(
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
                                    SizedBox(height: controller.isAnswerComplete ? 12 : 0),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
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
                                          disabledBackgroundColor: Colors.grey.shade400,
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
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLetterOption(
    BuildContext context,
    SusunHurufViewmodel3 controller,
    String letter,
    int index,
  ) {
    bool alreadyUsed = controller.usedIndices.contains(index) || controller.isQuestionAnswered;
    return GestureDetector(
      onTap: alreadyUsed
          ? null
          : () {
              controller.addLetter(letter, index);
            },
      child: Container(
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