import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';

class LearningAnnasrFullWidget extends StatefulWidget {
  const LearningAnnasrFullWidget({super.key});

  static String routeName = 'LearningAnnasr';
  static String routePath = '/learningAnnasr';

  @override
  State<LearningAnnasrFullWidget> createState() =>
      _LearningAnnasrFullWidgetState();
}

class _LearningAnnasrFullWidgetState extends State<LearningAnnasrFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap gesture recognizers for each Surah's highlighted words
  late TapGestureRecognizer _madWajib;
  late TapGestureRecognizer _lamTafkhim;
  late TapGestureRecognizer _alifLamQomariyah;
  late TapGestureRecognizer _madLayin;
  late TapGestureRecognizer _qolqolahSughro;
  late TapGestureRecognizer _alifLamSyamsiah;
  late TapGestureRecognizer _lamTarkik;
  late TapGestureRecognizer _madIwad;
  late TapGestureRecognizer _idharSafawi;
  late TapGestureRecognizer _ghunnahMushaddah;
  late TapGestureRecognizer _madShilahQashirah;

  @override
  void initState() {
    super.initState();

    // Initialize gesture recognizers for Surah An-Nasr
    _madWajib = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'جَاۤءَ',
        arti: 'telah',
        hukum: 'Mad Wajib',
        caraBaca: 'Ada huruf mad thabi’i bertemu dengan huruf hamzah dalam satu kalimat. Cara membacanya panjang 5 harakat.',
      );
    };

    _lamTafkhim = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'اللّٰهِ',
        arti: 'Allah',
        hukum: 'Lam Tafkhim',
        caraBaca: 'Ada lafal اللّٰهِ yang sebelumnya ada harakat dhommah. Cara membacanya ditebalkan.',
      );
    };

    _alifLamQomariyah = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'وَالْفَتْحُ',
        arti: 'Dan Kemenangan',
        hukum: 'Alif Lam Qomariyah',
        caraBaca: 'Ada huruf ال bertemu dengan huruf fa. Cara membacanya harus terang dan jelas.',
      );
    };

    _madLayin = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'بِحَمْدِ رَبِّكَ',
        arti: 'Dengan memuji Tuhanmu',
        hukum: 'Mad Layin',
        caraBaca: 'Fatkhah bertemu dengan huruf ya mati, dibaca sekedar lunak dan lemas.',
      );
    };

    _qolqolahSughro = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'وَاسْتَغْفِرْهُ',
        arti: 'Dan mohon ampunlah kepada-Nya',
        hukum: 'Qolqolah Sughro',
        caraBaca: 'Ada huruf qāf di akhir kata dengan sukun, dibaca dengan dengung lembut.',
      );
    };

    _alifLamSyamsiah = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'النَّاسَ',
        arti: 'manusia',
        hukum: 'Alif Lam Syamsiah',
        caraBaca: 'Ada huruf ال bertemu dengan huruf nun, atau bisa juga sebagai ghunnah musyadah, karena ada tasdyid pada huruf nun. Cara membacanya mendengung yang disangatkan 6 harakat.',
      );
    };

    _lamTarkik = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'دِيْنِ اللّٰهِ',
        arti: 'agama Allah',
        hukum: 'Lam Tarkik',
        caraBaca: 'Ada lafal اللّٰهِ yang sebelumnya ada harakat kasrah. Cara membacanya ditipiskan.',
      );
    };

    _madIwad = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'اَفْوَاجًا',
        arti: 'berbondong-bondong',
        hukum: 'Mad Iwadh',
        caraBaca: 'Ada huruf mathobi’i yang diwaqafkan atau di akhir kalimat. Cara membacanya panjang seperti mathobi’i.',
      );
    };

    // Ayat 3 Gesture Recognizers
    _idharSafawi = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'بِحَمْدِ',
        arti: 'dengan memuji',
        hukum: 'Idhar Safawi',
        caraBaca: 'Ada huruf mim mati/sukun bertemu dengan huruf dal. Cara membacanya terang di bibir dengan mulut tertutup.',
      );
    };

    _ghunnahMushaddah = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'اِنَّهُ',
        arti: 'Sesungguhnya',
        hukum: 'Ghunnah Musyaddah',
        caraBaca: 'Ada tasdyid pada huruf nun. Cara membacanya mendengung yang disangatkan 6 harakat.',
      );
    };

    _madShilahQashirah = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'تَوَّابًا',
        arti: 'Maha Penerima tobat',
        hukum: 'Mad Shilah Qashirah',
        caraBaca: 'Huruf hak dhomir yang didahului harakat fatkhah. Cara membacanya panjang seperti mad thobi’i.',
      );
    };
  }

  @override
  void dispose() {
    // Dispose all gesture recognizers properly
    _madWajib.dispose();
    _lamTafkhim.dispose();
    _alifLamQomariyah.dispose();
    _madLayin.dispose();
    _qolqolahSughro.dispose();
    _alifLamSyamsiah.dispose();
    _lamTarkik.dispose();
    _madIwad.dispose();
    _idharSafawi.dispose();
    _ghunnahMushaddah.dispose();
    _madShilahQashirah.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/annasr.wav'));
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
                        'Surah An-Nasr',
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
                            text: 'إِذَا',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'جَاۤءَ',
                            recognizer: _madWajib,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                          TextSpan(
                            text: 'نَصْرُ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'اللّٰهِ',
                            recognizer: _lamTafkhim,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'وَالْفَتْحُ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Izā jā’a nasrullāhi wal-fath(u)',
                    'Apabila telah datang pertolongan Allah dan kemenangan.',
                    'Mad Wajib, Lam Tafkhim, Alif Lam Qomariyah',
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
                            text: 'وَرَأَيْتََ',
                            recognizer: _madLayin,
                            style: const TextStyle(color: Color(0xFF1976D2)),
                          ),
                          TextSpan(
                            text: 'النَّاسَ',
                            recognizer: _alifLamSyamsiah,
                            style: const TextStyle(color: Color(0xFF587DBD)),
                          ),
                          TextSpan(
                            text: 'يَدْخُلُونَ',
                            recognizer: _qolqolahSughro,
                            style: const TextStyle(color: Color(0xFF037A16)),
                          ),
                          TextSpan(
                            text: 'فِي',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'دِينِ',
                            recognizer: _lamTarkik,
                            style: const TextStyle(color: Color(0xFF99938D)),
                          ),
                          TextSpan(
                            text: 'اللّٰهِ',
                            recognizer: _lamTarkik,
                            style: const TextStyle(color: Color(0xFF99938D)),
                          ),
                          TextSpan(
                            text: 'أَفْوَاجًا',
                            recognizer: _madIwad,
                            style: const TextStyle(color: Color(0xFFB57A76)),
                          ),
                        ],
                      ),
                    ),
                    'Wa raaitan-nāsa yadkhulūna fī dīnillāhi afwājan.',
                    'Dan engkau melihat manusia berbondong-bondong masuk agama Allah.',
                    'Ikhfa Haqiqi, Idgham Bighunnah',
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
                            text: 'فَسَبِّحْ',
                            recognizer: _idharSafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'بِحَمْدِ',
                            recognizer: _idharSafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'رَبِّكَ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'وَاسْتَغْفِرْهُ',
                            recognizer: _qolqolahSughro,
                            style: const TextStyle(color: Color(0xFF037A16)),
                          ),
                          TextSpan(
                            text: 'إِنَّهُ',
                            recognizer: _ghunnahMushaddah,
                            style: const TextStyle(color: Color(0xFF9747FF)),
                          ),
                          TextSpan(
                            text: 'كَانَ',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'تَوَّابًا',
                            recognizer: _madIwad,
                            style: const TextStyle(color: Color(0xFFB57A76)),
                          ),
                        ],
                      ),
                    ),
                    'Fasabbiḥ biḥamdi rabbika wastagfirh(u), innahū kāna tawwābā(n).',
                    'Bertasbihlah dengan memuji Tuhanmu dan mohonlah ampun kepada-Nya. Sesungguhnya Dia Maha Penerima tobat.',
                    'Idhar Safawi, Ghunnah Musyaddah, Mad Shilah Qashirah, Mad Iwadh',
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
            ]);
      },
    );
  }
}
