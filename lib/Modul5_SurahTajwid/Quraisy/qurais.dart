import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer
import 'package:audioplayers/audioplayers.dart';

class LearningQuraisyFullWidget extends StatefulWidget {
  const LearningQuraisyFullWidget({super.key});

  static String routeName = 'LearningQuraisyFull';
  static String routePath = '/learningQuraisyFull';

  @override
  State<LearningQuraisyFullWidget> createState() =>
      _LearningQuraisyFullWidgetState();
}

class _LearningQuraisyFullWidgetState
    extends State<LearningQuraisyFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers for each ayah's highlighted words
  late TapGestureRecognizer _quraisyMadLayin;
  late TapGestureRecognizer _idharsafawi;
  late TapGestureRecognizer _alifLamSyamsiyah;
  late TapGestureRecognizer _alifLamQomariyah;
  late TapGestureRecognizer _qolqolahSughra;
  late TapGestureRecognizer _idhgamMutamasilaen;
  late TapGestureRecognizer _ikhfaHaqiqi;
  late TapGestureRecognizer _idghamBighunnah;
  late TapGestureRecognizer _alifLamSyamsiyah2; // Added for "وَالصَّيْفِۚ"
  late TapGestureRecognizer _madLayin;

  late TapGestureRecognizer _idghamMimi; // Added for "وَآمَنَهُمْ"
  late TapGestureRecognizer _idharHalqi; // Added for "مِنْ خَوْفٍ"

  @override
  void initState() {
    super.initState();

    // Tap recognizers for Surah Quraisy's recitation rules
    _quraisyMadLayin = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'قُرَيْشٍ',
          arti: 'Quraisy',
          hukum: 'Mad Layin',
          caraBaca: 'Karena ada tanda baca fatkhah bertemu dengan huruf ya mati. Cara membacanya lunak dan lemas.',
        );
      };

    _idharsafawi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'اٖلٰفِهِمْ',
          arti: 'Kebiasaan mereka',
          hukum: 'Idhar Safawi',
          caraBaca: 'Karena ada huruf mim mati/sukun bertemu dengan huruf ro. Cara membacanya terang di bibir dengan mulut tertutup.',
        );
      };

    _alifLamSyamsiyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الشِّتَاۤءِ',
          arti: 'Musim dingin',
          hukum: 'Alif Lam Syamsiyah',
          caraBaca: 'Karena ada huruf الْ bertemu dengan huruf ش. Cara membacanya dimasukkan ke huruf ش.',
        );
      };

    _alifLamQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْبَيْتِ',
          arti: 'Rumah (Kaabah)',
          hukum: 'Alif Lam Qomariyah, Mad Layin',
          caraBaca: 'Alif Lam bertemu dengan ب, dibaca terang dan jelas. Mad Layin, karena ada tanda baca fatkhah bertemu dengan huruf يْ. Cara membacanya sekedar lunak dan lemas.',
        );
      };

    // 4th Ayah recognizers
    _qolqolahSughra = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'أَطْعَمَهُمْ',
          arti: 'Memberi makan mereka',
          hukum: '1. Qolqolah Sughra \n 2. Idgham Mimi',
          caraBaca: '1. Karena ada huruf جْ di dalam kalimat. Cara membacanya membalik membentuk huruf ج.\n 2. Ada huruf مْ bertemu dengan huruf م. Cara membacanya dimasukan dengan mendengung.',
        );
      };

    _idhgamMutamasilaen = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'أَطْعَمَهُم مِّن',
          arti: 'Memberi makan mereka dari',
          hukum: 'Idgham Mutamasilaen (Idgham Mimi)',
          caraBaca: 'Karena ada huruf مْ bertemu dengan huruf م. Cara membacanya dimasukan dengan mendengung.',
        );
      };

    _ikhfaHaqiqi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِّن جُوعٍ',
          arti: 'Dari rasa lapar',
          hukum: '1. Ikhfa Haqiqi \n 2. Idgham bighunnah',
          caraBaca: '1.Karena ada نْ bertemu dengan huruf ج. Cara membacanya samar-samar membentuk huruf ج.\n 2. Ada kasrahtain bertemu dengan huruf و. Cara membacanya masuk dengan mendengung.',
        );
      };

    _idghamBighunnah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'جُوعٍ وَ',
          arti: 'Kelaparan dan',
          hukum: 'Idgham Bighunnah',
          caraBaca: 'Karena ada kasrahtain bertemu dengan huruf و. Cara membacanya masuk dengan mendengung.',
        );
      };

    // New recognizers for Ayah 2's "وَالصَّيْفِۚ"
    _alifLamSyamsiyah2 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَالصَّيْفِۚ',
          arti: 'Dan Musim Panas',
          hukum: 'Alif Lam Syamsiyah, Mad Layin',
          caraBaca: 'Alif Lam bertemu dengan ص, cara membacanya dimasukkan ke huruf ص. Mad Layin karena ada fathah bertemu dengan يْ.',
        );
      };

    _madLayin = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَالصَّيْفِۚ',
          arti: 'Dan Musim Panas',
          hukum: 'Mad Layin',
          caraBaca: 'Karena ada tanda baca fathah bertemu dengan huruf يْ. Cara membacanya sekedar lunak dan lemas.',
        );
      };

    // Added recognizers for Idgham Mimi and Idhar Halqi
    _idghamMimi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَآمَنَهُمْ',
          arti: 'Dan mengamankan mereka',
          hukum: 'Idgham Mimi',
          caraBaca: 'Karena ada huruf مْ bertemu dengan huruf م. Cara membacanya dimasukkan dengan mendengung.',
        );
      };

    _idharHalqi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِنْ خَوْفٍ',
          arti: 'Dari rasa takut',
          hukum: '1. Idhar Halqi\n 2. Mad layin',
          caraBaca: '1. Karena ada huruf نْ bertemu dengan huruf خ. Cara membacanya adalah jelas di mulut.\n 2.Ada tanda baca fatkkhah bertemu dengan huruf وْ. Cara membacanya sekedar lunak dan lemas.',
        );
      };
  }

  @override
  void dispose() {
    _quraisyMadLayin.dispose();
    _idharsafawi.dispose();
    _alifLamSyamsiyah.dispose();
    _alifLamQomariyah.dispose();
    _qolqolahSughra.dispose();
    _idhgamMutamasilaen.dispose();
    _ikhfaHaqiqi.dispose();
    _idghamBighunnah.dispose();
    _alifLamSyamsiyah2.dispose();
    _madLayin.dispose();
    _idghamMimi.dispose();
    _idharHalqi.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/quraisy.wav'));
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
                        'Surah Quraisy',
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
                  // Ayat 1
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
                            text: 'لِاِيْلٰفِ ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'قُرَيْشٍۙ ',
                            recognizer: _quraisyMadLayin,
                            style: const TextStyle(color: Color(0xFF1976D2)),
                          ),
                        ],
                      ),
                    ),
                    'Liīlāfi qurāyish(in).',
                    'Disebabkan oleh kebiasaan orang-orang Quraisy.',
                    'Mad Layin',
                  ),
                  const SizedBox(height: 16),

                  // Ayat 2
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
                            text: 'اٖلٰفِهِمْ رِِۚ',
                            recognizer: _idharsafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'حْلَةَ ا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'لشِّتَاۤءِ',
                            recognizer: _alifLamSyamsiyah,
                            style: const TextStyle(color: Color(0xFF587DBD)),
                          ),
                          TextSpan(
                            text: 'وَالصَّيْفِۚ',
                            recognizer: _alifLamSyamsiyah2,
                            style: const TextStyle(color: Color(0xFF587DBD)),
                          ),
                        ],
                      ),
                    ),
                    'Ilāfihim riḥlatasy-syitā i was-saif(i).',
                    'Yaitu kebiasaan mereka bepergian pada musim dingin dan musim panas.',
                    'Idhar Safawi, Alif Lam Syamsiyah, Mad Layin',
                  ),
                  const SizedBox(height: 16),

                  // Ayat 3
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
                            text: 'فَلْيَعْبُدُوْا رَبَّ هٰذَا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'الْبَيْتِۙ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Faly‘budū rabba hāżal-bait(i).',
                    'Maka hendaklah mereka menyembah Tuhan (pemilik) rumah ini (Ka‘bah).',
                    'Alif Lam Qomariyah, Mad Layin',
                  ),
                  const SizedBox(height: 16),

                  // 4th Ayah (New part)
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
                            text: 'الَّذِيْٓ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' أَطْعَمَهُمْ',
                            recognizer: _qolqolahSughra,
                            style: const TextStyle(color: Color(0xFF037A16)),
                          ),
                          const TextSpan(text: ' '), // Add space between words
                          TextSpan(
                            text: 'مِنْ جُوْعٍ ',
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'وَٰٓمَنَهُمْ',
                            recognizer: _idghamMimi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          const TextSpan(text: ' '), // Add space between words
                          TextSpan(
                            text: 'مِنْ خَوْفٍ',
                            recognizer: _idharHalqi,
                            style: const TextStyle(color: Color(0xFFF6279C)),
                          ),
                        ],
                      ),
                    ),
                    'Allāzi aṭ‘amahuṁ min jū‘in wa āmanahum min khauf(in).',
                    'Yang telah memberi mereka makanan untuk menghilangkan lapar dan mengamankan mereka dari rasa takut.',
                    'Qolqolah Sughra, Idgham Mutamasilaen, Ikhfa Haqiqi, Idgham Bighunnah',
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
