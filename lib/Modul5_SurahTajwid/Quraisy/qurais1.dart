import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart'; // Tambah audioplayers
import 'qurais2.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningQurais1Widget extends StatefulWidget {
  const LearningQurais1Widget({super.key});

  static String routeName = 'Learningqurais1';
  static String routePath = '/learningqurais1';

  @override
  State<LearningQurais1Widget> createState() => _LearningQurais1WidgetState();
}

class _LearningQurais1WidgetState extends State<LearningQurais1Widget> {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel qurais1AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    qurais1AudioModel = AudioModel(label: 'Qurais1', fileName: 'Modul5/Al-Quraisy/Ayat 1.wav');
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
      await audioController.play(qurais1AudioModel.fileName);
    }
  }

  final List<String> lowFeedbacks = [
  'Coba latih kembali bacaan mad pada “ilāf” agar tidak terlalu singkat. Panjang vokal sebaiknya dijaga agar sesuai dua harakat.',
  'Huruf qaf perlu perhatian lebih. Suaranya harus mantap dan ada pantulan kecil yang jelas tanpa berlebihan.',
  'Masih terdengar ketidakteraturan dalam vokal panjang dan artikulasi. Cobalah latihan dengan tempo lebih lambat dan fokus pada qaf dan mad.'
  ];

  final List<String> midFeedbacks = [
    'Sudah cukup bagus, tapi mad bisa dibuat lebih stabil dan qaf bisa dilafalkan dengan pantulan yang lebih mantap.',
    'Pelafalan mad sudah baik namun masih sedikit terburu-buru. Jaga tempo bacaan agar lebih tenang.',
    'Qalqalah qaf sudah terasa, namun akan lebih baik jika pengucapannya sedikit lebih tegas. Mad juga bisa sedikit dipanjangkan.'
  ];

  final List<String> highFeedbacks = [
    'Bacaanmu sangat baik! Mad thabi’i terdengar jelas dan huruf qaf dilafalkan dengan tepat. Teruskan latihan dengan irama yang konsisten.',
    'Artikulasi kamu bagus sekali. Mad tidak tergesa dan qalqalah qaf terdengar mantap dan seimbang.',
    'MashaAllah, bacaan kamu penuh ketenangan dan kontrol vokal yang baik. Panjang pendek huruf dan pantulan qaf terdengar sangat bagus.'
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
                    'Surah Quraisy \nAyat Ke-1',
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
                            // Tambahkan navigasi ke halaman sebelumnya jika ada
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LearningQurais2Widget()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: width * 0.9,
                    height: 430,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Qurais1.png',
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
                          final url = await _recordController.stopAndUpload(currentAudio!, folderPath: 'recordings/Module5/Al-Quraisy');
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

                              final fullPath = 'recordings/Module5/Al-Quraisy/${currentAudio!.fileName}';
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
      ),
    );
  }
}
