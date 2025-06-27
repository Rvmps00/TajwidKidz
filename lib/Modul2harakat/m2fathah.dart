import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import 'm2fathahtain.dart'; // Import LearningFathahtainWidget (next level)
import 'package:TajwidKidz/learning.dart';



class LearningFathahWidget extends StatefulWidget {
  const LearningFathahWidget({super.key});

  static String routeName = 'LearningFathah';
  static String routePath = '/learningFathah';

  @override
  State<LearningFathahWidget> createState() => _LearningFathahWidgetState();
}

class _LearningFathahWidgetState extends State<LearningFathahWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  bool _isPlaying = false; // Track audio playing state

  // Function to handle play/pause audio for speaker button
  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pause the audio
    } else {
      await _audioPlayer.play(AssetSource('audios/modul2/Fathah.mp4')); // Play the Fathah sound
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // Function to handle bottom navigation
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 1; // Index for the BottomNavigationBar

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
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
                  'Level 2 Belajar Mengenal \n Harakat',
                  style: const TextStyle(
                    color: Colors.white,  // Set text color to white
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,  // Handle long text
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: FaIcon(
                  _isPlaying ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
                  color: Colors.white, // White color for icon
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
                      ' Belajar Mengenal Harakat',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pengenalan Harakat Fathah',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Fast Rewind Button to navigate to LearningFathahTainWidget (previous level)
                      IconButton(
                        icon: const Icon(
                          Icons.fast_rewind,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {

                        },
                      ),
                      // Fast Forward Button to navigate to the next level (if any)
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
                              builder: (context) => const LearningFathahtainWidget(),
                            ),
                          );
                          // Add next level navigation here
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 350,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Fathah.png',
                      width: 333.9,
                      height: 207.2,
                      fit: BoxFit.cover,
                    ),
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
