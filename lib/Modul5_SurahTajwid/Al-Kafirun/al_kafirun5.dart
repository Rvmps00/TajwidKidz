import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'al_kafirun4.dart';
import 'al_kafirun6.dart';
import 'package:audioplayers/audioplayers.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAlkafirun5Widget extends StatefulWidget {
  const LearningAlkafirun5Widget ({super.key});

  static String routeName = 'Learningal_ikhlas5';
  static String routePath = '/learningal_ikhla5';

  @override
  State<LearningAlkafirun5Widget> createState() => _LearningAlkafirun5WidgetState();
}

class _LearningAlkafirun5WidgetState extends State<LearningAlkafirun5Widget > {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel kafirun5AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
  super.initState();

  kafirun5AudioModel = AudioModel(
    label: 'Kafirun5',
    fileName: 'Modul5/Al-Kafirun/Ayat 5.wav',
  );
  audioController = AudioController();

  // ✅ Preload audio di sini
  audioController.setSource(kafirun5AudioModel.fileName);

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
  'Pelafalan ghunnah pada “antum” masih terdengar kurang halus. Coba latih transisi bunyi dengan sedikit dengungan.',
  'Panjang mad pada “maa” perlu lebih diperhatikan agar tidak terdengar terlalu cepat atau pendek.',
  'Qalqalah pada huruf ba masih kurang mantap. Latih pantulan suara pada akhir bacaan agar terdengar jelas dan seimbang.'
  ];

  final List<String> midFeedbacks = [
    'Bacaanmu cukup baik! Namun masih bisa diperbaiki sedikit pada mad dan pantulan huruf ba agar tajwid lebih sempurna.',
    'Dengungan pada huruf nun sudah terasa, tinggal ditingkatkan agar lebih stabil dan tidak terputus.',
    'Coba ulangi bagian “aʿbud” dengan memperhatikan qalqalah dan ketukan suara agar lebih tegas namun tidak berlebihan.'
  ];

  final List<String> highFeedbacks = [
    'MashaAllah! Bacaanmu sangat baik, ghunnah, mad, dan qalqalah semua terdengar jelas dan sesuai aturan.',
    'Pelafalanmu sangat fasih! Panjang pendek huruf, dengungan, dan pantulan semuanya presisi. Teruskan latihan rutin.',
    'Bacaan tajwid kamu sudah nyaris sempurna untuk ayat ini. Terus pertahankan konsistensi suara dan irama seperti ini!'
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
                  'Surah Al - Kafirun \nAyat Ke-5',
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
                            MaterialPageRoute(builder: (context) => const LearningAlkafirun4Widget()),
                          );// Anda bisa tambahkan navigasi ke halaman sebelumnya jika ada
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningAlkafirun6Widget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: width * 0.9,
                  height: height * 0.78,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Al-Kafirun5.png',
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
                              folderPath: 'recordings/Module5/Al-Kafirun',
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
                              final fullPath = 'recordings/Module5/Al-Kafirun/${currentAudio!.fileName}';
                              final result = await _evaluationController.evaluateFromFirebasePath(fullPath);

                              if (result != null) {
                                final expectedRules = ['Mad', 'Ghunnah']; // ✅ sesuaikan per ayat
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
