import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlKafirunFullWidget extends StatefulWidget {
  const LearningAlKafirunFullWidget({super.key});

  static String routeName = 'LearningAlKafirun';
  static String routePath = '/learningAlKafirun';

  @override
  State<LearningAlKafirunFullWidget> createState() =>
      _LearningAlKafirunFullWidgetState();
}

class _LearningAlKafirunFullWidgetState
    extends State<LearningAlKafirunFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap recognizers for each ayah's highlighted words
  late TapGestureRecognizer _yaMadJaiz;
  late TapGestureRecognizer _alifLamQomariyah;
  late TapGestureRecognizer _madAridLisukun;

  late TapGestureRecognizer _laMadJaiz;
  late TapGestureRecognizer _taMadAridLisukun;

  late TapGestureRecognizer _waMadJaiz;
  late TapGestureRecognizer _ikhfaHaqiqi;
  late TapGestureRecognizer _qolqolahKubro;

  late TapGestureRecognizer _bighunnah;
  late TapGestureRecognizer _mutajanisaen;
  late TapGestureRecognizer _idharsafawi;

  @override
  void initState() {
    super.initState();

    // Ayat 1 - Highlight specific words for Mad Jaiz, Alif Lam Qomariyah, Mad Arid Lisukun
    _yaMadJaiz = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'يَا أَيُّهَا',
          arti: 'Wahai',
          hukum: 'Mad Jaiz',
          caraBaca: 'Panjang 2 atau 4 harakat karena huruf mad thabi’i bertemu dengan hamzah.',
        );
      };

    _alifLamQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْكَافِرُونَ',
          arti: 'Orang-orang kafir',
          hukum: '1. Alif Lam Qomariyah \n 2.Mad arid lisukun',
          caraBaca: '1. Huruf alif lam bertemu dengan kaf, dibaca terang dan jelas\n'
          '2. karena ada waqaf yang sebelumnya ada huruf mad thabi’i. Cara membacanya boleh panjang 4 harakat atau lebih dan juga boleh dua harakat',
        );
      };

    _madAridLisukun = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'فِرُونَ',
          arti: 'Kafirun',
          hukum: 'Mad Arid Lisukun',
          caraBaca: 'Panjang bisa 2 atau 4 harakat atau lebih karena ada waqaf.',
        );
      };

    // Ayat 2 - Highlight specific words for Mad Jaiz, Mad Arid Lisukun
    _laMadJaiz = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَا أَعْبُدُ',
          arti: 'Aku tidak akan menyembah',
          hukum: 'Mad Jaiz',
          caraBaca: 'Panjang seperti mad thabi’i 2 harakat atau 4 harakat.',
        );
      };

    _taMadAridLisukun = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'تَعْبُدُونَ',
          arti: 'Apa yang kamu sembah',
          hukum: 'Mad Arid Lisukun',
          caraBaca: 'Panjang bisa 4 harakat atau lebih karena ada waqaf.',
        );
      };

    // Ayat 3 - Highlight specific words for Mad Jaiz, Ikhfa Haqiqi, Qolqolah Kubra
    _waMadJaiz = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَلَا أَ',
          arti: 'Dan tidak',
          hukum: 'Mad Jaiz',
          caraBaca: 'Panjang seperti mad thabi’i 2 harakat atau 4 harakat.',
        );
      };

    _ikhfaHaqiqi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'أَنتُمْ',
          arti: 'Kalian',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Nun mati bertemu dengan huruf ta, dibaca samar-samar membentuk ta.',
        );
      };

    _qolqolahKubro = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'أَعْبُدُ',
          arti: 'Aku sembah',
          hukum: 'Qolqolah Kubra',
          caraBaca: 'Ada huruf dal mati di akhir kalimat, dibaca dengan membalik membentuk huruf dal.',
        );
      };

    // Ayat 4 - Highlight specific words for Mad Jaiz, Idgham Bighunnah, Idgham Mutajanisain
    _bighunnah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'بِدٌ مَّا',
          arti: 'Mim bertasydid',
          hukum: 'Idgham Bighunnah',
          caraBaca: 'Ada fatkhahtain bertemu dengan huruf mim, dibaca dengan mendengung.',
        );
      };

    _mutajanisaen = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'عَبَدتُّمْ',
          arti: 'Kalian sembah',
          hukum: 'Idgham Mutajanisain',
          caraBaca: 'Huruf dal mati bertemu dengan huruf ta, dibaca masuk ke huruf pertama dan kedua.',
        );
      };

    // Ayat 6 - Highlight specific words for Idhar Safawi, Mad Arid Lisukun
    _idharsafawi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَكُمْ دِ',
          arti: 'Untukmu',
          hukum: 'Idhar Safawi',
          caraBaca: 'Mim mati bertemu dengan dal, dibaca terang di bibir dengan mulut tertutup.',
        );
      };
  }

  @override
  void dispose() {
    _yaMadJaiz.dispose();
    _alifLamQomariyah.dispose();
    _madAridLisukun.dispose();
    _laMadJaiz.dispose();
    _taMadAridLisukun.dispose();
    _waMadJaiz.dispose();
    _ikhfaHaqiqi.dispose();
    _qolqolahKubro.dispose();
    _bighunnah.dispose();
    _mutajanisaen.dispose();
    _idharsafawi.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alkafirun.wav'));
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
                        'Surah Al-Kafirun',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black,
                        ),
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
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '١. '),
                          TextSpan(
                            text: 'قُلْ ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'يٰٓاَيُّهَا ',
                            recognizer: _yaMadJaiz,
                            style: const TextStyle(color: Color(0xFFDF9755)),
                          ),
                          TextSpan(
                            text: 'الْكَافِرُوْنَۙ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Qul yā ayyuhal-kāfirūn(a).',
                    'Katakanlah (Nabi Muhammad), “Wahai orang-orang kafir,”',
                    'Mad Jaiz, Alif Lam Qomariyah, Mad Arid Lisukun',
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
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٢. '),
                          TextSpan(
                            text: 'لَا أَعْبُدُ',
                            recognizer: _laMadJaiz,
                            style: const TextStyle(color: Color(0xFFDF9755)),
                          ),
                          TextSpan(
                            text: 'مَا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' تَعْبُدُوْنَۙ َ',
                            recognizer: _taMadAridLisukun,
                            style: const TextStyle(color: Color(0xFF3EC1D3)),
                          ),
                        ],
                      ),
                    ),
                    'Lā a‘budu mā ta‘budūn(a).',
                    'Aku tidak akan menyembah apa yang kamu sembah.',
                    'Mad Jaiz, Mad Arid Lisukun',
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
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٣. '),
                          TextSpan(
                            text: 'وَلَا َ',
                            recognizer: _waMadJaiz,
                            style: const TextStyle(color: Color(0xFFDF9755)),
                          ),
                          TextSpan(
                            text: 'أَنتُمْ',
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'عٰبِدُوْنَ مَآ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' اَعْبُدُۚ ُ',
                            recognizer: _qolqolahKubro,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                        ],
                      ),
                    ),
                    'Wa lā antum ‘ābidūna mā a‘bud(u).',
                    'Kamu juga bukan penyembah apa yang aku sembah.',
                    'Mad Jaiz, Ikhfa Haqiqi, Qalqalah Kubra',
                  ),
                  const SizedBox(height: 16),

                  // Ayat 4
                  _buildAyatCard(
                    width,
                    4,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٤. '),
                          TextSpan(
                            text: 'وَلَا أَنَا ',
                            recognizer: _waMadJaiz,
                            style: const TextStyle(color: Color(0xFFDF9755)),
                          ),
                          TextSpan(
                            text: 'عَا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'بِدٌ مَّا ',
                            recognizer: _bighunnah,
                            style: const TextStyle(color: Color(0xFFFC92E3)),
                          ),

                          TextSpan(
                            text: 'عَبَدْتُّمْْۙ',
                            recognizer: _mutajanisaen,
                            style: const TextStyle(color: Color(0xFF480032)),
                          ),
                        ],
                      ),
                    ),
                    'Wa lā ana ‘ābidum mā ‘abattum.',
                    'Aku juga tidak pernah menjadi penyembah apa yang kamu sembah.',
                    'Mad Jaiz, Idgham Bighunnah, Idgham Mutajanisain',
                  ),
                  const SizedBox(height: 16),

                  // Ayat 5
                  _buildAyatCard(
                    width,
                    5,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٥. '),
                          TextSpan(
                            text: 'وَلَآ ',
                            recognizer: _waMadJaiz,
                            style: const TextStyle(color: Color(0xFFDF9755)),
                          ),
                          TextSpan(
                            text: 'أَنتُمْ',
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'عٰبِدُوْنَ مَآ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' اَعْبُدُُۗ',
                            recognizer: _qolqolahKubro,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                        ],
                      ),
                    ),
                    'Wa lā antum ‘ābidūna mā a‘bud(u).',
                    'Kamu tidak pernah (pula) menjadi penyembah apa yang aku sembah.',
                    'Mad Jaiz, Ikhfa Haqiqi, Qalqalah Kubra',
                  ),
                  const SizedBox(height: 16),

                  // Ayat 6
                  _buildAyatCard(
                    width,
                    6,
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: '٦. '),
                          TextSpan(
                            text: 'لَكُمْ دِ',
                            recognizer: _idharsafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'دِينُكُمْ َ',
                            recognizer: _idharsafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: '  وَلِيَٓ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'دِيْنِ ِࣖ',
                            recognizer: _madAridLisukun,
                            style: const TextStyle(color: Color(0xFF3EC1D3)),
                          ),
                        ],
                      ),
                    ),
                    'Lakum dīnukum wa liya dīn(i).',
                    'Untukmu agamamu dan untukku agamaku.',
                    'Idhar Safawi, Mad Arid Lisukun',
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
      double width,
      int ayatIndex,
      dynamic arabic,
      String latin,
      String arti,
      String hukum,
      ) {
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            arti,
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hukum Bacaan: $hukum',
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
