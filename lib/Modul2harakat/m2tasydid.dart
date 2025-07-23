import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TajwidKidz/learning.dart';
import 'm2sukun.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:TajwidKidz/Modul2harakat/puzzle_reward_page2.dart';

class CompletionRewardCard extends StatelessWidget {
  const CompletionRewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(FontAwesomeIcons.puzzlePiece, size: 40, color: Color(0xFF037A16)),
            const SizedBox(height: 15),
            Text(
              'Selamat telah menyelesaikan modul!',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Kamu mendapatkan bagian puzzle!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.card_giftcard),
              label: const Text('Klaim Hadiah Puzzle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Color(0xFFFAFDCB),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PuzzleRewardPage2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LearningTasydidWidget extends StatefulWidget {
  const LearningTasydidWidget({super.key});
  static String routeName = 'Learningm2tasydid';
  static String routePath = '/learningm2tasydid';

  @override
  State<LearningTasydidWidget> createState() => _LearningTasydidWidgetState();
}

class _LearningTasydidWidgetState extends State<LearningTasydidWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isRewardVisible = false;

  @override
  void initState() {
    super.initState();

    // Delay 8 detik sebelum tampilkan kartu reward (tanpa suara)
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isRewardVisible = true;
      });
    });
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/modul2/Tasydid.mp4'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                  'Level 2 Belajar Mengenal \n Harakat',
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Belajar Mengenal Harakat',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pengenalan Harakat Tasydid',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.fast_rewind, color: Colors.black, size: 25),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LearningSukunWidget()),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.fast_forward, color: Colors.black, size: 25),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LearningTasydidWidget()),
                              );
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
                        child: Image.asset('assets/images/tasydid.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),

              // Kartu Reward muncul dari bawah setelah 8 detik (tanpa suara)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                bottom: _isRewardVisible ? 20 : -300,
                left: 0,
                right: 0,
                child: const CompletionRewardCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
