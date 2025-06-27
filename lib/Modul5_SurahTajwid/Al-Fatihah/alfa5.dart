import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'alfa4.dart';
import 'alfa6.dart';
import 'package:audioplayers/audioplayers.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAlfatihah5Widget extends StatefulWidget {
  const LearningAlfatihah5Widget({super.key});

  static String routeName = 'LearningAlfa5';
  static String routePath = '/learningAlfa5';

  @override
  State<LearningAlfatihah5Widget> createState() => _LearningAlfatihah5WidgetState();
}

class _LearningAlfatihah5WidgetState extends State<LearningAlfatihah5Widget> {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel alfa5AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    alfa5AudioModel = AudioModel(label: 'Alfa5', fileName: 'Modul5/Al-Fatihah/Ayat 5.wav');
    audioController = AudioController();

    // Listen to player state and update _isPlaying
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
      await audioController.play(alfa5AudioModel.fileName);
    }
  }

  void _navigateTo(int page) {
    switch (page) {
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LearningAlfatihah4Widget()),
        );
        break;
      case 5:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LearningAlfatihah6Widget()),
        );
        break;
    }
  }

  final List<String> lowFeedbacks = [
    'Perhatikan pelafalan huruf shad dan lam syamsiyah, karena masih terdengar kurang jelas. Cobalah latih pelafalan “ash-shiraath” secara perlahan.',
    'Qalqalah pada huruf seperti “qaaf” atau “daal” belum cukup mantap. Coba latih pantulan suara agar lebih tegas dan tidak terlalu datar.',
    'Masih terdengar ketidakteraturan dalam panjang pendek vokal. Fokuskan perhatian pada pelafalan huruf mad dan idgham agar bacaan terasa lebih tenang.'
  ];

  final List<String> midFeedbacks = [
    'Kamu sudah berada di jalur yang baik! Namun, pelafalan huruf tajwid seperti shad dan lam bisa lebih ditegaskan agar terdengar lebih fasih.',
    'Qalqalahmu sudah cukup terasa, tapi bisa dilatih agar tidak terlalu keras atau terlalu lemah. Jaga juga keseimbangan panjang vokal di setiap lafadz.',
    'Secara umum bacaanmu bagus, tapi masih bisa ditingkatkan di bagian lam syamsiyah. Coba ulangi “ash-shiraath” dan perhatikan penekanan hurufnya.'
  ];

  final List<String> highFeedbacks = [
    'Bacaanmu sangat baik! Pelafalan tajwid seperti idgham syamsiyah dan mad sudah tepat dan terasa alami. Terus lanjutkan dengan konsistensi.',
    'MashaAllah! Huruf-huruf berat seperti shad dan qaf dilafalkan dengan baik. Transisi antar huruf pun terdengar halus dan tepat.',
    'Artikulasi bacaanmu sangat bagus. Mad dan qalqalah terdengar jelas tanpa berlebihan, dan irama bacaan sangat tenang dan mantap.'
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
    final size = MediaQuery.of(context).size;

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
              color: Colors.black,
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
              children: [
                const SizedBox(height: 10),

                Text(
                  'Surah Al - Fatihah\nAyat Ke-5',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
                ),

                const SizedBox(height: 30),

                // Navigation buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fast_rewind, size: 30, color: Colors.black),
                        onPressed: () => _navigateTo(3),
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                        onPressed: () => _navigateTo(5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Image container
                Container(
                  width: size.width * 0.94,
                  height: 650,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Alfatihah_5.png',
                      width: size.width * 0.8,
                      height: size.height * 0.436,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Mic and instruction text
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
                            });
                          }
                        } else if (currentAudio != null) {
                          final url = await _recordController.stopAndUpload(currentAudio!, folderPath: 'recordings/Module5/Al-Fatihah');
                          if (url != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Uploaded! Link: $url')),
                          );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Upload failed')),
                            );
                          }
                          setState(() => isRecording = false);
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

                // Feedback AI input
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
                        maxLines: null, // ← membuatnya fleksibel tinggi
                        decoration: InputDecoration(
                          hintText: '...............',
                          filled: true,
                          fillColor: const Color(0xFFFAFDCB),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(12),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.refresh, color: Colors.black),
                            onPressed: () async {
                              if (currentAudio == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Belum ada audio untuk dievaluasi')),
                                );
                                return;
                              }

                              final fullPath = 'recordings/Module5/Al-Fatihah/${currentAudio!.fileName}';
                              final result = await _evaluationController.evaluateFromFirebasePath(fullPath);

                              if (result != null) {
                                  // Expected tajwid rules in this ayat
                                  final expectedRules = ['Mad']; // ubah sesuai ayat
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
                                    _textController1.text = 'Evaluasi gagal.';
                                });
                              }
                            },
                          ),
                        ),
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
                        cursorColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
