import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:TajwidKidz/Game/models/question_model.dart';
import 'package:TajwidKidz/Game/view/result_screen.dart';
import 'package:TajwidKidz/Game/viewmodel/tebak%20huruf/tebak_huruf_viewmodel2.dart';
import 'package:audioplayers/audioplayers.dart';

bool isArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}

class TebakHurufGame2 extends StatefulWidget {
  const TebakHurufGame2({super.key});

  @override
  State<TebakHurufGame2> createState() => _TebakHurufGame2State();
}

class _TebakHurufGame2State extends State<TebakHurufGame2> {
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
    return ChangeNotifierProvider(
      create: (_) => TebakHurufViewmodel2(),
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
                  constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Center(
                      child: Consumer<TebakHurufViewmodel2>(
                        builder: (context, controller, _) {
                          if (controller.questions.isEmpty) return const CircularProgressIndicator();

                          controller.setOnGameFinished(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(
                              score: controller.score,
                              totalQuestions: controller.questions.length,
                              benar: controller.correctAnswers,
                              onRetry: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TebakHurufGame2())),
                            ),
                            ),
                            );
                          });

                          final question = controller.currentQuestion;

                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildHeader(controller),
                                // RENDER UI BERDASARKAN TIPE SOAL YANG BENAR
                                if (question.type == QuestionType.listenAndChooseText)
                                  _buildUI_LihatHurufPilihAudio(context, controller)
                                else
                                  _buildUI_DengarAudioPilihTeks(context, controller),

                                _buildFeedbackArea(context, controller),
                                const SizedBox(height: 24),
                                _buildNextButton(controller),
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

  // --- WIDGET BUILDER UTAMA ---

  Widget _buildHeader(TebakHurufViewmodel2 controller) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text('${controller.score} pts', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Text('Soal ${controller.currentIndex + 1} dari ${controller.questions.length}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
      ],
    );
  }

  // UI Tipe 1: LIHAT HURUF VISUAL, PILIH OPSI AUDIO
  Widget _buildUI_LihatHurufPilihAudio(BuildContext context, TebakHurufViewmodel2 controller) {
    final question = controller.currentQuestion;
    final flutterTts = FlutterTts();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(question.text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        // Menampilkan huruf arab sebagai soal
        Text(question.questionWord ?? '', style: const TextStyle(fontSize: 120, fontFamily: 'LPMQ')),
        const SizedBox(height: 24),
        // Opsi jawaban berupa audio
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.0, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemBuilder: (context, index) {
            return _buildAudioOptionBox(context, controller, question.options[index], question.optionsAudioPath?[index]);
          },
        ),
        const SizedBox(height: 20),
        // Tombol kunci jawaban
        if (!controller.isAnswered)
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, disabledBackgroundColor: Colors.orange.shade200),
              onPressed: controller.tentativeSelectedAnswer == null ? null : () => controller.answer(),
              child: const Text("Kunci Jawaban", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
      ],
    );
  }

  // UI Tipe 2: DENGAR AUDIO + LIHAT GAMBAR/NOTES, PILIH OPSI TEKS
  Widget _buildUI_DengarAudioPilihTeks(BuildContext context, TebakHurufViewmodel2 controller) {
    final question = controller.currentQuestion;
    final flutterTts = FlutterTts();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(question.text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        // Stimulus multi-modal (audio, gambar, notes)
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.volume_up),
                label: const Text("Dengarkan Soal"),
                onPressed: () => _speak(question.audioPath),
              ),
              if (question.questionImagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset(question.questionImagePath!, height: 80, errorBuilder: (c, e, s) => const Text("Gagal memuat gambar")),
                ),
              if (question.questionNotes != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(question.questionNotes!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                )
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Opsi jawaban berupa teks arab
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.0, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemBuilder: (context, index) {
            return _buildTextOptionBox(context, controller, question.options[index]);
          },
        ),
      ],
    );
  }

  // --- Widget Opsi Jawaban & Feedback ---

  Widget _buildTextOptionBox(BuildContext context, TebakHurufViewmodel2 controller, String option) {
    // ... (kode dari respons sebelumnya, sudah benar) ...
    final isAnswered = controller.isAnswered;
    final correctAnswer = controller.currentQuestion.correctAnswer;
    final selectedAnswer = controller.selectedAnswer;
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    if (isAnswered) {
      if (option == correctAnswer) {
        bgColor = Colors.green.shade100; borderColor = Colors.green;
      } else if (option == selectedAnswer) {
        bgColor = Colors.red.shade100; borderColor = Colors.red;
      }
    }
    return InkWell(
      onTap: isAnswered ? null : () => controller.answer(option), // Langsung menjawab
      child: Container(
        decoration: BoxDecoration(color: bgColor, border: Border.all(color: borderColor, width: 2), borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(option, style: const TextStyle(fontSize: 40, fontFamily: 'LPMQ'))),
      ),
    );
  }

  Widget _buildAudioOptionBox(BuildContext context, TebakHurufViewmodel2 controller, String option, String? optionAudioPath) {
    // ... (kode dari respons sebelumnya, sudah benar) ...
    final isAnswered = controller.isAnswered;
    final isTentativelySelected = controller.tentativeSelectedAnswer == option;
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    double borderWidth = 2.0;
    if (isAnswered) {
      final correctAnswer = controller.currentQuestion.correctAnswer;
      final selectedAnswer = controller.selectedAnswer;
      if (option == correctAnswer) {
        bgColor = Colors.green.shade100; borderColor = Colors.green;
      } else if (option == selectedAnswer) {
        bgColor = Colors.red.shade100; borderColor = Colors.red;
      }
    } else if (isTentativelySelected) {
      borderColor = Colors.orange; borderWidth = 3.0; bgColor = Colors.orange.shade50;
    }
    return InkWell(
      onTap: isAnswered ? null : () {
        _speak(optionAudioPath);
        controller.selectOption(option); // Memilih sementara
      },
      child: Container(
        decoration: BoxDecoration(color: bgColor, border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(12)),
        child: Center(child: Icon(Icons.volume_up, size: 40, color: Colors.blue.shade700)),
      ),
    );
  }

  Widget _buildFeedbackArea(BuildContext context, TebakHurufViewmodel2 controller) {
    final question = controller.currentQuestion;
    if (!controller.isAnswered) return const SizedBox.shrink();

    final isCorrect = controller.selectedAnswer == question.correctAnswer;

    // Untuk Tipe 1 (listenAndChooseText), tampilkan feedback lengkap jika benar
    if (question.type == QuestionType.listenAndChooseText && isCorrect) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            const Text("Hebat! Jawabanmu Benar!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            if (question.feedbackImagePath != null) ...[
              const SizedBox(height: 12),
              Image.asset(question.feedbackImagePath!, height: 80),
            ],
            if (question.feedbackNotes != null) ...[
              const SizedBox(height: 12),
              Text(question.feedbackNotes!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            ],
          ],
        ),
      );
    }

    // Untuk semua kasus salah ATAU kasus benar pada Tipe 2, tampilkan teks simpel
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        isCorrect ? "Hebat! Jawabanmu Benar!" : "Yuk coba lagi!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isCorrect ? Colors.green : Colors.red),
      ),
    );
  }

  Widget _buildNextButton(TebakHurufViewmodel2 controller) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: controller.isAnswered ? Colors.blue : Colors.grey),
        onPressed: controller.isAnswered ? () => controller.nextQuestion() : null,
        child: const Text('Lanjut', style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

}