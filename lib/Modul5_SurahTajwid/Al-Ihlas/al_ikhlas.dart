import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlIkhlasFullWidget extends StatefulWidget {
  const LearningAlIkhlasFullWidget({super.key});

  static String routeName = 'LearningAlIkhlas';
  static String routePath = '/learningAlIkhlas';

  @override
  State<LearningAlIkhlasFullWidget> createState() =>
      _LearningAlIkhlasFullWidgetState();
}

class _LearningAlIkhlasFullWidgetState
    extends State<LearningAlIkhlasFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers
  late TapGestureRecognizer _allahRecognizer;
  late TapGestureRecognizer _ahadRecognizer;
  late TapGestureRecognizer _allah2Recognizer;
  late TapGestureRecognizer _shamadRecognizer;
  late TapGestureRecognizer _dalShamadRecognizer;
  late TapGestureRecognizer _lamYalidRecognizer;
  late TapGestureRecognizer _dalYalidRecognizer;
  late TapGestureRecognizer _lamYuuRecognizer;
  late TapGestureRecognizer _dalYuuRecognizer;
  late TapGestureRecognizer _lamYakunRecognizer;
  late TapGestureRecognizer _lahuRecognizer;
  late TapGestureRecognizer _kufuwanRecognizer;
  late TapGestureRecognizer _ahad4Recognizer;

  @override
  void initState() {
    super.initState();

    _allahRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'اللّٰهُ',
          arti: 'Allah',
          hukum: 'Lam Jalalah Tafkhim',
          caraBaca: 'Dibaca ditebalkan.',
        );
      };
    _ahadRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'اَحَدٌۚ',
          arti: 'Yang Maha Esa',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Dibaca jelas dan mantul.',
        );
      };
    _allah2Recognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'اللّٰهُ',
          arti: 'Allah',
          hukum: 'Lam Jalalah Tafkhim',
          caraBaca: 'Dibaca ditebalkan.',
        );
      };
    _shamadRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الصَّمَدُ',
          arti: 'Tempat bergantung',
          hukum: 'Alif Lam Syamsiyah',
          caraBaca: 'Masuk ke ص.',
        );
      };
    _dalShamadRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الصَّمَدُ',
          arti: 'Tempat bergantung',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Dibaca mantul.',
        );
      };
    _lamYalidRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَمْ يَلِدْ',
          arti: 'Tidak beranak',
          hukum: 'Idhar Safawi',
          caraBaca: 'Mim mati bertemu Ya.',
        );
      };
    _dalYalidRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'يَلِدْ',
          arti: 'Beranak',
          hukum: 'Qalqalah Sugra',
          caraBaca: 'Mantul pelan.',
        );
      };
    _lamYuuRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَلَمْ يُو',
          arti: 'Tidak dilahirkan',
          hukum: 'Idhar Safawi',
          caraBaca: 'Mim mati bertemu Ya.',
        );
      };
    _dalYuuRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'يُوْلَدْ',
          arti: 'Dilahirkan',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Mantul di akhir.',
        );
      };
    _lamYakunRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَلَمْ يَكُنْ',
          arti: 'Dan tidak ada',
          hukum: 'Idhar Safawi',
          caraBaca: 'Mim mati bertemu Ya.',
        );
      };
    _lahuRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَهُ',
          arti: 'Bagi-Nya',
          hukum: 'Mad Shilah Qashirah',
          caraBaca: 'Panjang 2 harakat.',
        );
      };
    _kufuwanRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'كُفُوًا أَ',
          arti: 'Yang setara',
          hukum: 'Idhar Halqi',
          caraBaca: 'Fathah tain bertemu Alif.',
        );
      };
    _ahad4Recognizer = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'أَحَدٌ',
          arti: 'Satu',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Mantul di akhir.',
        );
      };
  }

  @override
  void dispose() {
    _allahRecognizer.dispose();
    _ahadRecognizer.dispose();
    _allah2Recognizer.dispose();
    _shamadRecognizer.dispose();
    _dalShamadRecognizer.dispose();
    _lamYalidRecognizer.dispose();
    _dalYalidRecognizer.dispose();
    _lamYuuRecognizer.dispose();
    _dalYuuRecognizer.dispose();
    _lamYakunRecognizer.dispose();
    _lahuRecognizer.dispose();
    _kufuwanRecognizer.dispose();
    _ahad4Recognizer.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alikhlas.wav'));
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
            // === HEADER FIX ===
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
                        'Surah Al-Ikhlas',
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
                  _buildAyatCard(width, 1, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        const TextSpan(text: '١. ', style: TextStyle(color: Colors.black)),
                        const TextSpan(text: 'قُلْ هُوَ ', style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'اللّٰهُ ',
                          recognizer: _allahRecognizer,
                          style: const TextStyle(color: Color(0xFF6F0C0C)),
                        ),
                        TextSpan(
                          text: 'اَحَدٌۚ',
                          recognizer: _ahadRecognizer,
                          style: const TextStyle(color: Color(0xFF3EB489)),
                        ),
                      ],
                    ),
                  ), 'Qul huwallāhu ahad(un).',
                      'Katakanlah, “Dia-lah Allah, Yang Maha Esa.”',
                      'Lam Jalalah Tafkhim, Qalqalah Kubra'),
                  const SizedBox(height: 16),
                  _buildAyatCard(width, 2, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        const TextSpan(text: '٢. ', style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'اللّٰهُ ',
                          recognizer: _allah2Recognizer,
                          style: const TextStyle(color: Color(0xFF910D0D)),
                        ),
                        TextSpan(
                          text: 'الصَّمَدُ',
                          recognizer: _shamadRecognizer,
                          style: const TextStyle(color: Color(0xFF587DBD)),
                        ),
                        TextSpan(
                          text: ' ',
                          recognizer: _dalShamadRecognizer,
                          style: const TextStyle(color: Color(0xFF3EB489)),
                        ),
                      ],
                    ),
                  ), 'Allāhus-samad(u).',
                      'Allah tempat bergantung segala sesuatu.',
                      'Lam Jalalah Tafkhim, Alif Lam Syamsiyah, Qalqalah Kubra'),
                  const SizedBox(height: 16),
                  _buildAyatCard(width, 3, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        const TextSpan(text: '٣. ', style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'لَمْ يَلِدْ ',
                          recognizer: _lamYalidRecognizer,
                          style: const TextStyle(color: Color(0xFF746C6C)),
                        ),
                        TextSpan(
                          text: 'يَلِدْ ',
                          recognizer: _dalYalidRecognizer,
                          style: const TextStyle(color: Color(0xFF037A16)),
                        ),
                        TextSpan(
                          text: 'وَلَمْ يُو ',
                          recognizer: _lamYuuRecognizer,
                          style: const TextStyle(color: Color(0xFF746C6C)),
                        ),
                        TextSpan(
                          text: 'يُوْلَدْۙ',
                          recognizer: _dalYuuRecognizer,
                          style: const TextStyle(color: Color(0xFF3EB489)),
                        ),
                      ],
                    ),
                  ), 'Lam yalid wa lam yūlad.',
                      'Dia tidak beranak dan tidak pula diperanakkan.',
                      'Idhar Safawi, Qalqalah Sugra, Qalqalah Kubra'),
                  const SizedBox(height: 16),
                  _buildAyatCard(width, 4, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        const TextSpan(text: '٤. ', style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'وَلَمْ يَكُنْ ',
                          recognizer: _lamYakunRecognizer,
                          style: const TextStyle(color: Color(0xFF746C6C)),
                        ),
                        TextSpan(
                          text: 'لَهُ ',
                          recognizer: _lahuRecognizer,
                          style: const TextStyle(color: Color(0xFF7939E7)),
                        ),
                        TextSpan(
                          text: 'كُفُوًا أَ ',
                          recognizer: _kufuwanRecognizer,
                          style: const TextStyle(color: Color(0xFFCA4BB0)),
                        ),
                        TextSpan(
                          text: 'أَحَدٌ',
                          recognizer: _ahad4Recognizer,
                          style: const TextStyle(color: Color(0xFF3EB489)),
                        ),
                      ],
                    ),
                  ), 'Wa lam yakun lahū kufuwan aḥad(un).',
                      'Dan tidak ada sesuatu pun yang setara dengan-Nya.',
                      'Idhar Safawi, Mad Shilah Qashirah, Idhar Halqi, Qalqalah Kubra'),
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
          Text(latin,
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(arti,
              textAlign: TextAlign.justify,
              style: GoogleFonts.inter(fontSize: 14)),
          const SizedBox(height: 8),
          Text('Hukum Bacaan: $hukum',
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
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
            title: Text(word, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
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
        });
  }
}
