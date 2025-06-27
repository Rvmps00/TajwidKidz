import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';

class LearningAlasrfullWidget extends StatefulWidget {
  const LearningAlasrfullWidget({super.key});

  static String routeName = 'LearningAlasr';
  static String routePath = '/learningAlasr';

  @override
  State<LearningAlasrfullWidget> createState() => _LearningAlasrfullWidgetState();
}

class _LearningAlasrfullWidgetState extends State<LearningAlasrfullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers for each Surah's highlighted words
  late TapGestureRecognizer _alifLamQomariyah;
  late TapGestureRecognizer _ikhfaHaqiqi;
  late TapGestureRecognizer _ghunnahMusyaddah;
  late TapGestureRecognizer _alifLamSyamsiah;
  late TapGestureRecognizer _madLayin;
  late TapGestureRecognizer _qolqolahSughro;

  @override
  void initState() {
    super.initState();

    // Tap recognizers for Surah Al-Asr's recitation rules
    _alifLamQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَالْعَصْرِۙ',
          arti: 'Demi masa,',
          hukum: 'Alif Lam Qomariyah',
          caraBaca: ' Ada huruf ال bertemu dengan huruf ain.  Cara membacanya harus terang dan jelas.',
        );
      };

    _ghunnahMusyaddah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'اِنَِّ',
          arti: ' sesungguhnya',
          hukum: 'Ghunnah musyaddah',
          caraBaca: 'Ada huruf nun yang bertasydid. Cara membacanya mendengung dengan disangatkan.',
        );
      };

    _alifLamQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْاَِ',
          arti: ' manusia ',
          hukum: 'Alif lam qomariah',
          caraBaca: 'Ada huruf ال bertemu dengan huruf alif. Cara membacanya harus terang dan jelas.',
        );
      };

    _ikhfaHaqiqi= TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'ْنْسَانَ',
          arti: '  benar-benar ',
          hukum: 'Ikfa haqiqi',
          caraBaca: 'Ada huruf nun mati bertemu dengan huruf sin. Cara membacanya samar-samar dibibir membentuk huruf sin.',
        );
      };

    _alifLamSyamsiah= TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'ْالصّٰلِحٰتِ',
          arti: '  dan beramal saleh ',
          hukum: 'Alif Lam Syamsiah',
          caraBaca: 'Ada huruf nun yang bertasydid. Cara membacanya mendengung dengan disangatkan.',
        );
      };

    _madLayin= TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'ْصَوْا',
          arti: '  untuk kebenaran ',
          hukum: 'Mad layin',
          caraBaca: 'Ada tanda baca fatkkhah bertemu dengan huruf wawu mati. Cara membacanya sekedar lunak dan lemas.',
        );
      };

    _qolqolahSughro= TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'ْلصَّبْرِ ࣖ',
          arti: '  dan kesabaran',
          hukum: 'Qolqolah sughro',
          caraBaca: 'Ada huruf nun yang bertasydid. Cara membacanya mendengung dengan disangatkan.',
        );
      };



  }

  @override
  void dispose() {
    _alifLamQomariyah.dispose();
    _ikhfaHaqiqi.dispose();
    _ghunnahMusyaddah.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alasr.wav'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFAFDCB),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // === HEADER ===
            Container(
              width: width,
              height: height * 0.15,
              color: const Color(0xFF037A16),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Surah Al-Asr',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: FaIcon(
                        _isPlaying
                            ? FontAwesomeIcons.volumeHigh
                            : FontAwesomeIcons.volumeOff,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: _playPauseAudio,
                    ),
                  ],
                ),
              ),
            ),

            // === BODY ===
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Surah 1
                  _buildAyatCard(
                    width,
                    1,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '١. '),
                          TextSpan(
                            text: 'وَالْعَصْرِ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Wal-‘asr(i)',
                    'Demi masa,',
                    'Alif Lam Qomariyah',
                  ),
                  const SizedBox(height: 16),

                  // Surah 2
                  _buildAyatCard(
                    width,
                    2,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٢. '),
                          TextSpan(
                            text: 'إِنَّ ',
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'الْاِِ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                          TextSpan(
                            text: 'نْسَانَ',
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'لَفِيْ خُسْرٍۙ',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    'Innal-insāna lafī khusr(in)',
                    'Sesungguhnya manusia benar-benar berada dalam kerugian.',
                    'Ikhfa Haqiqi, Alif Lam Qomariyah',
                  ),
                  const SizedBox(height: 16),

                  // Surah 3
                  _buildAyatCard(
                    width,
                    3,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٣. '),
                          TextSpan(
                            text: 'اِلَّا الَّذِيْنَ اٰمَنُوْا وَعَمِلُوا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'الصّٰلِحٰتِ ِ',
                            recognizer: _alifLamSyamsiah,
                            style: const TextStyle(color: Color(0xFF587DBD)),
                          ),
                          TextSpan(
                            text: 'وَتَوَاصَوْا بِالْحَقِّ ەۙ وَتَوَا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'صَوْا ِ',
                            recognizer: _madLayin,
                            style: const TextStyle(color: Color(0xFF1976D2)),
                          ),
                          TextSpan(
                            text: 'بِا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'لصَّبْرِ ࣖ ',
                            recognizer: _qolqolahSughro,
                            style: const TextStyle(color: Color(0xFF037A16)),
                          ),
                        ],
                      ),
                    ),
                    'Illal-lażīna āmanū wa ‘amilus-sālihāti',
                    'Kecuali orang-orang yang beriman dan beramal saleh.',
                    'Ghunnah Musyaddah, Mad Layin, Qolqolah Sughra',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAyatCard(double width, int ayatIndex, dynamic arabic,
      String latin, String arti, String hukum) {
    Color bgColor =
    (ayatIndex % 2 != 0) ? const Color(0xFFFAFDCB) : const Color(0xFFDDEB9D);
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          arabic,
          const SizedBox(height: 12),
          Text(
            latin,
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            arti,
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Hukum Bacaan: $hukum',
            textAlign: TextAlign.justify,
            style:
            GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showWordDialog(BuildContext context,
      {required String word,
        required String arti,
        required String hukum,
        required String caraBaca}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFAFDCB),
          title: Text(word,
              style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Arti: $arti'),
              const SizedBox(height: 8),
              Text('Hukum Bacaan:\n$hukum'),
              const SizedBox(height: 8),
              Text('Cara Membaca:\n$caraBaca'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tutup')),
          ],
        );
      },
    );
  }
}
