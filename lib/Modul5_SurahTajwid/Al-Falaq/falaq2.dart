import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'falaq1.dart';
import 'falaq3.dart';
import 'package:audioplayers/audioplayers.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAlfalaq2Widget extends StatefulWidget {
  const LearningAlfalaq2Widget({super.key});

  static String routeName = 'LearningFalaq2';
  static String routePath = '/learningFalaq2';

  @override
  State<LearningAlfalaq2Widget> createState() => _LearningAlfalaq2WidgetState();
}

class _LearningAlfalaq2WidgetState extends State<LearningAlfalaq2Widget> {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel falaq2AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
  super.initState();

  falaq2AudioModel = AudioModel(
    label: 'Falaq2',
    fileName: 'Modul5/Al-Falaq/Ayat 2.wav',
  );
  audioController = AudioController();

  // ✅ Preload audio di sini
  audioController.setSource(falaq2AudioModel.fileName);

  // Listen ke playerState
  audioController.playerStateStream.listen((state) {
    setState(() {
      _isPlaying = state == PlayerState.playing;
    });
  });
}

  @override
  void dispose() {
    _textController1.dispose();
    _textFieldFocusNode1.dispose();
    // Dispose audioController here if needed
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // current screen
        break;
      case 2:
        Navigator.pushNamed(context, '/progress');
        break;
      case 3:
        Navigator.pushNamed(context, '/account');
        break;
    }
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await audioController.pause();
    } else {
      await audioController.play(); // ✅ Jangan ulang set source
    }
  }

  final List<String> lowFeedbacks = [
    'Perhatikan bagian “min sharri”, karena ikhfa’-nya belum terdengar lembut. Cobalah latih dengan menyamarkan nun tanpa memutus aliran suara.',
    'Huruf qalqalah seperti “qaaf” di akhir “khalaq” terdengar terlalu datar. Latih pantulan suara dengan menekankan konsonan tanpa mengeraskan berlebihan.',
    'Panjang mad pada “maa” terdengar kurang stabil. Coba latih menarik vokal tanpa terburu-buru agar terasa alami dan tidak dipotong.'
  ];

  final List<String> midFeedbacks = [
    'Bacaanmu sudah baik, namun bagian ikhfa’ bisa lebih halus. Usahakan agar dengungan tidak terdengar seperti nun yang terlalu jelas.',
    'Coba pertahankan kestabilan pada vokal panjang seperti “maa”. Napas yang tenang sangat membantu membuat mad terdengar lebih merdu.',
    'Pelafalan qalqalah sudah mulai terasa, namun bisa ditingkatkan agar lebih tegas di akhir ayat. Latih pelafalan akhir “khalaq” agar mantap.'
  ];

  final List<String> highFeedbacks = [
    'MashaAllah, bacaanmu sangat fasih. Ikhfa’ diucapkan dengan lembut dan mad thabi’i pun dilafalkan dengan irama yang nyaman.',
    'Qalqalah dan mad sudah terdengar tepat. Irama bacaanmu tenang dan jelas, sangat menyenangkan untuk didengarkan.',
    'Bacaan ini dilafalkan dengan kejelasan dan kefasihan yang baik. Transisi antar hukum tajwid berjalan mulus dan alami.'
  ];

  String getRandomFeedback(List<String> rules, Map<String, double> scores) {
    final expectedScores = rules.map((rule) => scores[rule] ?? 0.0).toList();

    if (expectedScores.any((score) => score < 0.4)) {
      return lowFeedbacks[Random().nextInt(lowFeedbacks.length)];
    } else if (expectedScores.every((score) => score > 0.8)) {
      return highFeedbacks[Random().nextInt(highFeedbacks.length)];
    } else if (expectedScores.every((score) => score > 0.5)) {
      return midFeedbacks[Random().nextInt(midFeedbacks.length)];
    } else {
      return lowFeedbacks[Random().nextInt(lowFeedbacks.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFDCB),
        appBar: AppBar(
          backgroundColor: const Color(0xFF037A16),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Level 5 : Belajar Membaca\nSurah dengan Tajwid',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white, // Changed to white for better contrast
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: FaIcon(
                _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                size: 30,
                color: Colors.black,
              ),
              onPressed: _playPauseAudio,
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  Text(
                    'Surah Al - Falaq \nAyat Ke-2',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.fast_rewind, size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const LearningAlfalaq1Widget()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const LearningAlfalaq3Widget()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Al-falaq2.png',
                        width: width * 0.9,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isRecording ? Icons.stop : Icons.mic_sharp,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          if (!isRecording) {
                            final recorded = await _recordController.startRecording();
                            if (recorded != null) {
                              setState(() {
                                currentAudio = recorded;
                                isRecording = true;
                                _textController1.text = ''; // reset feedback
                              });
                            }
                          } else if (currentAudio != null) {
                            final url = await _recordController.stopAndUpload(
                              currentAudio!,
                              folderPath: 'recordings/Module5/Al-Ghunnah',
                            );

                            setState(() => isRecording = false);

                            if (url != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Uploaded!')),
                              );

                              // ⏳ Tampilkan loading sementara
                              setState(() {
                                _textController1.text = '⏳ Menilai bacaan kamu...';
                              });

                              // Evaluasi langsung
                              final fullPath = 'recordings/Module5/Al-Ghunnah/${currentAudio!.fileName}';
                              final result = await _evaluationController.evaluateFromFirebasePath(fullPath);

                              if (result != null) {
                                final expectedRules = ['Ghunnah', 'Mad']; // ✅ sesuaikan per ayat
                                final scores = {
                                  'Mad': result.mad,
                                  'Ghunnah': result.ghunnah,
                                  'Ikhfaa': result.ikhfa,
                                };
                                final feedback = getRandomFeedback(expectedRules, scores);
                                setState(() {
                                  _textController1.text = feedback.trim();
                                });
                              } else {
                                setState(() {
                                  _textController1.text = '❌ Evaluasi gagal.';
                                });
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('❌ Upload failed')),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Coba Ucapkan Huruf \nHijaiyah!',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback AI :',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _textController1,
                        focusNode: _textFieldFocusNode1,
                        autofocus: false,
                        obscureText: false,
                        readOnly: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '...............',
                          filled: true,
                          fillColor: const Color(0xFFFAFDCB),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(12),
                        ),
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
                        cursorColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                  const SizedBox(height: 40), // Space for comfortable scroll
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
