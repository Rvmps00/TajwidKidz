import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'm1sin.dart';
import 'm1shod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:TajwidKidz/learning.dart';

class LearningSyinWidget extends StatefulWidget {
  const LearningSyinWidget({super.key});

  static String routeName = 'LearningSyin';
  static String routePath = '/learningSyin';

  @override
  State<LearningSyinWidget> createState() => _LearningSyinWidgetState();
}

class _LearningSyinWidgetState extends State<LearningSyinWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/modul1/syin_12.wav'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _audioPlayer.dispose();
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
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Level 1 Belajar Huruf \n Hijaiyah',
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
                onPressed: _playPauseAudio,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Pengenalan Huruf Hijaiyah',
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Syin (S)',
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fast_rewind, color: Colors.black, size: 25),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningSinWidget()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fast_forward, color: Colors.black, size: 25),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LearningShodWidget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 183.67,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Card Syin.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Gambar tenggorokan cara baca Ta (With the throat image)
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9, // Restrict the width to screen size
                    height: 200.0, // Fixed height to fit the layout better
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/m1/m1syin.png', // Path to your image of the throat position for Ta
                        fit: BoxFit.contain,  // Adjusts the image to fit within the box
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDEB9D),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Penjelasan Huruf Syin (ش):',
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Tengah-tengah lidah dengan langit-langit atas',
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Sifat-Sifatnya:',
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text('1. Berdesis lepas (Hams)', style: GoogleFonts.inter(fontSize: 16)),
                      Text('2. Lunak dan suara tidak tertahan (Rakhawah)', style: GoogleFonts.inter(fontSize: 16)),
                      Text('3. Lidah dibawah (Istifal)', style: GoogleFonts.inter(fontSize: 16)),
                      Text('4. Terbuka antara lidah dan langit-langit atas (Infitah)', style: GoogleFonts.inter(fontSize: 16)),
                      Text('5. Tidak lancar dan hati-hati (Ishmat)', style: GoogleFonts.inter(fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
