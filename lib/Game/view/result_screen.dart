import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'puzzle_reward_game1.dart';

// import '../puzzle/tebak_huruf/pzl_tbkh_lvl_1.dart';

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
      appBar: AppBar(
        title: Text(
          '${widget.gameName} Level ${widget.level}',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // 3. Buat AppBar juga transparan dan hilangkan shadow
        backgroundColor: Color(0xFF037A16),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
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
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        'assets/images/icon_result.png',
                        width: 75,
                        height: 75,
                      ),
                    ),
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
                if (widget.score != widget.totalQuestions * 10)
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

                const SizedBox(height: 20),

                // Tombol Lanjut ke Puzzle (hanya jika skor 100%)
                if (widget.score == widget.totalQuestions * 10)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      width: 175,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 153, 241, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (widget.gameName.toLowerCase().contains('tebak huruf')) {
                            if (widget.level.toString() == '1') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_MasjidilHaram',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjidil_haram.png',
                                        puzzleName: 'Masjidil Haram',
                                        puzzleLevel: 'Level 1 : Tebak Huruf',
                                        puzzleDescription: 'Masjid terbesar di dunia dan tempat berdirinya Ka\'bah, arah kiblat seluruh umat Islam. Dibangun pertama kali oleh Nabi Ibrahim dan Nabi Ismail.',
                                      ),
                                ),
                              );
                            } else if (widget.level.toString() == '2') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_MasjidNabawi',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_nabawi.jpeg',
                                        puzzleName: 'Masjid Nabawi',
                                        puzzleLevel: 'Level 2 : Tebak Huruf',
                                        puzzleDescription: 'Masjid Nabawi didirikan oleh Nabi Muhammad SAW pada tahun 622 M di kota Madinah setelah hijrah dari Mekkah. Masjid ini menjadi pusat kegiatan keagamaan dan sosial umat Islam serta tempat dimakamkannya Nabi Muhammad SAW.',
                                      ),
                                ),
                              );
                            } else if (widget.level.toString() == '3') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_domeOfTheRock',
                                        puzzleImagePath: 'assets/images/puzzle_modul/dome_of_the_rock.jpeg',
                                        puzzleName: 'Dome of the Rock',
                                        puzzleLevel: 'Level 3 : Tebak Huruf',
                                        puzzleDescription: 'Dome of the Rock dibangun pada tahun 691 M di Yerusalem oleh Khalifah Abdul Malik dari Dinasti Umayyah. Bangunan berkubah emas ini merupakan salah satu situs suci umat Islam karena diyakini sebagai tempat Nabi Muhammad SAW naik ke langit saat Isra Mi’raj.',
                                      ),
                                ),
                              );
                            }
                          } else if (widget.gameName.toLowerCase().contains('susun huruf')) {
                            if (widget.level.toString() == '1') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_masjidQuba',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_quba.jpeg',
                                        puzzleName: 'Masjid Quba',
                                        puzzleLevel: 'Level 1 : Susun Huruf',
                                        puzzleDescription: 'Masjid Quba adalah masjid pertama yang dibangun oleh Nabi Muhammad SAW pada tahun 622 M di pinggiran kota Madinah. Masjid ini memiliki keutamaan karena pendiriannya dilandasi oleh takwa, dan shalat di dalamnya bernilai seperti umrah.',
                                      ),
                                ),
                              );
                            } else if (widget.level.toString() == '2') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_masjidAlAzhar',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_al_azhar.jpeg',
                                        puzzleName: 'Masjid Al-Azhar',
                                        puzzleLevel: 'Level 2 : Susun Huruf',
                                        puzzleDescription: 'Masjid Al-Azhar didirikan pada tahun 970 M di Kairo, Mesir, oleh Dinasti Fatimiyah. Selain sebagai tempat ibadah, masjid ini berkembang menjadi pusat pendidikan Islam terkemuka di dunia melalui Universitas Al-Azhar.',
                                      ),
                                ),
                              );
                            } else if (widget.level.toString() == '3') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_masjidAgungCordoba',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_agung_cordoba.jpeg',
                                        puzzleName: 'Masjid Agung Cordoba',
                                        puzzleLevel: 'Level 3 : Susun Huruf',
                                        puzzleDescription: 'Masjid Agung Cordoba dibangun pada tahun 785 M di Cordoba, Spanyol, oleh Abd al-Rahman I dari Dinasti Umayyah. Masjid ini terkenal dengan arsitektur megah bergaya Moor dan kemudian diubah menjadi katedral setelah penaklukan Kristen.',
                                      ),
                                ),
                              );
                            }
                          } else if (widget.gameName.toLowerCase().contains('tajwid')) {
                            if (widget.level.toString() == '1') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_masjidSultanAhmed',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_sultan_ahmed.jpeg',
                                        puzzleName: 'Masjid Sultan Ahmed',
                                        puzzleLevel: 'Level 1 : Tajwid',
                                        puzzleDescription: 'Masjid Sultan Ahmed, dikenal juga sebagai Masjid Biru, dibangun antara tahun 1609–1616 di Istanbul, Turki, oleh Sultan Ahmed I. Masjid ini terkenal karena enam menaranya dan interior megah yang dihiasi lebih dari 20.000 keramik berwarna biru.',
                                      ),
                                ),
                              );
                            } else if (widget.level.toString() == '2') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PuzzleRewardGame(
                                        gameName: widget.gameName,
                                        level: widget.level,
                                        puzzleKey: 'puzzle_solved_masjidSheikhZayed',
                                        puzzleImagePath: 'assets/images/puzzle_modul/masjid_sheikh_zayed.jpeg',
                                        puzzleName: 'Masjid Sheikh Zayed',
                                        puzzleLevel: 'Level 2 : Tajwid',
                                        puzzleDescription: 'Masjid Sheikh Zayed dibangun pada tahun 2007 di Abu Dhabi, Uni Emirat Arab, dan merupakan salah satu masjid terbesar di dunia. Masjid ini dikenal karena arsitekturnya yang megah, dilapisi marmer putih, serta memiliki lampu gantung dan karpet terbesar di dunia.',
                                      ),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Mainkan Puzzle',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
