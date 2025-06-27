import 'package:flutter/material.dart';

class ProgressPageWidget extends StatelessWidget {
  const ProgressPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String judulMateri = "Belajar Huruf Hijaiyah";
    final String feedbackAI = "Bagus, lanjutkan!";
    final String levelGame = "Level 3";
    final int scoreGame = 1200;
    final String rankingTerakhir = "Peringkat 5";

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
        backgroundColor: Color(0xFF037A16),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Bagian Atas dengan Icon Progress
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
                    child: Icon(Icons.menu_book_rounded, color: Colors.white, size: 50),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              _buildBox(
                icon: Icons.menu_book_outlined,
                title: 'Belajar',
                backgroundColor: const Color(0xFFDDEB9D),
                children: [
                  _buildRow(Icons.book, 'Judul Materi yang dipelajari', judulMateri),
                  _buildRow(Icons.chat_bubble_outline, 'Feedback AI', feedbackAI),
                ],
              ),

              const SizedBox(height: 24),

              _buildBox(
                icon: Icons.videogame_asset_outlined,
                title: 'Game',
                backgroundColor: const Color(0xFFDDEB9D),
                children: [
                  _buildRow(Icons.flag, 'Level game yang dilalui', levelGame),
                  _buildRow(Icons.star, 'Score (Keseluruhan)', scoreGame.toString()),
                  _buildRow(Icons.emoji_events_outlined, 'Peringkat terakhir yang didapat', rankingTerakhir),
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
            color: Colors.grey.shade400.withValues(),
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
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
