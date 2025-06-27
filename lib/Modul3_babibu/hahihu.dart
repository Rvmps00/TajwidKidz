import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart'; // Tambah ini kalau belum ada
import 'jajiju.dart';
import 'khokhikhu.dart';
import '../model/audio_model.dart'; // Your AudioModel class file
import '../controller/audio_controller.dart'; // Your AudioController class file

class LearningHaHiHuWidget extends StatefulWidget {
  const LearningHaHiHuWidget({super.key});

  static String routeName = 'Learninghahihtu';
  static String routePath = '/learninghahihtu';

  @override
  State<LearningHaHiHuWidget> createState() => _LearningHaHiHuWidgetState();
}

class _LearningHaHiHuWidgetState extends State<LearningHaHiHuWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel hahihuAudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    hahihuAudioModel = AudioModel(label: 'HAHIHU', fileName: 'Modul3/ha hi hu.wav');
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
    _textController.dispose();
    _textFieldFocusNode.dispose();
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
      await audioController.play(hahihuAudioModel.fileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFDCB),
        appBar: AppBar(
          title: const Text('Level 3: Belajar mengenal \n Huruf Hijaiyah (Ba Bi Bu)'),
          backgroundColor: const Color(0xFF037A16),
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: const BoxDecoration(color: Color(0xFFFAFDCB)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tombol Back dan Speaker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: FaIcon(
                          _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: _playPauseAudio,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Judul dan subtitle
                  Column(
                    children: [
                      Text(
                        'Level 3: Belajar mengenal Huruf \n Hijaiyah dengan Metode Fonetik',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ha',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Tombol navigasi rewind dan forward
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fast_rewind, color: Colors.black, size: 30),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningJaJiJuWidget()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, color: Colors.black, size: 30),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningKhoKhiKhuWidget()),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Gambar utama
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Hahihu.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Mic dan instruksi ucapkan harakat
                  Row(
                    children: [
                      const Icon(Icons.mic_sharp, color: Colors.black, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        'Coba Ucapkan Harakat!',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Feedback AI input
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback AI:',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _textController,
                          focusNode: _textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '...............',
                            filled: true,
                            fillColor: const Color(0xFFFAFDCB),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],
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
