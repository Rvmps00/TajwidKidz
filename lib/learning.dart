import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TajwidKidz/Modul4_MacamTajwid/view/macam_tajwid_screen.dart';
import 'modul1hijaiyah/m1alif.dart';
import 'Modul5_SurahTajwid/tampilanawal.dart';
import 'Modul2harakat/m2fathah.dart';
import 'Modul3_babibu/Fonetik Babibu/aiu.dart';
import 'Modul6gharib/gharib.dart';
import 'modul7huruftajwid/huruftajwid.dart';

// Halaman Level 1
class Level1Page extends StatelessWidget {
  const Level1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1'),
      ),
      body: Center(
        child: Text('Halaman Level 1: Belajar Mengenal Huruf Hijaiyah'),
      ),
    );
  }
}

// Halaman Level 2
class Level2Page extends StatelessWidget {
  const Level2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 2'),
      ),
      body: Center(
        child: Text('Halaman Level 2: Belajar Mengenal Harakat'),
      ),
    );
  }
}

// Halaman Level 3
class Level3Page extends StatelessWidget {
  const Level3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3'),
      ),
      body: Center(
        child: Text('Halaman Level 3: Belajar Mengenal Huruf Hijaiyah (Ba Bi Bu)'),
      ),
    );
  }
}

// Halaman Level 4
class Level4Page extends StatelessWidget {
  const Level4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 4'),
      ),
      body: Center(
        child: Text('Halaman Level 4: Belajar Mengenal Tajwid'),
      ),
    );
  }
}

// Halaman Level 5
class Level5Page extends StatelessWidget {
  const Level5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 5'),
      ),
      body: Center(
        child: Text('Halaman Level 5: Belajar Membaca Surah dengan Tajwid'),
      ),
    );
  }
}

// Halaman Level 6
class Level6Page extends StatelessWidget {
  const Level6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 6'),
      ),
      body: Center(
        child: Text('Halaman Level 6: Belajar Mengenal Gharib'),
      ),
    );
  }
}
// Halaman Level 7
class Level7Page extends StatelessWidget {
  const Level7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 7'),
      ),
      body: Center(
        child: Text('Halaman Level 7: Latihan Pengucapan \n Huruf dengan Hukum-Hukum Tajwid'),
      ),
    );
  }
}

// Halaman Utama - LearningWidget
class LearningWidget extends StatefulWidget {
  const LearningWidget({super.key});

  static String routeName = 'Learning';
  static String routePath = '/learning';

  @override
  State<LearningWidget> createState() => _LearningWidgetState();
}

class _LearningWidgetState extends State<LearningWidget> {
  int selectedIndex = 1;

  // Variabel state untuk menyimpan status penyelesaian setiap level
  final List<bool> _levelCompleted = List.generate(7, (_) => false);

  // Fungsi untuk menangani perubahan pada checkbox
  void _onCheckboxChanged(bool? newValue, int levelIndex) {
    setState(() {
      // Level 1-7, sedangkan indeks list 0-6
      _levelCompleted[levelIndex - 1] = newValue ?? false;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Learning',
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
          top: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                // Level 1
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearningAlifWidget()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      // Adjusted height to fit content
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/level1.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 1',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Mengenal Huruf Hijaiyah',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[0],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 1);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 2
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearningFathahWidget()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/Level2.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 2',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Mengenal Harakat',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[1],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 2);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 3
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearningAIUWidget()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/Level3.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 3',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Mengenal Huruf Hijaiyah (Ba Bi Bu)',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[2],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 3);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 4
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MacamTajwidScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/Level4.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 4',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Mengenal Tajwid',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[3],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 4);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 5
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearningtampilanSplashWidget()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/Level5.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 5',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Membaca Surah dengan Tajwid',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[4],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 5);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 6
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BacaanGharibPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/Modul 6.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 6',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Belajar Mengenal Gharib',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[5],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 6);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Level 7
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LatihanHurufTajwidPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEB9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/modul 7.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                              child: Text(
                                'Level 7',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              child: Text(
                                'Latihan Pengucapan Huruf dengan Hukum Tajwid',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // -- PENGGANTI PROGRESS BAR --
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _levelCompleted[6],
                                  onChanged: (newValue) {
                                    _onCheckboxChanged(newValue, 7);
                                  },
                                  activeColor: Color(0xFF037A16),
                                ),
                                Text(
                                  'Tandai telah selesai',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600),
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
          ),
        ),
      ),
    );
  }
}

// Main function untuk menjalankan aplikasi
void main() {
  runApp(
    MaterialApp(
      title: 'Learning App',
      initialRoute: '/',
      routes: {
        '/': (context) => LearningWidget(),
        '/level1': (context) => Level1Page(),
        '/level2': (context) => Level2Page(),
        '/level3': (context) => Level3Page(),
        '/level4': (context) => Level4Page(),
        '/level5': (context) => Level5Page(),
        '/level6': (context) => Level6Page(),
        '/level7': (context) => Level7Page(),
        '/m1alif': (context) => LearningAlifWidget()
      },
      // Menghilangkan banner debug
      debugShowCheckedModeBanner: false,
    ),
  );
}