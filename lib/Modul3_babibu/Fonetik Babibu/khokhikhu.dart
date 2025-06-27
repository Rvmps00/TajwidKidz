import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart'; // Ensure this is added to your pubspec.yaml
import 'hahihu.dart'; // Import the previous level widget
import 'dadidu.dart'; // Import the next level widget
import 'package:TajwidKidz/learning.dart';

class LearningKhoKhiKhuWidget extends StatefulWidget {
  const LearningKhoKhiKhuWidget({super.key});

  static String routeName = 'Learningkhokhikhu';
  static String routePath = '/learningkhokhikhu';

  @override
  State<LearningKhoKhiKhuWidget> createState() => _LearningKhoKhiKhuWidgetState();
}

class _LearningKhoKhiKhuWidgetState extends State<LearningKhoKhiKhuWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  bool _isPlaying = false; // Track audio playing state

  // Function to handle play/pause audio
  Future<void> _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pause the audio
    } else {
      await _audioPlayer.play(AssetSource('audios/modul3/Kho Khi Khu.mp4')); // Play the Ja Ji Ju sound
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
            icon: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LearningWidget()), // Fix the navigation
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Level 3: Belajar mengenal \n Huruf  Hijaiyah (Fonetik)',
                  style: const TextStyle(color: Colors.white),
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
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: const BoxDecoration(color: Color(0xFFFAFDCB)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 10),

                  // Title and subtitle
                  Column(
                    children: [
                      Text(
                        'Belajar mengenal Huruf Hijaiyah (Kho Khi Khu) ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Kho',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Navigation rewind and forward
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fast_rewind, color: Colors.black, size: 30),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningHaHiHuWidget()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, color: Colors.black, size: 30),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningDaDiDuWidget()),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Image
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Khokhikhu.png',
                        fit: BoxFit.cover,
                      ),
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
