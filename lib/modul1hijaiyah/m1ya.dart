import 'package:TajwidKidz/modul1hijaiyah/puzzle_reward_page1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'm1haa.dart';
import 'puzzle_reward_page1.dart';
import 'package:TajwidKidz/learning.dart';

// Widget Kartu Reward
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
          children: [
            const FaIcon(FontAwesomeIcons.puzzlePiece, size: 40, color: Color(0xFF037A16)),
            const SizedBox(height: 15),
            Text('Selamat telah menyelesaikan modul!', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Kamu mendapatkan bagian puzzle!', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.card_giftcard),
              label: const Text('Klaim Hadiah Puzzle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: const Color(0xFFFAFDCB),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PuzzleRewardPage1()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LearningYaWidget extends StatefulWidget {
  const LearningYaWidget({super.key});
  static String routeName = 'LearningYa';
  static String routePath = '/learningYa';

  @override
  State<LearningYaWidget> createState() => _LearningYaWidgetState();
}

class _LearningYaWidgetState extends State<LearningYaWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  late final ScrollController _scrollController;
  bool _isRewardVisible = false;

  // --- PERBAIKAN DI SINI ---
  // Gabungkan kedua logika ke dalam SATU initState
  @override
  void initState() {
    super.initState(); // Wajib dipanggil pertama

    // 1. Logika untuk ScrollController
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // 2. Logika untuk Timer
    // Timer ini akan berjalan bersamaan dengan listener scroll.
    // Kartu akan muncul mana yang lebih dulu terpenuhi: scroll ke bawah atau 8 detik.
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && !_isRewardVisible) { // Cek jika kartu belum muncul
        setState(() {
          _isRewardVisible = true;
        });
      }
    });
  }

  void _onScroll() {
    // Cek jika posisi scroll sudah mendekati paling bawah
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 && !_isRewardVisible) {
      if (mounted) {
        setState(() {
          _isRewardVisible = true;
        });
      }
    }
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/modul1/ya_28.wav'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _scrollController.removeListener(_onScroll); // Praktik terbaik: hapus listener
    _scrollController.dispose();
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
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Pengenalan Huruf Hijaiyah', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text('Ya (Y)', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600)),
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
                                MaterialPageRoute(builder: (context) => const LearningHaaWidget()),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.fast_forward, color: Colors.black, size: 25),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 183.67,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/Card Ya.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/images/m1/m1ya.png', fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Penjelasan Huruf Ya (ي):', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text('Makhraj:\nTengah-tengah lidah dengan langit-langit.', style: GoogleFonts.inter(fontSize: 16)),
                          const SizedBox(height: 20),
                          Text('Sifat-Sifatnya:', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text('1. Nafas ditahan (Jahr)', style: GoogleFonts.inter(fontSize: 16)),
                          Text('2. Lunak dan suara tidak tertahan (Rakhawah)', style: GoogleFonts.inter(fontSize: 16)),
                          Text('3. Lidah dibawah (Istifal)', style: GoogleFonts.inter(fontSize: 16)),
                          Text('4. Terbuka antara lidah dan langit-langit atas (Infitah)', style: GoogleFonts.inter(fontSize: 16)),
                          Text('5. Tidak lancar dan hati-hati (Ishmat)', style: GoogleFonts.inter(fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150),
                  ],
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
      ),
    );
  }
}