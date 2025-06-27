import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tatitu.dart'; // Import TaTitu Widget for back navigation
import 'jajiju.dart'; // Import next level widget for forward navigation
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import 'package:TajwidKidz/learning.dart';

class LearningTsaTsiTsuWidget extends StatefulWidget {
  const LearningTsaTsiTsuWidget({super.key});

  static String routeName = 'Learningtsatsitsu';
  static String routePath = '/learningtsatsitsu';

  @override
  State<LearningTsaTsiTsuWidget> createState() => _LearningTsaTsiTsuWidgetState();
}

class _LearningTsaTsiTsuWidgetState extends State<LearningTsaTsiTsuWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  bool _isPlaying = false; // Track audio playing state

  // Function to handle play/pause audio
  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pause the audio
    } else {
      await _audioPlayer.play(AssetSource('audios/modul3/Sa Si Su(1).wav')); // Play the Tsa sound
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  int selectedIndex = 1; // Index for the BottomNavigationBar

  // Function to handle bottom navigation
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose audio player
    super.dispose();
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
          backgroundColor: const Color(0xFF037A16),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LearningWidget()),
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Level 3:Belajar Mengenal \n Huruf Hijaiyah  ( Fonetik) ',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: FaIcon(
                  _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: _playPauseAudio, // Play or pause audio when pressed
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      'Belajar mengenal  Huruf Hijaiyah (Tsa Tsi Tsu)',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tsa',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Fast Rewind Button to navigate to LearningTaTituWidget (previous level)
                      IconButton(
                        icon: const Icon(
                          Icons.fast_rewind,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LearningTaTituWidget(),
                            ),
                          );
                        },
                      ),
                      // Fast Forward Button to navigate to LearningJaJiJuWidget (next level)
                      IconButton(
                        icon: const Icon(
                          Icons.fast_forward,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LearningJaJiJuWidget(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 310,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Tsatsitsu.png',
                      width: 333.9,
                      height: 207.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
