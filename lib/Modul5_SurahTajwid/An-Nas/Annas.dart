import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAnnasFullWidget extends StatefulWidget {
  const LearningAnnasFullWidget({super.key});

  static String routeName = 'LearningAnnas';
  static String routePath = '/learningAnnas';

  @override
  State<LearningAnnasFullWidget> createState() => _LearningAnnasFullWidgetState();
}

class _LearningAnnasFullWidgetState extends State<LearningAnnasFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Tap recognizers
  late TapGestureRecognizer _birabbiRecognizer;
  late TapGestureRecognizer _annasRecognizer;
  late TapGestureRecognizer _malikinNasRecognizer;
  late TapGestureRecognizer _malikinNasWordRecognizer;
  late TapGestureRecognizer _ilahinNasWordRecognizer;
  late TapGestureRecognizer _ilahinNasRecognizer;

  // Ayat 4
  late TapGestureRecognizer _minSharriRecognizer;
  late TapGestureRecognizer _sharriAlwaRecognizer;
  late TapGestureRecognizer _siAlkhannaRecognizer;
  late TapGestureRecognizer _alkhannaRecognizer;
  late TapGestureRecognizer _alkhannasRecognizer;

  // Ayat 5
  late TapGestureRecognizer _sudurinNasWordRecognizer;

  // Ayat 6
  late TapGestureRecognizer _minaljinnaRecognizer;
  late TapGestureRecognizer _wannasRecognizer;

  @override
  void initState() {
    super.initState();

    // Ayat 1–3
    _birabbiRecognizer = TapGestureRecognizer()..onTap = _showAnnasDialog;
    _annasRecognizer = TapGestureRecognizer()..onTap = _showAnnasDialog;
    _malikinNasRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'مَلِكِ',
        arti: 'Raja',
        hukum: 'Tidak ada hukum khusus',
        caraBaca: 'Dibaca biasa.',
      );
    };
    _malikinNasWordRecognizer = TapGestureRecognizer()..onTap = _showAnnasDialog2;
    _ilahinNasRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'إِلَٰهِ',
        arti: 'Sembahan',
        hukum: 'Tidak ada hukum khusus',
        caraBaca: 'Dibaca biasa.',
      );
    };
    _ilahinNasWordRecognizer = TapGestureRecognizer()..onTap = _showAnnasDialog3;

    // Ayat 4
    _minSharriRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'مِن شَرِّ',
        arti: 'Dari kejahatan',
        hukum: 'Ikhfa Haqiqi',
        caraBaca: 'Nun mati bertemu Syin, dibaca samar.',
      );
    };
    _sharriAlwaRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'شَرِّ الْوَ',
        arti: 'Kejahatan Wau',
        hukum: 'Alif Lam Qomariah',
        caraBaca: 'ال bertemu Wau, dibaca jelas.',
      );
    };
    _siAlkhannaRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'سِ الْخَنَّا',
        arti: 'Kho',
        hukum: 'Alif Lam Qomariah',
        caraBaca: 'ال bertemu Kho, dibaca jelas.',
      );
    };
    _alkhannaRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'الْخَنَّا',
        arti: 'Kho',
        hukum: 'Ghunah Musyaddadah',
        caraBaca: 'Nun tasydid dibaca mendengung.',
      );
    };
    _alkhannasRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'الْخَنَّاسِ',
        arti: 'Kho',
        hukum: 'Mad Arid Lisukun',
        caraBaca: 'Karena waqaf, mad thabi’i, panjang 2, 4, atau 6 harakat.',
      );
    };

    // Ayat 5
    _sudurinNasWordRecognizer = TapGestureRecognizer()..onTap = _showAnnasDialog4;

    // Ayat 6
    _minaljinnaRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'مِنَ الْجِنَّةِ',
        arti: 'Dari golongan jin',
        hukum: 'Alif Lam Qomariah, Ghunah Musyaddadah',
        caraBaca: 'ال bertemu Jim dibaca jelas. Nun tasydid dibaca mendengung 4 harakat.',
      );
    };
    _wannasRecognizer = TapGestureRecognizer()..onTap = () {
      _showWordDialog(
        context,
        word: 'وَالنَّاسِ',
        arti: 'Manusia',
        hukum: 'Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun',
        caraBaca: 'Nun tasydid dibaca dengung. Alif Lam bertemu Nun, dibaca masuk & mendengung. Karena waqaf, mad thabi’i panjang 2, 4, atau 6 harakat.',
      );
    };
  }

  @override
  void dispose() {
    _birabbiRecognizer.dispose();
    _annasRecognizer.dispose();
    _malikinNasRecognizer.dispose();
    _malikinNasWordRecognizer.dispose();
    _ilahinNasRecognizer.dispose();
    _ilahinNasWordRecognizer.dispose();
    _minSharriRecognizer.dispose();
    _sharriAlwaRecognizer.dispose();
    _siAlkhannaRecognizer.dispose();
    _alkhannaRecognizer.dispose();
    _alkhannasRecognizer.dispose();
    _sudurinNasWordRecognizer.dispose();
    _minaljinnaRecognizer.dispose();
    _wannasRecognizer.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showAnnasDialog() {
    _showWordDialog(
      context,
      word: 'بِرَبِّ النَّاسِ',
      arti: 'Tuhan manusia',
      hukum: 'Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun',
      caraBaca:
      '1) Nun tasydid dibaca dengung.\n'
          '2) Alif Lam bertemu Nun, dibaca masuk & mendengung.\n'
          '3) Karena waqaf, mad thabi’i boleh panjang 2, 4, atau 6 harakat.',
    );
  }

  void _showAnnasDialog2() {
    _showWordDialog(
      context,
      word: 'النَّاسِ',
      arti: 'Manusia',
      hukum: 'Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun',
      caraBaca:
      '1) Nun tasydid dibaca dengung.\n'
          '2) Alif Lam bertemu Nun, dibaca masuk & mendengung.\n'
          '3) Karena waqaf, mad thabi’i boleh panjang 2, 4, atau 6 harakat.',
    );
  }

  void _showAnnasDialog3() {
    _showWordDialog(
      context,
      word: 'النَّاسِ',
      arti: 'Manusia',
      hukum: 'Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun',
      caraBaca:
      '1) Nun tasydid dibaca dengung.\n'
          '2) Alif Lam bertemu Nun, dibaca masuk & mendengung.\n'
          '3) Karena waqaf, mad thabi’i boleh panjang 2, 4, atau 6 harakat.',
    );
  }

  void _showAnnasDialog4() {
    _showWordDialog(
      context,
      word: 'رِ النَّاسِ',
      arti: 'Manusia',
      hukum: 'Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun',
      caraBaca:
      '1) Nun tasydid dibaca dengung.\n'
          '2) Alif Lam bertemu Nun, dibaca masuk & mendengung.\n'
          '3) Karena waqaf, mad thabi’i boleh panjang 2, 4, atau 6 harakat.',
    );
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('audio/annas.mp3'));
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
            // Header
            Container(
              width: width,
              height: height * 0.15,
              color: const Color(0xFF037A16),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 20, 12, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Surah An-Nas',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.volumeHigh, color: Colors.black, size: 30),
                      onPressed: _playAudio,
                    ),
                  ],
                ),
              ),
            ),

            // Body
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Ayat 1
                  _buildAyatCard(width, 1, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '١. قُلْ أَعُوذُ '),
                        TextSpan(text: 'بِرَبِّ ', recognizer: _birabbiRecognizer, style: const TextStyle(color: Colors.purple)),
                        TextSpan(text: 'النَّاسِۙ', recognizer: _annasRecognizer, style: const TextStyle(color: Colors.purple)),
                      ],
                    ),
                  ), null, 'Qul a‘ūżu birabbin-nās(i)', 'Aku berlindung kepada Tuhan manusia.', 'Hukum Bacaan:Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun'),
                  const SizedBox(height: 16),

                  // Ayat 2
                  _buildAyatCard(width, 2, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '٢. مَلِكِ '),
                        TextSpan(text: 'النَّاسِ', recognizer: _malikinNasWordRecognizer, style: const TextStyle(color: Colors.purple)),
                      ],
                    ),
                  ), null, 'Malikin-nās(i).', 'Raja manusia.', 'Hukum Bacaan:Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun'),
                  const SizedBox(height: 16),

                  // Ayat 3
                  _buildAyatCard(width, 3, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '٣. إِلَٰهِ '),
                        TextSpan(text: 'النَّاسِ', recognizer: _ilahinNasWordRecognizer, style: const TextStyle(color: Colors.purple)),
                      ],
                    ),
                  ), null, 'Ilāhin-nās(i).', 'Sembahan manusia.', 'Hukum Bacaan:Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun'),
                  const SizedBox(height: 16),

                  // Ayat 4
                  _buildAyatCard(width, 4, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '٤. '),
                        TextSpan(text: 'مِن شَرِّ ', recognizer: _minSharriRecognizer, style: const TextStyle(color: Color(0xFF910D0D))),
                        TextSpan(text: 'شَرِّ الْوَ', recognizer: _sharriAlwaRecognizer, style: const TextStyle(color: Colors.red)),
                        TextSpan(text: 'سِ الْخَنَّا', recognizer: _siAlkhannaRecognizer, style: const TextStyle(color: Colors.red)),
                        TextSpan(text: ' الْخَنَّا', recognizer: _alkhannaRecognizer, style: const TextStyle(color: Colors.purple)),
                        TextSpan(text: 'سِ', recognizer: _alkhannasRecognizer, style: const TextStyle(color: Color(0xFF3EC1D3))),
                      ],
                    ),
                  ), null, 'Min syarril-waswāsil-khannās(i).', 'Dari kejahatan pembisik.', 'Hukum Bacaan:Ikhfa Haqiqi, Alif Lam Qomariah, Ghunah Musyaddadah, Mad Arid Lisukun'),
                  const SizedBox(height: 16),

                  // Ayat 5
                  _buildAyatCard(width, 5, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '٥. الَّذِي يُوَسْوِسُ فِي صُدُو'),
                        TextSpan(text: 'رِ النَّاسِۙ', recognizer: _sudurinNasWordRecognizer, style: const TextStyle(color: Colors.purple)),
                      ],
                    ),
                  ), null, 'Allażī yuwaswisu fī ṣudūrin-nās(i).', 'Yang membisikkan ke dalam dada manusia.', 'Hukum Bacaan:Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun'),
                  const SizedBox(height: 16),

                  // Ayat 6 ✅ FINAL!
                  _buildAyatCard(width, 6, RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        const TextSpan(text: '٦. '),
                        TextSpan(text: 'مِنَ الْجِنَّةِ ', recognizer: _minaljinnaRecognizer, style: const TextStyle(color: Colors.orange)),
                        TextSpan(text: 'وَالنَّاسِ', recognizer: _wannasRecognizer, style: const TextStyle(color: Colors.purple)),
                      ],
                    ),
                  ), null, 'Minal jinnati wan-nās(i).', 'Dari golongan jin dan manusia.', ' Hukum Bacaan: Alif Lam Qomariah, Ghunah Musyaddadah, Alif Lam Syamsiyah, Mad Arid Lisukun'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAyatCard(double width, int ayatIndex, dynamic arabic, TapGestureRecognizer? recognizer, String latin, String arti, String hukum) {
    Color bgColor = (ayatIndex % 2 != 0) ? const Color(0xFFFAFDCB) : const Color(0xFFDDEB9D);
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
          arabic is String ? RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(text: arabic, recognizer: recognizer, style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
          ) : arabic,
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
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFFAFDCB),
        title: Text(word, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Arti: $arti'),
          const SizedBox(height: 8),
          Text('Hukum Bacaan:\n$hukum'),
          const SizedBox(height: 8),
          Text('Cara Membaca:\n$caraBaca'),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Tutup')),
        ],
      );
    });
  }
}
