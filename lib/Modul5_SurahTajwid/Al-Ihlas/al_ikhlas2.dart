import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'al_ikhlas1.dart';
import 'al_ikhlas3.dart';
import 'package:audioplayers/audioplayers.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAlikhlas2Widget extends StatefulWidget {
  const LearningAlikhlas2Widget({super.key});

  static String routeName = 'Learningal_ikhlas2';
  static String routePath = '/learningal_ikhlas2';

  @override
  State<LearningAlikhlas2Widget> createState() => _LearningAlikhlas2WidgetState();
}

class _LearningAlikhlas2WidgetState extends State<LearningAlikhlas2Widget> {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel ikhlas2AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
  super.initState();

  ikhlas2AudioModel = AudioModel(
    label: 'Ikhlas2',
    fileName: 'Modul5/Al-Ikhlas/Ayat 2.wav',
  );
  audioController = AudioController();

  // ✅ Preload audio di sini
  audioController.setSource(ikhlas2AudioModel.fileName);

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
  'Perhatikan pelafalan huruf ṣād dalam “ṣṣamad”, karena sifat tafkhim-nya belum cukup kuat. Coba latih agar terdengar lebih tebal dan mantap.',
  'Idgham syamsiyyah pada lafaz “As-Shamad” belum terdengar jelas. Pastikan lam syamsiyyah tidak dibaca dan huruf shad ditasydid.',
  'Panjang pendek vokal pada lafaz “Allah” perlu diperbaiki agar bacaan terasa lebih natural dan tidak tergesa-gesa.'
  ];

  final List<String> midFeedbacks = [
    'Bacaanmu sudah cukup baik! Namun, pelafalan huruf tebal seperti ṣād bisa dibuat lebih mantap agar karakter huruf lebih terasa.',
    'Idgham sudah mulai terdengar, tapi masih bisa lebih diperhalus agar transisi antar huruf lebih lembut dan alami.',
    'Mad pada lafaz “Allah” sudah cukup baik, tapi bisa dilatih lagi agar panjangnya konsisten dalam setiap bacaan.'
  ];

  final List<String> highFeedbacks = [
    'MashaAllah! Bacaanmu sangat jelas. Idgham syamsiyyah dan mad terdengar sempurna, dan pelafalan huruf-huruf tebal sangat presisi.',
    'Pelafalan “As-Shamad” sangat bagus! Transisi antar huruf berjalan mulus dan tafkhim huruf shad terasa tepat.',
    'Kamu sudah membacanya dengan sangat fasih. Semua unsur tajwid dalam ayat ini terdengar jelas dan konsisten. Teruskan!'
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
    final height = MediaQuery.of(context).size.height;

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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                Text(
                  'Surah Al - Ikhlas \nAyat Ke-2',
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
                            MaterialPageRoute(builder: (context) => const LearningAlikhlas1Widget()),
                          );// Anda bisa tambahkan navigasi ke halaman sebelumnya jika ada
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningAlikhlas3Widget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: width * 0.9,
                  height: height * 0.68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Al-Ikhlas 2.png',
                      width: width * 0.8,
                      height: height * 0.44,
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
                              folderPath: 'recordings/Module5/Al-Ikhlas',
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
                              final fullPath = 'recordings/Module5/Al-Ikhlas/${currentAudio!.fileName}';
                              final result = await _evaluationController.evaluateFromFirebasePath(fullPath);

                              if (result != null) {
                                final expectedRules = ['Mad']; // ✅ sesuaikan per ayat
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),

        // Jika tidak ingin BottomNavigationBar, hapus kode ini:
        // bottomNavigationBar: ...
      ),
    );
  }
}
