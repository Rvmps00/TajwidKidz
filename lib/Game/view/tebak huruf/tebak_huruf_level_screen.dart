import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/view/tebak%20huruf/tebak_huruf_game.dart';
import 'package:TajwidKidz/Game/view/tebak%20huruf/tebak_huruf_game_2.dart';
import 'package:TajwidKidz/Game/view/tebak%20huruf/tebak_huruf_game_3.dart';
import 'package:TajwidKidz/Game/widgets/game_card2.dart';

class TebakHurufLevelScreen extends StatelessWidget {
  const TebakHurufLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Mini Game',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF037A16),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB3E5FC),
                  Color(0xFFE1F5FE),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          const Positioned(
            top: 50,
            left: -20,
            child: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 150,
            ),
          ),
          const Positioned(
            top: 120,
            right: -30,
            child: Icon(
              Icons.cloud,
              color: Colors.white70,
              size: 170,
            ),
          ),
          const Positioned(
            top: 500,
            left: -50,
            child: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 170,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF037A16),
                            Color(0xFF059922),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF037A16).withOpacity(0.3),
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.quiz,
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Tebak Huruf Arab',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Pilih level yang ingin kamu mainkan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    GameCard2(
                      title: 'Level 1',
                      subtitle: 'Petualangan Huruf Hijaiyah! Belajar mengenal huruf & suara tajwid',
                      color: const Color.fromRGBO(165, 214, 167, 1),
                      difficulty: 'Mudah',
                      difficultyColor: const Color(0xFF4CAF50),
                      icon: Icons.looks_one_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TebakHurufGame()),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    GameCard2(
                      title: 'Level 2',
                      subtitle: 'Tebakkan Suara Huruf! Cocokkan huruf dengan pelafalan dari suara & gambar',
                      color: const Color.fromRGBO(255, 179, 87, 1),
                      difficulty: 'Sedang',
                      difficultyColor: const Color(0xFFFF9800),
                      icon: Icons.looks_two_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TebakHurufGame2()),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    GameCard2(
                      title: 'Level 3',
                      subtitle: 'Tantangan Huruf Mirip! Uji konsentrasi membedakan huruf hijaiyah yang serupa',
                      color: const Color.fromRGBO(242, 125, 125, 1),
                      difficulty: 'Sulit',
                      difficultyColor: const Color(0xFFF44336),
                      icon: Icons.looks_3_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TebakHurufGame3()),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // Footer info (tidak ada perubahan)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85), // Sedikit lebih tebal
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            color: Color(0xFF037A16),
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tips Bermain',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF037A16),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Dengarkan suara huruf dengan seksama, cocokkan dengan gambar yang sesuai, dan fokus saat menghadapi huruf yang mirip!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}