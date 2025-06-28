import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TajwidKidz/controller/progress_controller.dart'; // Ganti path jika perlu

class ProgressPageWidget extends StatefulWidget {
  const ProgressPageWidget({super.key});

  @override
  State<ProgressPageWidget> createState() => _ProgressPageWidgetState();
}

class _ProgressPageWidgetState extends State<ProgressPageWidget> {
  final ProgressController _progressController = ProgressController();
  List<bool> _progressList = List.generate(7, (_) => false);

  final List<String> levelTitles = [
    'Belajar Mengenal Huruf Hijaiyah',
    'Belajar Mengenal Harakat',
    'Belajar Mengenal Huruf Hijaiyah (Ba Bi Bu)',
    'Belajar Mengenal Tajwid',
    'Belajar Membaca Surah dengan Tajwid',
    'Belajar Mengenal Gharib',
    'Belajar Pengucapan Huruf dengan Hukum Tajwid',
  ];

  int totalScore = 0;
  int maxLevel = 0;
  String lastGame = '-';
  String rank = 'Belum ada';

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final result = await _progressController.getProgress();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    int tempScore = 0;
    int tempMaxLevel = 0;
    String tempLastGame = '-';

    if (uid != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = userDoc.data();
      final games = data?['games'] ?? {};

      DateTime latestTime = DateTime.fromMillisecondsSinceEpoch(0);

      for (final game in ['Tebak_Huruf', 'Susun_Huruf', 'Game_Tajwid']) {
        final levels = games[game] ?? {};
        for (final entry in levels.entries) {
          if (entry.value['completed'] == true) {
            final score = (entry.value['score'] ?? 0) as int;
            tempScore += score;

            final timestamp = (entry.value['timestamp'] as Timestamp?)?.toDate();
            if (timestamp != null && timestamp.isAfter(latestTime)) {
              latestTime = timestamp;
              final levelNum = int.tryParse(entry.key.replaceAll('level_', '')) ?? 0;
              tempMaxLevel = levelNum;
              tempLastGame = game;
            }
          }
        }
      }


      setState(() {
        totalScore = tempScore;
        maxLevel = tempMaxLevel;
        lastGame = tempLastGame.replaceAll('_', ' ');
        rank = totalScore >= 1000
            ? 'Peringkat 1'
            : totalScore >= 500
                ? 'Peringkat 2'
                : totalScore > 0
                    ? 'Peringkat 3'
                    : 'Belum ada';
        _progressList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAD2),
      appBar: AppBar(
        title: const Text(
          'Progress Belajarmu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF037A16),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.military_tech_rounded, color: Colors.amber.shade600, size: 40),
                      Icon(Icons.emoji_events_rounded, color: Colors.orange.shade600, size: 40),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green.shade700,
                    child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 50),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              _buildBox(
                icon: Icons.menu_book_outlined,
                title: 'Belajar',
                backgroundColor: const Color(0xFFDDEB9D),
                children: List.generate(7, (index) {
                  return _buildRow(
                    _progressList[index] ? Icons.check_circle : Icons.radio_button_unchecked,
                    levelTitles[index],
                    _progressList[index] ? 'Selesai' : 'Belum selesai',
                  );
                }),
              ),

              const SizedBox(height: 24),

              _buildBox(
                icon: Icons.videogame_asset_outlined,
                title: 'Game',
                backgroundColor: const Color(0xFFDDEB9D),
                children: [
                  _buildRow(Icons.videogame_asset, 'Nama Game', lastGame),
                  _buildRow(Icons.flag, 'Level Terakhir', 'Level $maxLevel'),
                  _buildRow(Icons.star, 'Score (Keseluruhan)', totalScore.toString()),
                  _buildRow(Icons.emoji_events_outlined, 'Peringkat terakhir', rank),
                ],
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox({
    required IconData icon,
    required String title,
    required List<Widget> children,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green.shade900, size: 30),
              const SizedBox(width: 14),
              Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ],
          ),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700, size: 22),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
          ),
          Expanded(
            flex: 2,
            child: Text(value,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: value == 'Selesai' ? Colors.green.shade700 : Colors.black54,
                  fontWeight: value == 'Selesai' ? FontWeight.bold : FontWeight.normal,
                )),
          ),
        ],
      ),
    );
  }
}
