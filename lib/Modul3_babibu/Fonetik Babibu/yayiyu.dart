import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'hahihu1.dart';
import 'package:TajwidKidz/learning.dart';
import 'package:TajwidKidz/Modul3_babibu/Fonetik%20Babibu/puzzle_reward_page3.dart';

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
                  MaterialPageRoute(builder: (context) => const PuzzleRewardPage3()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LearningYaYiYuWidget extends StatefulWidget {
  const LearningYaYiYuWidget({super.key});

  static String routeName = 'Learningyayiyu';
  static String routePath = '/learningyayiyu';

  @override
  State<LearningYaYiYuWidget> createState() => _LearningYaYiYuWidgetState();
}

class _LearningYaYiYuWidgetState extends State<LearningYaYiYuWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isRewardVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isRewardVisible = true;
      });
    });
  }

  Future<void> _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/modul3/Ya Yi Yu.mp4'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  int selectedIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
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
                MaterialPageRoute(builder: (context) => const LearningWidget()),
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Level 3: Belajar mengenal \n Huruf Hijaiyah (Fonetik)',
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: const BoxDecoration(color: Color(0xFFFAFDCB)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          'Belajar mengenal \n Huruf Hijaiyah (Ya Yi Yu)',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ya',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.fast_rewind, color: Colors.black, size: 30),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LearningHaHiHu1Widget()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.fast_forward, color: Colors.black, size: 30),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                          'assets/images/Yayiyu.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    );
  }
}
