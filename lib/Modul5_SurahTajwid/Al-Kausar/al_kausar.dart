import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlKausarFullWidget extends StatefulWidget {
  const LearningAlKausarFullWidget({super.key});

  static String routeName = 'LearningAlKausar';
  static String routePath = '/learningAlKausar';

  @override
  State<LearningAlKausarFullWidget> createState() =>
      _LearningAlKausarFullWidgetState();
}

class _LearningAlKausarFullWidgetState
    extends State<LearningAlKausarFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers untuk ayat 1-3
  late TapGestureRecognizer _innaGhunah;
  late TapGestureRecognizer _innaMadJaiz;
  late TapGestureRecognizer _atainaMadLayin;
  late TapGestureRecognizer _kautsarQomariyah;
  late TapGestureRecognizer _kautsarMadLayin;

  late TapGestureRecognizer _wanharIdhar;

  late TapGestureRecognizer _inna3Ghunah;
  late TapGestureRecognizer _abtarQomariyah;

  @override
  void initState() {
    super.initState();

    _innaGhunah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'إِنَّا',
          arti: 'Sesungguhnya Kami',
          hukum: '1. Ghunnah Musyaddah \n 2. Mad jaiz, ',
          caraBaca: '1. Huruf nun bertasydid, dibaca masuk dengan dengung.\n'
              '2. Ada huruf mad thabi’i bertemu dengan huruf hamzah di lain kalimat. Cara membacanya panjang seperti mad thabi’i 2 harakat atau 4 harakat.',
        );
      };

    _innaMadJaiz = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'إِنَّا أَ',
          arti: 'Sesungguhnya Kami',
          hukum: 'Ghunnah Musyaddah & Mad Jaiz',
          caraBaca:
          'Ghunnah Musyaddah: Nun bertasydid, dibaca masuk dengan dengung.\n'
              'Mad Jaiz: Huruf mad thabi’i bertemu hamzah lain kalimat, panjang 2 atau 4 harakat.',
        );
      };

    _atainaMadLayin = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'عْطَيْنَا',
          arti: 'Kami beri',
          hukum: 'Mad Layin',
          caraBaca: 'Fatkhah bertemu ya mati, dibaca lunak dan lemas.',
        );
      };

    _kautsarQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْكَوْثَر',
          arti: 'Nikmat banyak',
          hukum: '1. Alif Lam Qomariyah\n'
              '2. Mad layin',
          caraBaca: 'ال bertemu ك, dibaca terang dan jelas.'  '\n  2. karena ada tanda baca fatkkhah bertemu dengan huruf wawu mati. Cara membacanya sekedar lunak dan lemas.',
        );
      };

    _kautsarMadLayin = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْكَوْثَر',
          arti: 'Nikmat banyak',
          hukum: 'Mad Layin',
          caraBaca: 'Fatkhah bertemu wawu mati, dibaca lunak dan lemas.',
        );
      };

    _wanharIdhar = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَانْحَرْ',
          arti: 'Dan berkurbanlah',
          hukum: 'Idhar Halqi',
          caraBaca: 'Fathah tanwin bertemu ha, dibaca jelas di mulut.',
        );
      };

    _inna3Ghunah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'إِنَّ',
          arti: 'Sesungguhnya',
          hukum: 'Ghunnah Musyaddah',
          caraBaca: 'Huruf nun bertasydid, dibaca masuk dengan dengung.',
        );
      };

    _abtarQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْأَبْتَرُ',
          arti: 'Yang terputus',
          hukum: 'Alif Lam Qomariyah',
          caraBaca: 'ال bertemu alif, dibaca terang dan jelas.',
        );
      };
  }

  @override
  void dispose() {
    _innaGhunah.dispose();
    _innaMadJaiz.dispose();
    _atainaMadLayin.dispose();
    _kautsarQomariyah.dispose();
    _kautsarMadLayin.dispose();
    _wanharIdhar.dispose();
    _inna3Ghunah.dispose();
    _abtarQomariyah.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alkausar.wav'));
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
                        'Surah Al-Kausar',
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
                  _buildAyatCard(
                    width,
                    1,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '١. '),
                          TextSpan(
                            text: 'إِنَّا ',
                            recognizer: _innaGhunah,
                            style: const TextStyle(color: Colors.purple),
                          ),
                          TextSpan(
                            text: 'أَ',
                            recognizer: _innaMadJaiz,
                            style: const TextStyle(color: Colors.purple),
                          ),
                          const TextSpan(text: 'عْطَيْنَا '),
                          TextSpan(
                            text: 'عْطَيْنَا',
                            recognizer: _atainaMadLayin,
                            style: const TextStyle(color: Color(0xFFFFB22C)),
                          ),
                          TextSpan(
                            text: ' الْكَوْثَر ',
                            recognizer: _kautsarQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Innā a‘tainākal-kauṡar(a).',
                    'Sesungguhnya Kami telah memberimu (Nabi Muhammad) nikmat yang banyak.',
                    'Ghunnah Musyaddah, Mad Jaiz, Mad Layin, Alif Lam Qomariyah',
                  ),
                  const SizedBox(height: 16),

                  _buildAyatCard(
                    width,
                    2,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٢. فَصَلِّ لِرَبِّكَ '),
                          TextSpan(
                            text: 'وَانْحَرْ',
                            recognizer: _wanharIdhar,
                            style: const TextStyle(color: Color(0xFFCA4BB0)),
                          ),
                        ],
                      ),
                    ),
                    'Fasalli lirabbika wanhar.',
                    'Maka, laksanakanlah salat karena Tuhanmu dan berkurbanlah!',
                    'Idhar Halqi',
                  ),
                  const SizedBox(height: 16),

                  _buildAyatCard(
                    width,
                    3,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٣. '),
                          TextSpan(
                            text: 'إِنَّ ',
                            recognizer: _inna3Ghunah,
                            style: const TextStyle(color: Colors.purple),
                          ),
                          const TextSpan(text: 'شَانِئَكَ هُوَ '),
                          TextSpan(
                            text: 'الْأَبْتَرُ',
                            recognizer: _abtarQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Inna syāni’aka huwal-abtar(u).',
                    'Sesungguhnya orang yang membencimu, dialah yang terputus (dari rahmat Allah).',
                    'Ghunnah Musyaddah, Alif Lam Qomariyah',
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
