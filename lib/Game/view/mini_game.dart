import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:TajwidKidz/Game/view/game tajwid/game_tajwid_level_screen.dart';
import 'package:TajwidKidz/Game/view/susun huruf/susun_huruf_level_screen.dart';
import 'package:TajwidKidz/Game/view/tebak huruf/tebak_huruf_level_screen.dart';
import 'package:TajwidKidz/Game/widgets/game_card.dart';

class MiniGameWidget extends StatefulWidget {
  const MiniGameWidget({super.key});

  @override
  State<MiniGameWidget> createState() => _MiniGameWidgetState();
}

class _MiniGameWidgetState extends State<MiniGameWidget> {
  String? userName;
  String? photoUrl;
  bool isLoading = true;
  Map<String, List<bool>> gameProgress = {};
  double progressValue = 0.0;
  int progressPercent = 0;
  int totalBestScore = 0;
  int tebakHurufScore = 0;
  int susunHurufScore = 0;
  int tajwidScore = 0;

  @override
  void initState() {
    super.initState();
    _loadUserDataAndProgress();
  }

  Future<void> _loadUserDataAndProgress() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = userDoc.data();
      final gamesData = data?['games'] as Map<String, dynamic>? ?? {};

      int sumScores(Map<String, dynamic>? game, int maxLevel) {
        if (game == null) return 0;
        return List.generate(maxLevel, (i) {
          final level = game['level_${i + 1}'];
          return level != null && level['score'] != null ? level['score'] as int : 0;
        }).fold(0, (a, b) => a + b);
      }

      setState(() {
        userName = data?['fullName'] ?? 'Pengguna';
        photoUrl = data?['photoUrl'];
        isLoading = false;

        tebakHurufScore = sumScores(gamesData['Tebak_Huruf'], 3);
        susunHurufScore = sumScores(gamesData['Susun_Huruf'], 3);
        tajwidScore = sumScores(gamesData['Game_Tajwid'], 2);
        totalBestScore = tebakHurufScore + susunHurufScore + tajwidScore;

        gameProgress = {
          'Tebak_Huruf': List.generate(3, (i) => gamesData['Tebak_Huruf']?['level_${i + 1}']?['completed'] == true),
          'Susun_Huruf': List.generate(3, (i) => gamesData['Susun_Huruf']?['level_${i + 1}']?['completed'] == true),
          'Game_Tajwid': List.generate(2, (i) => gamesData['Game_Tajwid']?['level_${i + 1}']?['completed'] == true),
        };

        final totalLevels = 8;
        final completedLevels = gameProgress.values.expand((list) => list).where((isDone) => isDone).length;
        progressValue = completedLevels / totalLevels;
        progressPercent = (progressValue * 100).toInt();
      });
    } else {
      setState(() {
        userName = 'Tamu';
        photoUrl = null;
        isLoading = false;
      });
    }
  }

  Widget _gameWithScore({
    required Widget card,
    required int score,
  }) {
    return Row(
      children: [
        Expanded(flex: 3, child: card),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text('Score',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              Text('$score pts',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
      appBar: AppBar(
        title: const Text(
          'Mini Game',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF037A16),
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Halo, $userName!',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: photoUrl != null
                              ? NetworkImage(photoUrl!)
                              : const AssetImage('assets/images/image_profile.png') as ImageProvider,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total Best Score: $totalBestScore pts',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Progress kamu $progressPercent%',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 300,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: Colors.white,
                              valueColor: const AlwaysStoppedAnimation(Color.fromRGBO(0, 153, 241, 1)),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Image.asset('assets/images/icon_piala.png', width: 32),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _gameWithScore(
                      card: GameCard(
                        imagePath: 'assets/images/icon_tebak_huruf.png',
                        title: 'Game Tebak\nHuruf\nHijaiyah',
                        color: const Color.fromRGBO(165, 214, 167, 1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TebakHurufLevelScreen()),
                          );
                        },
                      ),
                      score: tebakHurufScore,
                    ),
                    Center(child: Image.asset('assets/images/icon_line1.png')),
                    _gameWithScore(
                      card: GameCard(
                        imagePath: 'assets/images/icon_susun_huruf.png',
                        title: 'Game Susun\nHuruf\nHijaiyah',
                        color: const Color.fromRGBO(255, 179, 87, 1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SusunHurufLevelScreen()),
                          );
                        },
                      ),
                      score: susunHurufScore,
                    ),
                    Center(child: Image.asset('assets/images/icon_line2.png')),
                    _gameWithScore(
                      card: GameCard(
                        imagePath: 'assets/images/icon_game_tajwid.png',
                        title: 'Game\nTajwid',
                        color: const Color.fromRGBO(242, 125, 125, 1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => GameTajwidLevelScreen()),
                          );
                        },
                      ),
                      score: tajwidScore,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
