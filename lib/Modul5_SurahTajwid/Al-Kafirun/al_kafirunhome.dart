import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the required widgets for routing
import 'al_kafirun.dart'; // Import LearningAlKafirunFullWidget
import 'al_kafirun1.dart'; // Import LearningAlKafirun1Widget

class LearningAlkafirunHomeWidget extends StatefulWidget {
  const LearningAlkafirunHomeWidget({super.key});

  static String routeName = 'LearningAl-Kafirunhome';
  static String routePath = '/learningAl-Kafirunhome';

  @override
  State<LearningAlkafirunHomeWidget> createState() =>
      _LearningAlkafirunHomeWidgetState();
}

class _LearningAlkafirunHomeWidgetState
    extends State<LearningAlkafirunHomeWidget> {
  int selectedIndex = 1;

  // Function to handle bottom navigation
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFAFDCB),
        body: SafeArea(
          top: false, // Prevent header from being cut off by status bar
          child: SingleChildScrollView(
            child: Column(
              children: [
                // === HEADER with dark green background that reaches the top ===
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15, // Adjusted height
                  color: const Color(0xFF037A16), // Dark green header background
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Level 5 : Belajar Membaca\nSurah dengan Tajwid',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // === CONTENT SECTION ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '"Di level ini, kamu akan belajar membaca surat-surat pendek dalam Al-Qur’an dengan benar sesuai dengan hukum tajwid yang telah kamu pelajari sebelumnya."',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black, // Ensuring the text color is black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // === BUTTONS ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Button for Learning Surah Al-Kafirun
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LearningAlKafirunFullWidget(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2CE31),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.library_books_sharp, size: 15),
                            SizedBox(width: 5),
                            Text(
                              'Surah Al - Kafirun',
                              style: TextStyle(
                                fontSize: 18, // Adjusted font size for consistency
                                color: Colors.black, // Text color set to black
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Button for Learning Surah Al-Kafirun 1
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LearningAlkafirun1Widget(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2CE31),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.library_books_sharp, size: 15),
                            SizedBox(width: 5),
                            Text(
                              'Belajar Membaca Surah Al - Kafirun',
                              style: TextStyle(
                                fontSize: 18, // Adjusted font size for consistency
                                color: Colors.black, // Text color set to black
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
