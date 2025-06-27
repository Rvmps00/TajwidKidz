import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'annas5.dart';
import 'package:audioplayers/audioplayers.dart';
import '/model/audio_model.dart'; // Your AudioModel class file
import '/controller/audio_controller.dart'; // Your AudioController class file
import '/controller/audio_record_controller.dart';
import '/controller/evaluation_controller.dart';
import 'dart:math';

class LearningAnnas6Widget extends StatefulWidget {
  const LearningAnnas6Widget ({super.key});

  static String routeName = 'Learningannas6';
  static String routePath = '/learningannas6';

  @override
  State<LearningAnnas6Widget > createState() => _LearningAnnas6WidgetState();
}

class _LearningAnnas6WidgetState extends State<LearningAnnas6Widget > {
  final TextEditingController _textController1 = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final AudioRecordController _recordController = AudioRecordController();
  final EvaluationController _evaluationController = EvaluationController();
  bool isRecording = false;
  AudioModel? currentAudio;

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel annas6AudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    annas6AudioModel = AudioModel(label: 'Annas6', fileName: 'Modul5/An-Nas/Ayat 6.wav');
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
      await audioController.play(annas6AudioModel.fileName);
    }
  }

  final List<String> lowFeedbacks = [
  'Pelafalan ghunnah pada “an-nās” masih belum terdengar jelas. Cobalah latihan dengan memperpanjang dengungan dan menstabilkan suara.',
  'Coba perhatikan kembali idgham pada “minal-jinnati”. Perpindahan antar huruf belum cukup mulus dan masih terdengar terputus.',
  'Mad thabi’i pada bacaan seperti “jinnati” sebaiknya lebih diperjelas. Pastikan vokal tidak terlalu pendek atau tergesa.'
  ];

  final List<String> midFeedbacks = [
    'Sudah cukup bagus! Tapi ghunnah dan mad bisa lebih ditingkatkan agar bacaan terdengar lebih mantap dan merdu.',
    'Idgham kamu sudah mulai terasa, namun cobalah lebih menekankan peralihan antar huruf terutama antara nun dan lam.',
    'Secara keseluruhan cukup baik, tapi panjang vokal masih sedikit kurang konsisten. Latih dengan tempo perlahan akan membantu.'
  ];

  final List<String> highFeedbacks = [
    'MashaAllah! Bacaanmu sangat bagus, transisi antar huruf berjalan mulus dan ghunnah pun terdengar alami.',
    'Tajwid pada ayat ini sudah sangat rapi. Ghunnah, mad, dan idgham terdengar jelas dan stabil.',
    'Pelafalan kamu sangat mantap. Tidak ada bagian yang terburu-buru, dan panjang vokal sangat sesuai dengan aturan tajwid.'
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                Text(
                  'Surah An - Nas \nAyat Ke-6',
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
                            MaterialPageRoute(builder: (context) => const LearningAnnas5Widget()),
                          );// Anda bisa tambahkan navigasi ke halaman sebelumnya jika ada
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
                      'assets/images/An-nas 6.png',
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
                            });
                          }
                        } else if (currentAudio != null) {
                          final url = await _recordController.stopAndUpload(currentAudio!, folderPath: 'recordings/Module5/An-Nas');
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

                              final fullPath = 'recordings/Module5/An-Nas/${currentAudio!.fileName}';
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
