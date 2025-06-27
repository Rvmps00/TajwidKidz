import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the required widgets for routing
import 'falaqfull.dart'; // Import LearningAlFalaqFullWidget
import 'falaq1.dart'; // Import LearningAlFalaq1Widget

class LearningFalaqHomeWidget extends StatefulWidget {
  const LearningFalaqHomeWidget({super.key});

  static String routeName = 'LearningFalaqhome';
  static String routePath = '/learningFalaqhome';

  @override
  State<LearningFalaqHomeWidget> createState() =>
      _LearningFalaqHomeWidgetState();
}

class _LearningFalaqHomeWidgetState extends State<LearningFalaqHomeWidget> {
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
                            color: Colors.black, // Ensure text color is black
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
                      // Button for Learning Surah Al-Falaq
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LearningAlFalaqFullWidget(),
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
                              'Surah Al - Falaq',
                              style: TextStyle(
                                fontSize: 18, // Adjusted font size for consistency
                                color: Colors.black, // Text color set to black
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Button for Learning Surah Al-Falaq 1
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LearningAlfalaq1Widget(),
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
                              'Belajar Membaca Surah Al - Falaq',
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
