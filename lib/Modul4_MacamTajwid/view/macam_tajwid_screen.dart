import 'package:TajwidKidz/Modul4_MacamTajwid/puzzle/puzzle_reward_page4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:TajwidKidz/Modul4_MacamTajwid/viewmodel/macam_tajwid_viewmodel.dart';
import '/controller/audio_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            const FaIcon(FontAwesomeIcons.puzzlePiece,
                size: 40, color: Color(0xFF037A16)),
            const SizedBox(height: 15),
            Text(
              'Selamat telah menyelesaikan modul!',
              textAlign: TextAlign.center,
              style:
              GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
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
                foregroundColor: const Color(0xFFFAFDCB),
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PuzzleRewardPage4()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MacamTajwidScreen extends StatefulWidget {
  const MacamTajwidScreen({super.key});

  @override
  State<MacamTajwidScreen> createState() => _MacamTajwidScreenState();
}

class _MacamTajwidScreenState extends State<MacamTajwidScreen> {
  final AudioController _audioController = AudioController();
  String? _currentPlayingFile;
  bool _isPlaying = false;
  final ScrollController _scrollController = ScrollController();
  bool _isTimeDelayComplete = false;
  bool _hasScrolledToBottom = false;
  bool _isRewardVisible = false;

  @override
  void initState() {
    super.initState();
    _audioController.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
          if (!_isPlaying) _currentPlayingFile = null;
        });
      }
    });

    // --- PERBAIKAN 1: Ubah durasi ke waktu yang singkat untuk pengujian ---
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        print("LOG: Timer 5 detik selesai.");
        _isTimeDelayComplete = true;
        _checkAndShowReward();
      }
    });

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // --- PERBAIKAN 2: Gunakan '>=' agar lebih fleksibel ---
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      if (!_hasScrolledToBottom) {
        print("LOG: Scroll sudah sampai bawah.");
        _hasScrolledToBottom = true;
        _checkAndShowReward();
      }
    }
  }

  void _checkAndShowReward() {
    if (_isTimeDelayComplete && _hasScrolledToBottom && !_isRewardVisible) {
      print("LOG: Semua kondisi terpenuhi, menampilkan reward.");
      setState(() {
        _isRewardVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _audioController.dispose();
    super.dispose();
  }

  TextSpan _buildStyledText(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    final List<TextSpan> spans = [];
    text.splitMapJoin(
      arabicRegex,
      onMatch: (m) {
        spans.add(TextSpan(
          text: m.group(0),
          style: const TextStyle(fontSize: 28, color: Colors.black, height: 1.5),
        ));
        return '';
      },
      onNonMatch: (nm) {
        spans.add(TextSpan(
          text: nm,
          style: const TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
        ));
        return '';
      },
    );
    return TextSpan(children: spans);
  }

  bool _isSpecialTajwid(String title) {
    return title.contains('Qalqalah') || title.contains('Tafkhim') || title.contains('Tarqiq');
  }

  Widget _buildAudioButton(String file) {
    final isThisPlaying = _currentPlayingFile == file && _isPlaying;
    return IconButton(
      icon: Image.asset(
        isThisPlaying
            ? 'assets/images/icon_pause_green.png'
            : 'assets/images/icon_speaker_green.png',
        width: 30,
        height: 30,
      ),
      onPressed: () async {
        if (isThisPlaying) {
          await _audioController.pause();
        } else {
          setState(() {
            _currentPlayingFile = file;
          });
          await _audioController.setSource(file);
          await _audioController.play();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MacamTajwidViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Macam - Macam Tajwid"),
          backgroundColor: const Color(0xFF037A16),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Stack(
          children: [
            Consumer<MacamTajwidViewModel>(
              builder: (context, viewModel, child) {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                  itemCount: viewModel.tajwidList.length,
                  itemBuilder: (context, index) {
                    final tajwid = viewModel.tajwidList[index];
                    final isOdd = (index + 1) % 2 != 0;
                    final backgroundColor = isOdd ? const Color(0xFFDDEB9D) : const Color(0xFFFAFDCB);
                    return Card(
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${tajwid.number}.",
                                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(tajwid.title,
                                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                      if (tajwid.otherTitle.isNotEmpty)
                                        Text(tajwid.otherTitle,
                                            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.volume_up_rounded, size: 28, color: Colors.green),
                                  onPressed: () {
                                    final ttsText =
                                        "${tajwid.title} ${tajwid.otherTitle}. Huruf yang Berpengaruh: ${tajwid.influentialLetter}. Cara Baca: ${tajwid.howToRead}.";
                                    viewModel.speak(ttsText, forceIndonesian: true);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            const Text("Huruf yang Berpengaruh :", style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            RichText(text: _buildStyledText(tajwid.influentialLetter)),
                            const SizedBox(height: 16),
                            const Text("Cara Baca:", style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(tajwid.howToRead, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Contoh Kata:", style: TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  children: _isSpecialTajwid(tajwid.title)
                                      ? tajwid.exampleAudio
                                      .take(2)
                                      .map((file) => _buildAudioButton(file))
                                      .toList()
                                      : [
                                    if (tajwid.exampleAudio.isNotEmpty)
                                      _buildAudioButton(tajwid.exampleAudio.first),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ...List.generate(tajwid.exampleWord.length, (i) {
                              final examples = tajwid.exampleWord[i];
                              final images = tajwid.exampleImage[i];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(examples.length, (j) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: [
                                        if (images.length > j && images[j].isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Image.asset(images[j], height: 35),
                                          ),
                                        Expanded(
                                          child: Text(
                                            examples[j],
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
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