import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'hahihu.dart';
import 'dadidu.dart';
import '../model/audio_model.dart'; // Your AudioModel class file
import '../controller/audio_controller.dart'; // Your AudioController class file

class LearningKhoKhiKhuWidget extends StatefulWidget {
  const LearningKhoKhiKhuWidget({super.key});

  static String routeName = 'Learningkhokhikhu';
  static String routePath = '/learningkhokhikhu';

  @override
  State<LearningKhoKhiKhuWidget> createState() => _LearningKhoKhiKhuWidgetState();
}

class _LearningKhoKhiKhuWidgetState extends State<LearningKhoKhiKhuWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel khokhikhuAudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    khokhikhuAudioModel = AudioModel(label: 'KHOKHIKHU', fileName: 'Modul3/Kho Khi Khu.wav');
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
      await audioController.play(khokhikhuAudioModel.fileName);
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
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: const BoxDecoration(color: Color(0xFFFAFDCB)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Baris tombol Back & Volume
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: FaIcon(
                          _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                          size: 30,
                          color: Colors.black,
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
                        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Kho',
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Tombol navigasi rewind & forward
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
                              MaterialPageRoute(builder: (_) => const LearningHaHiHuWidget()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.fast_forward, size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const LearningDaDiDuWidget()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Gambar utama
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Khokhikhu.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Mic dan instruksi ucapkan Harakat
                  Row(
                    children: [
                      const Icon(Icons.mic_sharp, size: 30, color: Colors.black),
                      const SizedBox(width: 10),
                      Text(
                        'Coba Ucapkan Harakat!',
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Feedback AI input
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                    child: Row(
                      children: [
                        Text(
                          'Feedback AI:',
                          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _textController,
                            focusNode: _textFieldFocusNode,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: '...............',
                              hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFAFDCB),
                            ),
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                            cursorColor: Colors.black,
                          ),
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
