import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TajwidKidz/account/account.dart';
import 'learning.dart'; // Import halaman LearningWidget
import 'Game/view/minigame.dart'; // Import halaman MiniGame
import 'leaderboard.dart'; // Import halaman Leaderboard
import 'progress.dart'; // Import halaman ProgressPage

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0; // Index untuk menentukan tab yang aktif

  // Fungsi untuk menangani tab yang dipilih
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index; // Memperbarui selectedIndex saat tab dipilih
    });
  }

  // Fungsi untuk menampilkan tampilan berdasarkan tab yang dipilih
  Widget _getSelectedPage() {
    switch (selectedIndex) {
      case 0: // Home
        return buildHomePage();
      case 1: // Learning
        return LearningWidget();
      case 2: // Mini Game
        return ProgressPageWidget(); // Halaman MiniGame
      case 3: // Leaderboard
        return AccountWidget(); // Halaman Leaderboard
      case 4: // Progress
        return LearningWidget(); // Halaman Progress Saya
      default:
        return buildHomePage(); // Default ke Home
    }
  }

  // Halaman Home
  Widget buildHomePage() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/LOGO_NGAJI__4_-removebg-preview 1 (1).png',
                width: 342.3,
                height: 214,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 10),
            child: Container(
              width: 384.9,
              height: 63,
              decoration: BoxDecoration(
                color: Color(0xFFFAFDCB),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Selamat Belajar, Nadia!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Mulai Belajar
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman LearningWidget saat tombol "Mulai Belajar" diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearningWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 146,
                      height: 146,
                      decoration: BoxDecoration(
                        color: Color(0xFFBCDEA8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF037A16),
                            size: 24,
                          ),
                          FaIcon(
                            FontAwesomeIcons.bookQuran,
                            color: Color(0xFF037A16),
                            size: 60,
                          ),
                          Text(
                            'Mulai Belajar',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30),
              // Mini Game
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman MiniGameWidget saat tombol "Mini Game" diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MiniGameWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 146,
                      height: 146,
                      decoration: BoxDecoration(
                        color: Color(0xFF8EC448),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.gamepad,
                            color: Color(0xFF037A16),
                            size: 24,
                          ),
                          FaIcon(
                            FontAwesomeIcons.gamepad,
                            color: Color(0xFF037A16),
                            size: 60,
                          ),
                          Text(
                            'Mini Game',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 150),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Progress Saya
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman ProgressPage saat tombol "Progress Saya" diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressPageWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 146,
                      height: 146,
                      decoration: BoxDecoration(
                        color: Color(0xFF8EC448),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF037A16),
                            size: 24,
                          ),
                          Icon(
                            Icons.checklist_rtl_sharp,
                            color: Color(0xFF037A16),
                            size: 60,
                          ),
                          Text(
                            'Progress Saya',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30),
              // Leaderboard
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman LeaderboardWidget saat tombol "Leaderboard" diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaderboardApp(),
                        ),
                      );
                    },
                    child: Container(
                      width: 146,
                      height: 146,
                      decoration: BoxDecoration(
                        color: Color(0xFFBCDEA8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF037A16),
                            size: 24,
                          ),
                          FaIcon(
                            FontAwesomeIcons.trophy,
                            color: Color(0xFF037A16),
                            size: 60,
                          ),
                          Text(
                            'Leaderboard',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFDCB),
        body: SafeArea(
          top: true,
          child: _getSelectedPage(), // Menampilkan halaman berdasarkan tab yang dipilih
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFFAFDCB),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex, // Menampilkan tab yang aktif
          onTap: onTabTapped, // Navigasi tab yang dipilih
          selectedItemColor: Color(0xFF037A16),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book, size: 30),
              label: 'Learning',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartBar, size: 30),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 30),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
