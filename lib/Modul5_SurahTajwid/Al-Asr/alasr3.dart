import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart'; // Tambah audioplayers
import 'alasr2.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAlasr3Widget extends StatefulWidget {
  const LearningAlasr3Widget({super.key});

  static String routeName = 'Learningalasr3';
  static String routePath = '/learningalasr3';

  @override
  State<LearningAlasr3Widget> createState() => _LearningAlasr3WidgetState();
}

class _LearningAlasr3WidgetState extends State<LearningAlasr3Widget> {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel alasr3AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    alasr3AudioModel = AudioModel(label: 'Alasr3', fileName: 'Modul5/Al-Asr/Ayat 1.wav');
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
      await audioController.play(alasr3AudioModel.fileName);
    }
  }

  final List<String> lowFeedbacks = [
    'Pelafalan idgham syamsiyah seperti pada “ash-shaalihaat” dan “ash-shabri” masih kurang jelas. Coba latih kembali penekanan pada huruf syamsiyah agar lebih tegas.',
    'Perhatikan bacaan mad di “aamanuu”, vokalnya masih kurang panjang. Latihan menarik napas secara stabil bisa membantu.',
    'Qalqalah pada “bil-haqqi” belum terdengar mantap. Pastikan pantulan huruf “qaaf” keluar dari makhraj-nya dengan jelas dan tidak datar.'
  ];

  final List<String> midFeedbacks = [
    'Idgham syamsiyahmu sudah cukup baik, tapi masih bisa ditingkatkan dengan memberi penekanan yang lebih lembut dan menyatu antar huruf.',
    'Panjang mad di “aamanuu” sudah terdengar, namun usahakan iramanya tidak naik-turun secara drastis.',
    'Secara umum bacaanmu bagus. Kamu bisa menguatkan bagian qalqalah agar lebih hidup dan terdengar jelas tanpa terlalu keras.'
  ];

  final List<String> highFeedbacks = [
    'Bacaanmu sudah sangat fasih! Idgham syamsiyah dan mad thabi’i kamu lantunkan dengan nada yang halus dan penuh kontrol. Pertahankan!',
    'MashaAllah! Setiap hukum tajwid dalam ayat ini terdengar harmonis. Qalqalah, idgham, dan mad semua dipraktikkan dengan benar.',
    'Tajwid dalam bacaan ini terdengar sangat teratur. Panjang pendek vokal seimbang dan transisi antar huruf syamsiyah berjalan sangat mulus.'
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
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFDCB),
        appBar: AppBar(
          backgroundColor: const Color(0xFF037A16),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Level 5 : Belajar Membaca\nSurah dengan Tajwid',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
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
                    'Surah Al - Asr \nAyat Ke-3',
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
                              MaterialPageRoute(builder: (context) => const LearningAlasr2Widget()),
                            );
                            // Tambahkan navigasi ke halaman sebelumnya jika ada
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: width * 0.9,
                    height: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Alasr3.png',
                        width: width * 0.9,
                        height: 300,
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
                            });
                          }
                        } else if (currentAudio != null) {
                          final url = await _recordController.stopAndUpload(currentAudio!, folderPath: 'recordings/Module5/Al-Asr');
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

                              final fullPath = 'recordings/Module5/Al-Asr/${currentAudio!.fileName}';
                              final result = await _evaluationController.evaluateFromFirebasePath(fullPath);

                              if (result != null) {
                                  // Expected tajwid rules in this ayat
                                  final expectedRules = ['Mad', 'Ghunnah']; // ubah sesuai ayat
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
      ),
    );
  }
}
