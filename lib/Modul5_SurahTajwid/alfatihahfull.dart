import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningAlfatihahWidget extends StatefulWidget {
  const LearningAlfatihahWidget({super.key});

  static String routeName = 'LearningAlfatihahFull';
  static String routePath = '/learningAlfatihahFull';

  @override
  State<LearningAlfatihahWidget> createState() => _LearningAlfatihahWidgetState();
}

class _LearningAlfatihahWidgetState
    extends State<LearningAlfatihahWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  int selectedIndex = 1; // Index for the BottomNavigationBar

  // Function to handle bottom navigation
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 3.9,
            height: MediaQuery.sizeOf(context).height * 8.44,
            decoration: BoxDecoration(
              color: Color(0xFFFAFDCB),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 411.1,
                  height: 145.28,
                  decoration: BoxDecoration(
                    color: Color(0xFF037A16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Go back on press
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 43, 0),
                          child: Text(
                            'Surah Al- Fatihah',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.volumeUp,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              print('Volume button pressed');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.241,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFDCB),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(90, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa1.png',
                                        width: MediaQuery.sizeOf(context).width * 0.7,
                                        height: MediaQuery.sizeOf(context).height * 0.04,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '1. Bismillahir-rahmanir-rahim',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: Dengan nama Allah Yang Maha Pengasih \n lagi Maha Penyayang.',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(3, 13, 0, 0),
                                      child: Text(
                                        'Idgham Syamsiyah, Ghunah Musyaddadah, ',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF9747FF),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Repeat the pattern for each Surah, similar to Surah 1
                        // Surah 2: Al-hamdu lillahi rabbil-‘alamin
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.229,
                          decoration: BoxDecoration(
                            color: Color(0xFFDDEB9D),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(60, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa2.png',
                                        width: MediaQuery.sizeOf(context).width * 0.78,
                                        height: MediaQuery.sizeOf(context).height * 0.04,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '2. Al-hamdu lillahi rabbil-‘alamin',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: Segala puji bagi Allah, Tuhan semesta \nalam',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(3, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Qomariyah,',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEC7700),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Repeat for Surah 3, Surah 4, etc.
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.222,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFDCB),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        180, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa3.png',
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.46,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.03,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '3. Ar-rahmanir-rahim',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: Yang Maha Pengasih lagi \nMaha Penyayang,',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color:Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Syamsiyah,  ',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF587DBD),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        ' Mad Arid Lisukun',
                                        style:GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3EC1D3),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.179,
                          decoration: BoxDecoration(
                            color: Color(0xFFDDEB9D),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        176, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa4.png',
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.48,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.05,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '4. Maliki yaumid-din',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: Pemilik hari Pembalasan',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Mad Layin,',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1976D2),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Qomariyah,',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEC7700),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        ' Mad Arid Lisukun',
                                        style:GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3EC1D3),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.262,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFDCB),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa5.png',
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.7,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.05,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '5. Iyyaka na‘budu wa iyyaka nasta‘in',
                                      style:GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: Hanya kepada Engkaulah kami menyembah dan \nhanya kepada Engkaulah kami memohon \npertolongan.',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 25, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '1. Bismillahir-rahmanir-rahim',
                                            style: GoogleFonts
                                                .notoNaskhArabic(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        ' Mad Arid Lisukun',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3EC1D3),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.229,
                          decoration: BoxDecoration(
                            color: Color(0xFFDDEB9D),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        60, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa6.png',
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.78,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.05,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '6. Ihdinash-shirathal-mustaqim',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Bimbinglah kami ke jalan yang lurus',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Syamsiyah,  ',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF587DBD),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Qamariyah',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEC7700),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Mad arid lisukun',
                                      style:GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3EC1D3),
                                        fontSize: 10,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: MediaQuery.sizeOf(context).height * 0.34,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFDCB),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        55, 20, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Alfa7.png',
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.8,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.09,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 25, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '7. Shirathalladzina an‘amta ‘alaihim ghairil\n-maghdlubi ‘alaihim wa ladl-dlallin',
                                      style:GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF037A16),
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Artinya: (yaitu) jalan orang-orang yang telah\n Engkau beri nikmat, bukan (jalan) mereka yang \ndimurkai dan bukan (pula jalan) orang-orang \nyang sesat.',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Hukum bacaan:',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color:Colors.black,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 13, 0, 0),
                                      child: Text(
                                        'Idhar halqi,',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFF6279C),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Idhar safawi,',
                                        style:GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF746C6C),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Mad Layin,',
                                        style:GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFF8BD00),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Text(
                                        'Alif Lam Qamariyah',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEC7700),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 0, 0, 0),
                                      child: Text(
                                        'Alif Lam Syamsiyah,  ',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF587DBD),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Mad arid lisukun,',
                                      style: GoogleFonts.notoNaskhArabic(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3EC1D3),
                                        fontSize: 10,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 0, 0, 0),
                                      child: Text(
                                        'Mad lazim mutsaqqal kilmi',
                                        style: GoogleFonts.notoNaskhArabic(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF107A88),
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                        ),
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
