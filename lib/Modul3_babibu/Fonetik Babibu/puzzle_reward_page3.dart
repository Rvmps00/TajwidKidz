import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:TajwidKidz/learning.dart';
import 'package:TajwidKidz/Progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PuzzlePiece {
  final int correctIndex;
  final Uint8List imageBytes;

  PuzzlePiece({required this.correctIndex, required this.imageBytes});
}

class PuzzleRewardPage3 extends StatefulWidget {
  const PuzzleRewardPage3({super.key});

  @override
  State<PuzzleRewardPage3> createState() => _PuzzleRewardPage3State();
}

class _PuzzleRewardPage3State extends State<PuzzleRewardPage3> {
  final int gridSize = 3;
  List<PuzzlePiece> pieces = [];
  int? selectedIndex;
  bool isSolved = false;
  bool isLoading = true;
  int correctPiecesCount = 0;
  final String puzzleKey = 'puzzle_solved_MasjidHagiaSophia';
  final String puzzleImagePath = 'assets/images/puzzle_modul/Masjid_Hagia_Sophia3.png';
  final String puzzleName = 'Masjid Hagia Sophia';
  final String puzzleLevel = 'Level 3 : Belajar Mengenal Huruf Hijaiyah (Ba Bi Bu)';
  final String puzzleDescription =
      'Masjid Hagia Sophia adalah salah satu bangunan paling ikonik di dunia, terletak di Istanbul, Turki. Nama aslinya berasal dari bahasa Yunani: “Holy Wisdom” atau "Kebijaksanaan Suci';

  final AudioPlayer _movePlayer = AudioPlayer();
  final AudioPlayer _victoryPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _setupPuzzle();
  }

  Future<void> _setupPuzzle() async {
    setState(() {
      isSolved = false;
      isLoading = true;
    });

    try {
      final ByteData byteData = await rootBundle.load(puzzleImagePath);
      final Uint8List imageBytes = byteData.buffer.asUint8List();
      final img.Image? fullImage = img.decodeImage(imageBytes);

      if (fullImage == null) {
        if (mounted) setState(() => isLoading = false);
        return;
      }

      final int pieceWidth = (fullImage.width / gridSize).floor();
      final int pieceHeight = (fullImage.height / gridSize).floor();
      List<PuzzlePiece> tempPieces = [];
      int index = 0;

      for (int y = 0; y < gridSize; y++) {
        for (int x = 0; x < gridSize; x++) {
          img.Image pieceImage = img.copyCrop(
            fullImage,
            x: x * pieceWidth,
            y: y * pieceHeight,
            width: pieceWidth,
            height: pieceHeight,
          );
          tempPieces.add(
            PuzzlePiece(
              correctIndex: index,
              imageBytes: Uint8List.fromList(img.encodeJpg(pieceImage)),
            ),
          );
          index++;
        }
      }

      tempPieces.shuffle();

      setState(() {
        pieces = tempPieces;
        isLoading = false;
      });
      _updateCorrectPiecesCount();
    } catch (e) {
      print('Error loading puzzle image: $e');
      setState(() => isLoading = false);
    }
  }

  void _updateCorrectPiecesCount() {
    int count = 0;
    for (int i = 0; i < pieces.length; i++) {
      if (pieces[i].correctIndex == i) {
        count++;
      }
    }
    setState(() {
      correctPiecesCount = count;
    });
  }

  void _onPieceTap(int index) async {
    if (isSolved) return;

    setState(() {
      if (selectedIndex == null) {
        selectedIndex = index;
      } else {
        if (selectedIndex != index) {
          final temp = pieces[selectedIndex!];
          pieces[selectedIndex!] = pieces[index];
          pieces[index] = temp;
        }
        selectedIndex = null;
        _updateCorrectPiecesCount();
        _checkIfSolved();
      }
    });

    await _movePlayer.play(AssetSource('audios/sounds/mixkit-modern-technology-select-3124.wav'));
  }

  void _checkIfSolved() async {
  if (correctPiecesCount == pieces.length) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('puzzle_solved_MasjidHagiaSophia', true);
    setState(() => isSolved = true);

    // ✅ Save to Firestore with timestamp
    final user = FirebaseAuth.instance.currentUser;
if (user != null) {
  final rewardId = 'Masjid_Hagia_Sophia3';

  await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
    'achievements': FieldValue.arrayUnion([rewardId]),
    'achievements_data': {
      rewardId: {
        'completed': true,
        'timestamp': FieldValue.serverTimestamp(),
      }
    }
  }, SetOptions(merge: true));
}


    await _victoryPlayer.play(
      AssetSource('audios/sounds/mixkit-correct-answer-reward-952.wav'),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _showSolvedDialog();
    });
  }
}


  void _showSolvedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color(0xFFFAFDCB),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.emoji_events, color: Colors.amber.shade700, size: 50),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -math.pi / 12,
                    child: Text('🎉', style: GoogleFonts.inter(fontSize: 26)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Selamat!',
                      style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                    ),
                  ),
                  Transform.rotate(
                    angle: math.pi / 12,
                    child: Text('🎉', style: GoogleFonts.inter(fontSize: 26)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Kamu telah menyelesaikan puzzle ini dengan benar!',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 16),
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(puzzleImagePath, height: 130),
              ),
              const SizedBox(height: 15),
              Text(puzzleName, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(puzzleLevel, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[700])),
              const SizedBox(height: 12),
              Text(puzzleDescription, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.collections),
                      label: const Text('Lihat Koleksi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                        foregroundColor: Colors.blue.shade800,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ProgressPageWidget()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.home),
                      label: const Text('Menu Belajar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LearningWidget()),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _movePlayer.dispose();
    _victoryPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDCB),
      appBar: AppBar(
        title: const Text('Reward Puzzle', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF037A16),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoCard(),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                child: isSolved ? _buildSolvedView() : _buildPuzzleGrid(),
              ),
              const SizedBox(height: 20),
              if (!isSolved)
                Text(
                  'Potongan Terkumpul: $correctPiecesCount dari ${gridSize * gridSize}',
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFDCB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(Icons.extension, color: Colors.green.shade700, size: 60),
          const SizedBox(height: 10),
          Text(
            puzzleName,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            puzzleLevel,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            'Susun potongan gambar agar membentuk bangunan utuh!',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16),
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(puzzleImagePath, height: 150),
          ),
        ],
      ),
    );
  }

  Widget _buildPuzzleGrid() {
    return Container(
      key: const ValueKey<String>('puzzleGrid'),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridSize,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: pieces.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onPieceTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: selectedIndex == index ? Border.all(color: Colors.yellowAccent, width: 4) : null,
              ),
              child: Image.memory(pieces[index].imageBytes, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSolvedView() {
    return Container(
      key: const ValueKey<String>('solvedView'),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(),
            blurRadius: 15,
            spreadRadius: 5,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(puzzleImagePath, fit: BoxFit.cover),
      ),
    );
  }
}
