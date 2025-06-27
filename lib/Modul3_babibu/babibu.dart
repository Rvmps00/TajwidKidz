import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'aiu.dart';
import 'tatitu.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import '../model/audio_model.dart'; // Your AudioModel class file
import '../controller/audio_controller.dart'; // Your AudioController class file

class LearningBaBiBuWidget extends StatefulWidget {
  const  LearningBaBiBuWidget  ({super.key});

  static String routeName = 'Learningbabibu';
  static String routePath = '/learningbabibu';

  @override
  State<LearningBaBiBuWidget> createState() => _LearningBaBiBuWidgetState();
}

class _LearningBaBiBuWidgetState extends State<LearningBaBiBuWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  int selectedIndex = 1; // Index for the BottomNavigationBar
  late final AudioModel babibuAudioModel;
  late final AudioController audioController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    babibuAudioModel = AudioModel(label: 'BABIBU', fileName: 'Modul3/Ba Bi Bu.wav');
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
      await audioController.play(babibuAudioModel.fileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 47, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(
                          _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff, // pakai volumeHigh bukan volumeUp
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: _playPauseAudio,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Column(
                  children: [
                    Text(
                      'Level 3: Belajar mengenal Huruf \n Hijaiyah dengan Metode Fonetik',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ba',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.fast_rewind,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LearningAIUWidget()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.fast_forward,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LearningTaTituWidget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 260,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Babibu.png',
                      width: 333.9,
                      height: 207.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mic_sharp,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Coba Ucapkan Huruf \n Harakat!',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Text(
                        'Feedback AI: ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                            ),
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
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
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
    );
  }
}
