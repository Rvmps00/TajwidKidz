import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlfatihahfullWidget extends StatefulWidget {
  const LearningAlfatihahfullWidget({super.key});

  static String routeName = 'LearningAlfa';
  static String routePath = '/learningAlfa';

  @override
  State<LearningAlfatihahfullWidget> createState() =>
      _LearningAlfatihahfullWidgetState();
}

class _LearningAlfatihahfullWidgetState
    extends State<LearningAlfatihahfullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Tap Recognizers
  late TapGestureRecognizer _allahTapRecognizer;
  late TapGestureRecognizer _rahmanTapRecognizer;
  late TapGestureRecognizer _rahimTapRecognizer;
  late TapGestureRecognizer _alhamduTapRecognizer;
  late TapGestureRecognizer _rabbilTapRecognizer;
  late TapGestureRecognizer _arraTapRecognizer;
  late TapGestureRecognizer _arrahimAyat3TapRecognizer;
  late TapGestureRecognizer _yaumiTapRecognizer;
  late TapGestureRecognizer _addiTapRecognizer;
  late TapGestureRecognizer _dinTapRecognizer;
  late TapGestureRecognizer _nastaTapRecognizer;
  late TapGestureRecognizer _shshiraTapRecognizer;
  late TapGestureRecognizer _mustaqimTapRecognizer;
  late TapGestureRecognizer _anAmtaTapRecognizer;
  late TapGestureRecognizer _alaihim1TapRecognizer;
  late TapGestureRecognizer _ghairiTapRecognizer;
  late TapGestureRecognizer _alaihim2TapRecognizer;
  late TapGestureRecognizer _maghdlubiTapRecognizer;
  late TapGestureRecognizer _dhaTapRecognizer;
  late TapGestureRecognizer _dhaallinTapRecognizer;

  @override
  void initState() {
    super.initState();
    // Inisialisasi TapGestureRecognizer untuk semua kata
    _allahTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱللَّهِ', arti: 'Allah', hukum: 'Alif Lam Qomariyah', caraBaca: 'Dibaca jelas.');
    };
    _rahmanTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلرَّحْمَٰنِ', arti: 'Ar-Rahmani', hukum: 'Ghunah Musyaddadah', caraBaca: 'Ra tasydid dibaca tebal.');
    };
    _rahimTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلرَّحِيمِ', arti: 'Ar-Rahim', hukum: 'Ghunah Musyaddadah, Idgham Syamsiyah', caraBaca: 'Ra tasydid dibaca tebal.');
    };
    _alhamduTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلْحَمْدُ', arti: 'Al-hamdu', hukum: 'Alif Lam Qomariyah', caraBaca: 'Dibaca jelas.');
    };
    _rabbilTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'رَبِّ ٱلْعَٰلَمِينَ', arti: ' rabbil-‘alamin', hukum: 'Idgham Mimi', caraBaca: 'Dibaca jelas.');
    };
    _arraTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلرَّ', arti: 'Ar-Ra', hukum: 'Alif Lam Syamsiyah', caraBaca: 'Lam diidghamkan ke Ra.');
    };
    _arrahimAyat3TapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلرَّحِيمِ', arti: 'Ar-Rahim', hukum: 'Mad Arid Lisukun', caraBaca: 'Boleh panjang 2, 4, 6 harakat.');
    };
    _yaumiTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'يَوْمِ', arti: 'yaumi', hukum: 'Mad Layin', caraBaca: 'Fathah bertemu Wau, dibaca lemas.');
    };
    _addiTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'الدِّ', arti: 'D-di', hukum: 'Alif Lam Syamsiyah', caraBaca: 'Lam diidghamkan ke Dal.');
    };
    _dinTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'يْنِ', arti: 'Din', hukum: 'Mad Arid Lisukun', caraBaca: 'Waqaf, boleh panjang 2, 4, 6 harakat.');
    };
    _nastaTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'نَسْتَعِيْنُ', arti: 'Nasta‘in', hukum: 'Mad Arid Lisukun', caraBaca: 'Waqaf, boleh panjang 2, 4, 6 harakat.');
    };
    _shshiraTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'الصِّرَ', arti: 'sh-shira', hukum: 'Alif Lam Syamsiyah', caraBaca: 'Ada ال bertemu ص, dimasukkan ke ص.');
    };
    _mustaqimTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'الْمُسْتَقِيْمَۙ', arti: 'Mustaqim', hukum: 'Alif Lam Qomariyah, Mad Arid Lisukun', caraBaca: 'Bagian ال bertemu م dibaca jelas. Mad Arid: waqaf boleh panjang 2, 4, 6 harakat.');
    };
    _anAmtaTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'أَنعَمْتَ', arti: 'An‘amta', hukum: 'Idhar Halqi & Idhar Syafawi', caraBaca: 'Fatkhahtain bertemu ع: jelas di mulut. Mim sukun bertemu ت: terang di bibir dengan mulut tertutup.');
    };
    _alaihim1TapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'عَلَيْهِمْ', arti: 'Alaihim', hukum: 'Mad Layin', caraBaca: 'Fathah bertemu ي mati: lunak dan lemas.');
    };
    _ghairiTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'غَيْرِ', arti: 'Ghairi', hukum: 'Mad Layin', caraBaca: 'Fathah bertemu ي mati: lunak dan lemas.');
    };
    _alaihim2TapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'عَلَيْهِمْ', arti: 'Alaihim', hukum: 'Mad Layin', caraBaca: 'Fathah bertemu ي mati: lunak dan lemas.');
    };
    _maghdlubiTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'الْمَغْضُوْ', arti: 'Maghdlubi', hukum: 'Alif Lam Qomariyah', caraBaca: 'Ada ال bertemu م: terang dan jelas.');
    };
    _dhaTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'ٱلضَّ', arti: 'Dhaa', hukum: 'Alif Lam Syamsiyah', caraBaca: 'Ada ال bertemu ظ: dimasukkan ke ظ.');
    };
    _dhaallinTapRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(context, word: 'الضَّاۤلِّيْنَ', arti: 'Dhaallin', hukum: 'Mad Arid Lisukun, Mad Lazim Mutsaqqal Kilmi', caraBaca: 'Mad Arid: waqaf panjang 2, 4, 6 harakat. Mad Lazim: panjang 6 harakat.');
    };
  }

  @override
  void dispose() {
    _allahTapRecognizer.dispose();
    _rahmanTapRecognizer.dispose();
    _rahimTapRecognizer.dispose();
    _alhamduTapRecognizer.dispose();
    _rabbilTapRecognizer.dispose();
    _arraTapRecognizer.dispose();
    _arrahimAyat3TapRecognizer.dispose();
    _yaumiTapRecognizer.dispose();
    _addiTapRecognizer.dispose();
    _dinTapRecognizer.dispose();
    _nastaTapRecognizer.dispose();
    _shshiraTapRecognizer.dispose();
    _mustaqimTapRecognizer.dispose();
    _anAmtaTapRecognizer.dispose();
    _alaihim1TapRecognizer.dispose();
    _ghairiTapRecognizer.dispose();
    _alaihim2TapRecognizer.dispose();
    _maghdlubiTapRecognizer.dispose();
    _dhaTapRecognizer.dispose();
    _dhaallinTapRecognizer.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('audio/alfatihah.mp3'));
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
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
            Container(
              width: width,
              height: height * 0.15,
              color: const Color(0xFF037A16),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 20, 12, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Surah Al-Fatihah',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.volumeHigh,
                          color: Colors.black, size: 30),
                      onPressed: _playAudio,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSurahCardAyat1(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat2(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat3(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat4(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat5(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat6(width),
                  const SizedBox(height: 16),
                  _buildSurahCardAyat7(width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============ AYAT 1-7 ============

  Widget _buildSurahCardAyat1(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFFAFDCB),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '١. '),
            const TextSpan(text: 'بِسْمِ '),
            TextSpan(text: 'ٱللَّهِ ', recognizer: _allahTapRecognizer, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            TextSpan(text: 'ٱلرَّحْمَٰنِ ', recognizer: _rahmanTapRecognizer, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
            TextSpan(text: 'ٱلرَّحِيمِ', recognizer: _rahimTapRecognizer, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Bismillahir-rahmanir-rahim',
      'Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang.',
      'Hukum Bacaan:Idgham Syamsiyah, Ghunah Musyaddadah, Alif Lam Qomariyah',
    );
  }

  Widget _buildSurahCardAyat2(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFDDEB9D),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٢. '),
            TextSpan(text: 'ٱلْحَمْدُ ', recognizer: _alhamduTapRecognizer, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            const TextSpan(text: 'لِلَّهِ '),
            TextSpan(text: 'رَبِّ ٱلْعَٰلَمِينَ', recognizer: _rabbilTapRecognizer, style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Al-hamdu lillahi rabbil-‘alamin',
      'Segala puji bagi Allah, Tuhan semesta alam',
      'Hukum Bacaan:Alif Lam Qomariyah, Idgham Mimi',
    );
  }

  Widget _buildSurahCardAyat3(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFFAFDCB),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٣. '),
            TextSpan(text: 'ٱلرَّ', recognizer: _arraTapRecognizer, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            const TextSpan(text: 'حْمَٰنِ '),
            TextSpan(text: 'ٱلرَّحِيمِ', recognizer: _arrahimAyat3TapRecognizer, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Ar-Rahman Ar-Rahim',
      'Yang Maha Pengasih lagi Maha Penyayang',
      'Hukum Bacaan:Alif Lam Syamsiyah, Mad Arid Lisukun',
    );
  }

  Widget _buildSurahCardAyat4(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFDDEB9D),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٤. '),
            const TextSpan(text: 'مٰلِكِ '),
            TextSpan(text: 'يَوْمِ ', recognizer: _yaumiTapRecognizer, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            TextSpan(text: 'الدِّ', recognizer: _addiTapRecognizer, style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
            TextSpan(text: 'يْنِ', recognizer: _dinTapRecognizer, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Maliki yaumid-din',
      'Pemilik hari Pembalasan',
      'Hukum Bacaan:Mad Layin, Alif Lam Syamsiyah, Mad Arid Lisukun',
    );
  }

  Widget _buildSurahCardAyat5(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFFAFDCB),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٥. اِ يَّاكَ نَعْبُدُ وَ'),
            TextSpan(text: 'نَسْتَعِيْنُ', recognizer: _nastaTapRecognizer, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Iyyaka na‘budu wa nasta‘in',
      'Hanya kepada Engkaulah kami menyembah dan hanya kepada Engkaulah kami memohon pertolongan.',
      'Hukum Bacaan:Mad Arid Lisukun',
    );
  }

  Widget _buildSurahCardAyat6(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFDDEB9D),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٦. اِهْدِنَا '),
            TextSpan(text: 'الصِّرَ ', recognizer: _shshiraTapRecognizer, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            const TextSpan(text: 'اطَ '),
            TextSpan(text: 'الْمُسْتَقِيْمَۙ', recognizer: _mustaqimTapRecognizer, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Ihdinas-sirathal-mustaqim',
      'Bimbinglah kami ke jalan yang lurus',
      'Hukum Bacaan:Alif Lam Syamsiyah, Alif Lam Qomariyah, Mad Arid Lisukun',
    );
  }

  Widget _buildSurahCardAyat7(double width) {
    return _buildCustomCard(
      width,
      const Color(0xFFFAFDCB),
      RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            const TextSpan(text: '٧. صِرَاطَ الَّذِينَ '),
            TextSpan(text: 'أَنعَمْتَ ', recognizer: _anAmtaTapRecognizer, style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
            TextSpan(text: 'عَلَيْهِمْ ', recognizer: _alaihim1TapRecognizer, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            TextSpan(text: 'غَيْرِ ', recognizer: _ghairiTapRecognizer, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            TextSpan(text: 'ٱلْمَغْضُوْ', recognizer: _maghdlubiTapRecognizer, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            const TextSpan(text: 'بِ '),
            TextSpan(text: 'عَلَيْهِمْ ', recognizer: _alaihim2TapRecognizer, style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            const TextSpan(text: 'وَلَا '),
            TextSpan(text: 'ٱلضَّ', recognizer: _dhaTapRecognizer, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            TextSpan(text: 'اۤلِّيْنَ', recognizer: _dhaallinTapRecognizer, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      'Shiratal-ladzina an‘amta ‘alaihim ghairil maghdlubi ‘alaihim wa ladl-dlallin',
      '(Yaitu) jalan orang-orang yang telah Engkau beri nikmat, bukan (jalan) mereka yang dimurkai dan bukan (pula jalan) orang-orang yang sesat.',
      'Hukum Bacaan:Idhar Halqi, Idhar Syafawi, Mad Layin, Alif Lam Qomariyah, Alif Lam Syamsiyah, Mad Arid Lisukun, Mad Lazim Mutsaqqal Kilmi',
    );
  }

  Widget _buildCustomCard(
      double width, Color bgColor, Widget arabic, String latin, String arti, String hukum) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          arabic,
          const SizedBox(height: 12),
          Text(latin, textAlign: TextAlign.justify, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(arti, textAlign: TextAlign.justify, style: GoogleFonts.inter(fontSize: 14)),
          const SizedBox(height: 8),
          Text(hukum, textAlign: TextAlign.justify, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showWordDialog(BuildContext context, {required String word, required String arti, required String hukum, required String caraBaca}) {
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
              Text('Hukum Bacaan: $hukum'),
              const SizedBox(height: 8),
              Text('Cara Membaca: $caraBaca'),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Tutup')),
          ],
        );
      },
    );
  }
}
