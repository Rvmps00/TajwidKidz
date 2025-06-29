import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int benar;
  final int totalQuestions;
  final VoidCallback onRetry;
  final String gameName; // contoh: "Tebak_Huruf"
  final int level;       // contoh: 1

  const ResultScreen({
    super.key,
    required this.score,
    required this.benar,
    required this.totalQuestions,
    required this.onRetry,
    required this.gameName,
    required this.level,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    _saveGameCompletion();
  }

  Future<void> _saveGameCompletion() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final levelKey = 'level_${widget.level}';
      await userDoc.set({
        'games': {
          widget.gameName: {
            levelKey: {
              'completed': true,
              'score': widget.score,
              'correct': widget.benar,
              'total': widget.totalQuestions,
              'timestamp': FieldValue.serverTimestamp(),
            }
          }
        }
      }, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Judul Selamat
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_result.png'),
                    const SizedBox(width: 4),
                    const Text(
                      'Selamat',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset('assets/images/icon_result.png'),
                  ],
                ),
                const SizedBox(height: 20),

                // Pesan selesai
                const Text(
                  'Kamu sudah menyelesaikan\nseluruh kuis!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 24),

                // Total poin
                Text(
                  'Total Poin yang didapat: ${widget.score} pts',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 24),

                // Container hijau jumlah benar
                Container(
                  width: 337,
                  height: 69,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(165, 214, 167, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Jawaban benar: ${widget.benar}/${widget.totalQuestions}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Pesan semangat
                const Text(
                  'Hebat Banget, Semangat terus\nuntuk kuis-kuis selanjutnya ya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol-tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tombol Ulangi Kuis
                    SizedBox(
                      width: 150,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: widget.onRetry,
                        child: const Text(
                          'Ulangi Kuis',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Tombol Menu Utama
                    SizedBox(
                      width: 150,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 153, 241, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text(
                          'Menu Utama',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
