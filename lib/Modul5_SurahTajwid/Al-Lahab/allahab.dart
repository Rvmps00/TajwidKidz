import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class LearningAlLahabFullWidget extends StatefulWidget {
  const LearningAlLahabFullWidget({super.key});

  @override
  State<LearningAlLahabFullWidget> createState() =>
      _LearningAlLahabFullWidgetState();
}

class _LearningAlLahabFullWidgetState extends State<LearningAlLahabFullWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  // Tap gesture recognizers for highlighted words
  late TapGestureRecognizer _idghamBighunnah;
  late TapGestureRecognizer _qolqolahKubra;
  late TapGestureRecognizer _idharHalqi;
  late TapGestureRecognizer _madShilahQoshirah;
  late TapGestureRecognizer _ikhfaHaqiqi;
  late TapGestureRecognizer _ghunnahMusyaddah;
  late TapGestureRecognizer _idharSafawi;
  late TapGestureRecognizer _qolqolahSughra;
  late TapGestureRecognizer _alifLamQomariyah;
  late TapGestureRecognizer _qolqolahKubraAyat2;
  late TapGestureRecognizer _qolqolahKubraAyat3;
  late TapGestureRecognizer _idghamBighunnahAyat5; // Correct gesture recognizer for Ayat 5

  @override
  void initState() {
    super.initState();

    // Tap recognizers for Surah Al-Lahab's recitation rules
    _idghamBighunnah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَهَبٍ وَ',
          arti: 'Lahab.',
          hukum: 'Idgham Bighunnah',
          caraBaca: 'Fatkhah tanwin bertemu dengan huruf wawu, dibaca masuk dengan dengung.',
        );
      };

    _qolqolahKubra = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَتَبَّ',
          arti: 'Dan benar-benar binasa dia.',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Ada huruf ba di akhir kalimat, dibaca membalik dengan lebih jelas.',
        );
      };

    _idharHalqi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'عَنْهُ',
          arti: 'Dari dia.',
          hukum: 'Idhar Halqi',
          caraBaca: 'Nun mati/sukun bertemu dengan huruf ha, dibaca jelas di mulut.',
        );
      };

    _madShilahQoshirah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مَالُهُ',
          arti: 'Harta miliknya.',
          hukum: 'Mad Shilah Qoshirah',
          caraBaca: 'Ada huruf hidup sebelum hak dhamir, dibaca panjang 2 harakat seperti mad thabi’i.',
        );
      };

    _ikhfaHaqiqi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'نَارًا ذَ',
          arti: 'Kelak dia akan memasuki api yang bergejolak.',
          hukum: 'Ikhfa Haqiqi',
          caraBaca: 'Tanwin bertemu dengan huruf dzal, dibaca samar-samar dengan membentuk huruf dzal.',
        );
      };

    _ghunnahMusyaddah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'حَمَّا',
          arti: 'Pembawa kayu bakar.',
          hukum: 'Ghunnah Musyaddah',
          caraBaca: 'Ada huruf mim yang bertasydid, dibaca masuk dengan mendengung.',
        );
      };

    _idharSafawi = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'وَامْرَ',
          arti: 'Dan istrinya.',
          hukum: 'Idhar Safawi',
          caraBaca: 'Mim mati bertemu dengan huruf ro’, dibaca jelas dengan bibir tertutup.',
        );
      };

    _alifLamQomariyah = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'الْحَطَبَِۚ',
          arti: 'Penyebar fitnah.',
          hukum: '1. Alif Lam Qomariyah \n 2. Qolqolah Sughra',
          caraBaca: '1. Karena ada huruf ال bertemu dengan huruf ha. Cara membacanya harus terang dan jelas. \n 2. Karena ada huruf ba yang berada di akhir kalimat. Cara membacanya membalik membentuk huruf ba dengan lebih jelas.',
        );
      };

    _qolqolahSughra = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'حَبْلٌ',
          arti: 'Tali dari sabut.',
          hukum: '1. Qolqolah Sughra \n 2. Idgham Bighunnah',
          caraBaca: '1. Ada huruf ba mati/sukun ditengah kalimat, dibaca dengan suara bergema seperti membalik huruf ba.\n 2. Karena ada dhommahtain bertemu dengan huruf mim. Cara membacanya masuk dengan mendengung.',
        );
      };

    _qolqolahKubraAyat2 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'كَسَبَۗ',
          arti: 'Dia usahakan.',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Karena ada huruf ba yang berada di akhir kalimat. Cara membacanya membalik membentuk huruf ba dengan lebih jelas.',
        );
      };

    _qolqolahKubraAyat3 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'لَهَبٍ',
          arti: 'Lahab.',
          hukum: 'Qalqalah Kubra',
          caraBaca: 'Ada huruf ba di akhir kalimat, dibaca membalik dengan lebih jelas.',
        );
      };

    // Adding gesture recognizer for Ayat 5
    _idghamBighunnahAyat5 = TapGestureRecognizer()
      ..onTap = () {
        _showWordDialog(
          context,
          word: 'مِّنْ مَّسَدٍ',
          arti: 'Sabut',
          hukum: 'Idgham Bighunnah\n 2.Qolqolah Kubra ',
          caraBaca: '1.karena ada nun mati bertemu dengan huruf mim. Cara membacanya masuk dengan mendengung.\n 2. Karena ada huruf dal yang berada di akhir kalimat. Cara membacanya membalik membentuk huruf dal dengan lebih jelas.',
        );
      };
  }

  @override
  void dispose() {
    _idghamBighunnah.dispose();
    _qolqolahKubra.dispose();
    _idharHalqi.dispose();
    _madShilahQoshirah.dispose();
    _ikhfaHaqiqi.dispose();
    _ghunnahMusyaddah.dispose();
    _idharSafawi.dispose();
    _qolqolahSughra.dispose();
    _alifLamQomariyah.dispose();
    _qolqolahKubraAyat2.dispose();
    _qolqolahKubraAyat3.dispose();
    _idghamBighunnahAyat5.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/alahab.wav'));
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
      backgroundColor: const Color(0xFFFAFDCB),
      body: SafeArea(
        child: Column(
          children: [
            // === HEADER ===
            Container(
              width: width,
              height: height * 0.15,
              color: const Color(0xFF037A16),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Surah Al-Lahab',
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
                            text: 'تَبَّتْ يَدَآ اَبِيْ ' ,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'لَهَبٍ',
                            recognizer: _idghamBighunnah,
                            style: const TextStyle(color: Color(0xFFFC92E3)),
                          ),
                          TextSpan(
                            text: ' وَّ',
                            recognizer: _qolqolahKubra,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                          TextSpan(
                            text: ' تَبَّۗ',
                            recognizer: _qolqolahKubra,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                        ],
                      ),
                    ),
                    'Tabbat yadā abī lahabiw wa tabb(a)',
                    'Binasalah kedua tangan Abu Lahab dan benar-benar binasa dia.',
                    'Idgham Bighunnah, Qalqalah Kubra',
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
                            text: 'مَآ اَغْنٰى',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: '  عَنْهُ ',
                            recognizer: _idharHalqi,
                            style: const TextStyle(color: Color(0xFFF6279C)),
                          ),
                          TextSpan(
                            text: ' مَالُهُ ',
                            recognizer: _madShilahQoshirah,
                            style: const TextStyle(color: Color(0xFF7939E7)),
                          ),
                          TextSpan(
                            text: ' وَمَا ' ,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' كَسَبَۗ',
                            recognizer: _qolqolahKubraAyat2,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                        ],
                      ),
                    ),
                    'Mā agnā ‘anhu māluhū wa mā kasab(a)',
                    'Tidaklah berguna baginya hartanya dan apa yang dia usahakan.',
                    'Idhar Halqi, Mad Shilah Qoshirah, Qalqalah Kubra',
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
                            text: 'سَيَصْلٰى ' ,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'نَارًا ' ,
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'ذَاتَ ' ,
                            recognizer: _ikhfaHaqiqi,
                            style: const TextStyle(color: Color(0xFF910D0D)),
                          ),
                          TextSpan(
                            text: 'لَهَبٍ',
                            recognizer: _qolqolahKubraAyat3,
                            style: const TextStyle(color: Color(0xFF3EB489)),
                          ),
                        ],
                      ),
                    ),
                    'Sayaṣlā nāran żāta lahab(in).',
                    'Kelak dia akan memasuki api yang bergejolak (neraka).',
                    'Ikhfa Haqiqi, Qalqalah Kubra',
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
                            color: Colors.black),
                        children: [
                          const TextSpan(text: '٤. '),
                          TextSpan(
                            text: 'وَامْرَ',
                            recognizer: _idharSafawi,
                            style: const TextStyle(color: Color(0xFF746C6C)),
                          ),
                          TextSpan(
                            text: 'اَتُهٗ ُۗ',
                            recognizer: _madShilahQoshirah,
                            style: const TextStyle(color: Color(0xFF7939E7)),
                          ),
                          TextSpan(
                            text: 'حَمَّا',
                            recognizer: _ghunnahMusyaddah,
                            style: const TextStyle(color: Color(0xFF7939E7)),
                          ),
                          TextSpan(
                            text: 'لَةَ ' ,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'الْحَطَبِۚ',
                            recognizer: _alifLamQomariyah,
                            style: const TextStyle(color: Color(0xFFEC7700)),
                          ),
                        ],
                      ),
                    ),
                    'Wamra atuh(ū), ḥammālatal-ḥaṭab(i)',
                    ' (begitu pula) istrinya, pembawa kayu bakar (penyebar fitnah)',
                    'Idhar Safawi, Mad Shilah Qoshirah, Ghunnah Musyaddah, Qalqalah Kubra',
                  ),
                  const SizedBox(height: 16),
                  // Ayat 5 (Fixed gesture recognizer for "مِّنْ مَّسَدٍ")
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
                            text: 'فِيْ جِيْدِهَا ' ,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'حَبْلٌ',
                            recognizer: _qolqolahSughra,
                            style: const TextStyle(color: Color(0xFF037A16)),
                          ),

                          TextSpan(
                            text: 'مِّنْ مَّسَدٍ ',
                            recognizer: _idghamBighunnahAyat5,
                            style: const TextStyle(color: Color(0xFFFC92E3)),
                          ),
                        ],
                      ),
                    ),
                    'Fī jīdihā ḥablum mim masad(in)',
                    'Di lehernya ada tali dari sabut yang dipintal.',
                    'Qolqolah Sughra, Idgham Bighunnah',
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
