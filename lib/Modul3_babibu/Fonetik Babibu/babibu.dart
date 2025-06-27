import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'aiu.dart';  // Import AIU Widget for back navigation
import 'tatitu.dart';  // Import next level widget for forward navigation
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import 'package:TajwidKidz/learning.dart';

class LearningBaBiBuWidget extends StatefulWidget {
  const LearningBaBiBuWidget({super.key});

  static String routeName = 'Learningbabibu';
  static String routePath = '/learningbabibu';

  @override
  State<LearningBaBiBuWidget> createState() => _LearningBaBiBuWidgetState();
}

class _LearningBaBiBuWidgetState extends State<LearningBaBiBuWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  bool _isPlaying = false; // Track audio playing state

  // Function to handle play/pause audio
  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pause the audio
    } else {
      await _audioPlayer.play(AssetSource('audios/modul3/Ba Bi Bu.mp4')); // Play the Ba Bi Bu sound
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
          title: const Text(
            'Level 3:Belajar Mengenal \n  Huruf Hijaiyah (Fonetik) ',
            style: TextStyle(
              color: Colors.white, // Ubah warna teks header jadi putih
            ),
          ),
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
          actions: [
            IconButton(
              icon: FaIcon(
                _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                color: Colors.white,
                size: 25,
              ),
              onPressed: _playPauseAudio,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      'Belajar mengenal Huruf Hijaiyah (Ba Bi Bu)',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ba',
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
                              builder: (context) => const LearningAIUWidget(),
                            ),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LearningTaTituWidget(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
