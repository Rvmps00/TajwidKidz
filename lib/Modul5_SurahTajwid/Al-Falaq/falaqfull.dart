import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlFalaqFullWidget extends StatefulWidget {
  const LearningAlFalaqFullWidget({super.key});

  static String routeName = 'LearningFalaqFull';
  static String routePath = '/learningFalaqFull';

  @override
  State<LearningAlFalaqFullWidget> createState() =>
      _LearningAlFalaqFullWidgetState();
}

class _LearningAlFalaqFullWidgetState
    extends State<LearningAlFalaqFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers
  late TapGestureRecognizer _falaqQomariyah;
  late TapGestureRecognizer _falaqQalqalah;
  late TapGestureRecognizer _minSharri1;
  late TapGestureRecognizer _khalaqa;
  late TapGestureRecognizer _minSharri2;
  late TapGestureRecognizer _ghasiqinI;
  late TapGestureRecognizer _waqaba;
  late TapGestureRecognizer _minSharri3;
  late TapGestureRecognizer _naffasat;
  late TapGestureRecognizer _uqadiQomariyah;
  late TapGestureRecognizer _uqadiQalqalah;
  late TapGestureRecognizer _minSharri4;
  late TapGestureRecognizer _hasidinI;
  late TapGestureRecognizer _hasada;

  @override
  void initState() {
    super.initState();

    _falaqQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْفَلَقِ',
          arti: 'Fajar',
          hukum: 'Alif Lam Qomariyah',
          caraBaca: 'Ada ال bertemu ف, dibaca terang dan jelas.',
        );
      };
    _falaqQalqalah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْفَلَقِ',
          arti: 'Fajar',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Huruf ق di akhir kalimat, dibaca jelas mantul.',
        );
      };
    _minSharri1 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِنْ شَرِّ',
          arti: 'Dari kejahatan',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Kasrohtain bertemu ش, dibaca samar di bibir.',
        );
      };
    _khalaqa = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'خَلَقَ',
          arti: 'Dia ciptakan',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Huruf ق di akhir, dibaca mantul jelas.',
        );
      };
    _minSharri2 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِنْ شَرِّ',
          arti: 'Dari kejahatan',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Kasrohtain bertemu ش, dibaca samar di bibir.',
        );
      };
    _ghasiqinI = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'غَاسِقٍ إِ',
          arti: 'Kegelapan',
          hukum: 'Idhar Halqi',
          caraBaca: 'Kasrohtain bertemu إ, dibaca terang.',
        );
      };
    _waqaba = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَقَبَ',
          arti: 'Gelap gulita',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Huruf ب di akhir kalimat, mantul jelas.',
        );
      };
    _minSharri3 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِنْ شَرِّ',
          arti: 'Dari kejahatan',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Kasrohtain bertemu ش, dibaca samar di bibir.',
        );
      };
    _naffasat = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'النَّفَّاثَاتِ',
          arti: 'Penyihir',
          hukum: 'Alif Lam Syamsiyah',
          caraBaca: 'ال bertemu نّ, dibaca masuk ke نّ.',
        );
      };
    _uqadiQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْعُقَدِ',
          arti: 'Buhul',
          hukum: 'Alif Lam Qomariyah',
          caraBaca: 'ال bertemu ع, dibaca terang.',
        );
      };
    _uqadiQalqalah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْعُقَدِ',
          arti: 'Buhul',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Huruf د di akhir, mantul jelas.',
        );
      };
    _minSharri4 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِنْ شَرِّ',
          arti: 'Dari kejahatan',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Nun mati bertemu ش, dibaca samar di bibir.',
        );
      };
    _hasidinI = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'حَاسِدٍ إِ',
          arti: 'Pendengki',
          hukum: 'Idhar Halqi',
          caraBaca: 'Kasrohtain bertemu ا, dibaca terang.',
        );
      };
    _hasada = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'حَسَدَ',
          arti: 'Dengki',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Huruf د di akhir kalimat, mantul jelas.',
        );
      };
  }

  @override
  void dispose() {
    _falaqQomariyah.dispose();
    _falaqQalqalah.dispose();
    _minSharri1.dispose();
    _khalaqa.dispose();
    _minSharri2.dispose();
    _ghasiqinI.dispose();
    _waqaba.dispose();
    _minSharri3.dispose();
    _naffasat.dispose();
    _uqadiQomariyah.dispose();
    _uqadiQalqalah.dispose();
    _minSharri4.dispose();
    _hasidinI.dispose();
    _hasada.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alfalaq.wav'));
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
                        'Surah Al-Falaq',
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
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '١. قُلْ أَعُوذُ بِرَبِّ '),
                          TextSpan(
                              text: 'الْفَلَقِ',
                              recognizer: _falaqQomariyah,
                              style: const TextStyle(color: Color(0xFFEC7700))),
                          TextSpan(
                              text: ' ',
                              recognizer: _falaqQalqalah,
                              style: const TextStyle(color: Color(0xFF3EB489))),
                        ],
                      ),
                    ),
                    'Qul a‘ūżu birabbil-falaq(i).',
                    'Katakanlah, “Aku berlindung kepada Tuhan yang (menjaga) fajar (subuh)”.',
                    'Alif Lam Qomariyah, Qalqalah Kubra',
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
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٢. '),
                          TextSpan(
                              text: 'مِنْ شَرِّ ',
                              recognizer: _minSharri1,
                              style: const TextStyle(color: Color(0xFF910D0D))),
                          const TextSpan(text: 'مَا '),
                          TextSpan(
                              text: 'خَلَقَ',
                              recognizer: _khalaqa,
                              style: const TextStyle(color: Color(0xFF3EB489))),
                        ],
                      ),
                    ),
                    'Min syarri mā khalaq(a).',
                    'Dari kejahatan (makhluk yang) Dia ciptakan.',
                    'Ikhfa Haqiqi, Qalqalah Kubra',
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
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٣. '),
                          TextSpan(
                              text: 'مِنْ شَرِّ ',
                              recognizer: _minSharri2,
                              style: const TextStyle(color: Color(0xFF910D0D))),
                          TextSpan(
                              text: 'غَاسِقٍ إِ',
                              recognizer: _ghasiqinI,
                              style: const TextStyle(color: Color(0xFFF6279C))),
                          const TextSpan(text: 'ذَا '),
                          TextSpan(
                              text: 'وَقَبَ',
                              recognizer: _waqaba,
                              style: const TextStyle(color: Color(0xFF3EB489))),
                        ],
                      ),
                    ),
                    'Wa min syarri gāsiqin iżā waqab(a).',
                    'Dari kejahatan malam apabila telah gelap gulita.',
                    'Ikhfa Haqiqi, Idhar Halqi, Qalqalah Kubra',
                  ),
                  const SizedBox(height: 16),

                  _buildAyatCard(
                    width,
                    4,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٤. '),
                          TextSpan(
                              text: 'مِنْ شَرِّ ',
                              recognizer: _minSharri3,
                              style: const TextStyle(color: Color(0xFF6F0C0C))),
                          TextSpan(
                              text: 'النَّفَّاثَاتِ ',
                              recognizer: _naffasat,
                              style: const TextStyle(color: Color(0xFF587DBD))),
                          const TextSpan(text: 'فِي '),
                          TextSpan(
                              text: 'الْعُقَدِ',
                              recognizer: _uqadiQomariyah,
                              style: const TextStyle(color: Color(0xFFEC7700))),
                          TextSpan(
                              text: ' ',
                              recognizer: _uqadiQalqalah,
                              style: const TextStyle(color: Color(0xFF3EB489))),
                        ],
                      ),
                    ),
                    'Wa min syarrin-naffāṡāti fil-‘uqad(i).',
                    'Dari kejahatan perempuan-perempuan (penyihir) yang meniup pada buhul-buhul (talinya).',
                    'Ikhfa Haqiqi, Alif Lam Qomariyah, Alif Lam Syamsiyah, Qalqalah Kubra',
                  ),
                  const SizedBox(height: 16),

                  _buildAyatCard(
                    width,
                    5,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٥. '),
                          TextSpan(
                              text: 'مِنْ شَرِّ ',
                              recognizer: _minSharri4,
                              style: const TextStyle(color: Color(0xFF910D0D))),
                          TextSpan(
                              text: 'حَاسِدٍ إِ',
                              recognizer: _hasidinI,
                              style: const TextStyle(color: Color(0xFFF6279C))),
                          const TextSpan(text: 'ذَا '),
                          TextSpan(
                              text: 'حَسَدَ',
                              recognizer: _hasada,
                              style: const TextStyle(color: Color(0xFF3EB489))),
                        ],
                      ),
                    ),
                    'Wa min syarri ḥāsidin iżā ḥasad(a).',
                    'Dan dari kejahatan orang yang dengki apabila dia dengki.”',
                    'Ikhfa Haqiqi, Idhar Halqi, Qalqalah Kubra',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAyatCard(
      double width, int ayatIndex, dynamic arabic, String latin, String arti, String hukum) {
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
            style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.bold),
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
