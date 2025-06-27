import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';


class BacaanGharibPage extends StatefulWidget {
  const BacaanGharibPage({super.key});

  @override
  State<BacaanGharibPage> createState() => _BacaanGharibPageState();
}

class _BacaanGharibPageState extends State<BacaanGharibPage> {
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isPlayingImalah = false;
  bool _isPlayingIsymam = false;
  bool _isPlayingSaktah = false;
  bool _isPlayingSaktah2 = false;
  bool _isPlayingSaktah3 = false;
  bool _isPlayingSaktah4 = false;
  bool _isPlayingTashil = false;
  bool _isPlayingNaql = false;
  bool _isPlayingBadal = false;
  bool _isPlayingMadQasr = false;
  bool _isPlayingMalik = false;
  bool _isPlayingDuf = false;

  final Map<String, GlobalKey> sectionKeys = {
    'Bacaan Gharib': GlobalKey(),
    'Bacaan Imālah': GlobalKey(),
    'Bacaan Isymām': GlobalKey(),
    'Bacaan Saktah': GlobalKey(),
    'Bacaan Tashīl': GlobalKey(),
    'Bacaan Naql': GlobalKey(),
    'Bacaan Badal': GlobalKey(),
    'Mad & Qaṣr': GlobalKey(),
    'Ṣilah (Mad Ṣilah)': GlobalKey(),
    'Lafaz Gharib Lain: "Malik" dan "Ḍuʿf"': GlobalKey(),
  };

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void scrollToSection(String key) {
    final targetContext = sectionKeys[key]?.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      Navigator.pop(context);
    }
  }

  // Play/Pause Audio for Bacaan Imālah
  void _playPauseImalahAudio() async {
    if (_isPlayingImalah) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/imalah_majreha.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingImalah = !_isPlayingImalah;
    });
  }

  // Play/Pause Audio for Bacaan Isymām
  void _playPauseIsymamAudio() async {
    if (_isPlayingIsymam) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/isymam_laakmanna.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingIsymam = !_isPlayingIsymam;
    });
  }

  // Play/Pause Audio for Bacaan Saktah
  void _playPauseSaktahAudio() async {
    if (_isPlayingSaktah) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/saktah_mimmarkodinahada.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingSaktah = !_isPlayingSaktah;
    });
  }

  void _playPauseSaktah2Audio() async {
    if (_isPlayingSaktah2) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/saktah_alqiyamah2.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingSaktah2 = !_isPlayingSaktah2;
    });
  }

  void _playPauseSaktah3Audio() async {
    if (_isPlayingSaktah3) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/saktah_almuthafifinfull.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingSaktah3 = !_isPlayingSaktah3;
    });
  }

  void _playPauseSaktah4Audio() async {
    if (_isPlayingSaktah4) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/saktah_alkahfifull.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingSaktah4 = !_isPlayingSaktah4;
    });
  }


  // Play/Pause Audio for Bacaan Tashīl
  void _playPauseTashilAudio() async {
    if (_isPlayingTashil) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/tahsil_aajamiyu.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingTashil = !_isPlayingTashil;
    });
  }

  // Play/Pause Audio for Bacaan Naql
  void _playPauseNaqlAudio() async {
    if (_isPlayingNaql) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/naql_hujurat.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingNaql = !_isPlayingNaql;
    });
  }

  // Play/Pause Audio for Bacaan Badal
  void _playPauseBadalAudio() async {
    if (_isPlayingBadal) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/Badal_alahqaf.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingBadal = !_isPlayingBadal;
    });
  }

  // Play/Pause Audio for Mad & Qaṣr
  void _playPauseMadQasrAudio() async {
    if (_isPlayingMadQasr) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/madqasr_alkafirun4.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingMadQasr = !_isPlayingMadQasr;
    });
  }

  // Play/Pause Audio for Ḍuʿf
  void _playPauseMalikAudio() async {
    if (_isPlayingMalik) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/Malik_alfatihah.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingMalik = !_isPlayingMalik;
    });
  }

  // Play/Pause Audio for Ḍuʿf
  void _playPauseDufAudio() async {
    if (_isPlayingDuf) {
      await _audioPlayer.pause();  // Pause the audio
    } else {
      // Play audio from assets
      await _audioPlayer.play(AssetSource('audios/modul6/duf_arrum54.mp3'));  // Correct path to your audio
    }
    setState(() {
      _isPlayingDuf = !_isPlayingDuf;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFFAFDCB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16),
        centerTitle: true,
        title: Text(
          'Level 6 Gharib',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,  // Set title text color to white
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFFFAFDCB),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          children: [
            Text(
              'Gharib',
              style: GoogleFonts.inter(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            for (var entry in sectionKeys.entries)
              ListTile(
                title: Text(
                  entry.key,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                tileColor: const Color(0xFFFAFDCB),
                onTap: () => scrollToSection(entry.key),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              key: sectionKeys['Bacaan Gharib']!,
              title: 'Apa Itu Bacaan Gharib?',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Penjelasan Umum:\n'
                          'Bacaan Gharib adalah bacaan dalam Al-Qur’an yang tidak lazim atau tidak berlaku pada seluruh kata atau ayat, '
                          'namun hanya pada bacaan tertentu dan dalam riwayat tertentu pula. Bacaan ini membutuhkan perhatian khusus karena '
                          'menyangkut aspek qira’at, variasi pelafalan, dan kaidah yang tidak umum.\n\n'
                          'Ciri-ciri Bacaan Gharib:\n'
                          '1. Tidak digunakan dalam semua mushaf\n'
                          '2. Terjadi pada kata-kata khusus\n'
                          '3. Terkait langsung dengan riwayat qira’at\n'
                          '4. Membutuhkan ketelitian tinggi dalam pelafalan',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Imālah']!,
              title: 'Bacaan Imālah (Contoh Surat Hūd Ayat 41)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Memiringkan bacaan fathah (a) ke arah kasrah (i), menghasilkan bunyi antara “a” dan “i”.\n\n'
                          'Contoh:\n'
                          'Dalam Al-Quran hanya 1 bacaan saja yang wajib dibaca imalah yaitu terdapat dalam Surat Hūd ayat 41:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'وَقِيلَ ٱرْكَبُواْ فِيهَا بِسْمِ ٱللَّهِ '
                          'مَجْرَاهَا وَمُرْسَاهَا\n',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'مَجْرَاهَا',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseImalahAudio,
                      child: Text(_isPlayingImalah ? "Pause Audio" : "Putar Audio Majreha"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Isymām']!,
              title: 'Bacaan Isymām (Contoh Surat Yūsuf Ayat 11)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Menggabungkan bacaan sukun dengan isyarat dhammah melalui gerakan bibir, tanpa suara.\n\n'
                          'Contoh:\n'
                          'Dalam Al-Quran hanya 1 bacaan saja yang wajib dibaca isymam yaitu terdapat dalam Surat Yūsuf ayat 11:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'لَا تَأْمَنَّا عَلَىٰ يُوسُفَ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'تَأْمَنَّا',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseIsymamAudio,
                      child: Text(_isPlayingIsymam ? "Pause Audio" : "Putar Audio Isymām"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Saktah']!,
              title: 'Bacaan Saktah (Contoh Surat Yāsīn Ayat 52)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Diam sejenak tanpa mengambil napas (2–4 harakat) sebelum lanjut bacaan.\n\n'
                          'Contoh:\n'
                          'Dalam Al-Quran ada 4 bacaan atau ayat yang wajib dibaca saktah yaitu terdapat dalam Surat Yāsīn ayat 52:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'مَنْ بَعَثَنَا مِنْ مَّرْقَدِنَا ۜ هَٰذَا',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Saktah' explanation
                  Text(
                    'Saktah antara: مَرْقَدِنَا dan هَٰذَا',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Saktah"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSaktahAudio,
                      child: Text(_isPlayingSaktah ? "Pause Audio" : "Putar Audio Saktah"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                          'Bagian kedua bacaan atau ayat yang wajib dibaca saktah yaitu terdapat dalam Surat  Al- Qiyamah ayat 27:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'وَقِيۡلَ مَنۡ رَاق',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Saktah' explanation
                  Text(
                    'Saktah antara: مَنۡ رَاقٍۙ',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Saktah"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSaktah2Audio,
                      child: Text(_isPlayingSaktah2 ? "Pause Audio" : "Putar Audio Saktah"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bagian ketiga bacaan atau ayat yang wajib dibaca saktah yaitu terdapat dalam Surat  Al-Muthaffifin ayat 14:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'كَلَّابَلۡ رَانَ عَلٰى قُلُوۡبِهِمۡ مَّا كَانُوۡا يَكۡسِبُوۡن',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Saktah' explanation
                  Text(
                    'Saktah antara: كَلَّا بَلۡ رَانٍَۙ',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Saktah"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSaktah3Audio,
                      child: Text(_isPlayingSaktah3 ? "Pause Audio" : "Putar Audio Saktah"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bagian keempat bacaan atau ayat yang wajib dibaca saktah yaitu terdapat dalam Surat  Al-Kahfi ayat 1:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'اَ لۡحَمۡدُ لِلّٰهِ الَّذِىۡۤ اَنۡزَلَ عَلٰى عَبۡدِهِ الۡكِتٰبَ وَلَمۡ يَجۡعَلْ لَّهٗ عِوَجًا١',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Saktah' explanation
                  Text(
                    'Saktah antara: عِوَجًا١',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Saktah"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSaktah4Audio,
                      child: Text(_isPlayingSaktah4 ? "Pause Audio" : "Putar Audio Saktah"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Tashīl']!,
              title: 'Bacaan Tashīl (Contoh Surat Fuṣṣilat Ayat 44)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Mempermudah dua hamzah berurutan dengan mengubah hamzah kedua menjadi bunyi antara hamzah dan alif.\n\n'
                          'Contoh:\n'
                          'Dalam Al-Quran hanya 1 bacaan saja yang wajib dibaca tahsil yaitu terdapat dalam Surat Fuṣṣilat ayat 44:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ءَؔاَعۡجَمِىٌّ وَّعَرَبِ  ؕ قُلۡ هُوَ لِلَّذِيۡنَ اٰمَنُوۡا هُدًى وَشِفَآءٌ  ؕ َ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'أَأَعْجَمِيٌّ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseTashilAudio,
                      child: Text(_isPlayingTashil ? "Pause Audio" : "Putar Audio Tashīl"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Naql']!,
              title: 'Bacaan Naql (Contoh Surat Al-Ḥujurāt Ayat 11)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Memindahkan harakat dari hamzah ke huruf sebelumnya, membuat hamzah tidak dibaca.\n\n'
                          'Contoh:\n'
                          'Dalam Al-Quran hanya 1 bacaan saja yang wajib dibaca naql yaitu terdapat dalam Surat Al-Ḥujurāt ayat 11:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'بِئۡسَ الِاسۡمُ الۡفُسُوۡقُ بَعۡدَ الۡاِيۡمَانِۚ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ٱلِٱسْمُ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseNaqlAudio,
                      child: Text(_isPlayingNaql ? "Pause Audio" : "Putar Audio Naql"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Bacaan Badal']!,
              title: 'Bacaan Badal (Contoh Surat Al-Aḥqāf Ayat 4)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Mengganti hamzah dengan alif agar bacaan lebih ringan.\n\n'
                          'Contoh:\n'
                          'Hanya terdapat dalam Surat Al-Aḥqāf ayat 4:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'قُلۡ اَرَءَيۡتُمۡ مَّا تَدۡعُوۡنَ مِنۡ دُوۡنِ اللّٰهِ اَرُوۡنِىۡ مَاذَا خَلَقُوۡا مِنَ الۡاَرۡضِ اَمۡ لَهُمۡ شِرۡكٌ فِى السَّمٰوٰت اِیْتُوۡنِىۡ بِكِتٰبٍ مِّنۡ قَبۡلِ هٰذَاۤ اَوۡ'
                      'اَثٰرَةٍ مِّنۡ عِلۡمٍ اِنۡ كُنۡتُمۡ صٰدِقِيۡنَ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'فِى السَّمٰوٰؕ اِیْتُوۡنِىۡ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseBadalAudio,
                      child: Text(_isPlayingBadal ? "Pause Audio" : "Putar Audio Badal"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Mad & Qaṣr']!,
              title: 'Mad & Qaṣr (Contoh Surat Al-Kāfirūn Ayat 4)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Perbedaan panjang pendek bacaan pada kata tertentu.\n\n'
                          'Contoh:\n'
                          'Surat Al-Kāfirūn ayat 4:\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'وَلَاۤ اَنَا عَابِدٌ مَّا عَبَدۡتُّم',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'أَنَا',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Dibaca: ana ',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseMadQasrAudio,
                      child: Text(_isPlayingMadQasr ? "Pause Audio" : "Putar Audio Mad & Qaṣr"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Ṣilah (Mad Ṣilah)']!,
              title: 'Ṣilah (Mad Ṣilah) (Contoh Kata: لَهُ)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Definisi:\n'
                          'Penambahan harakat pada huruf hā\' yang menunjukkan milik, bila berada antara dua harakat.\n\n'
                          'Contoh:\n'
                          'Kata: لَهُ\n'
                          'Dalam frasa: إِنَّهُ كَانَ بِهِ عَلِيمًا\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Container for Arabic text
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'لَهُ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 'Kata:' in red
                  Text(
                    'Kata:',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for the word "Kata"
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'لَهُ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildSection(
              key: sectionKeys['Lafaz Gharib Lain: "Malik" dan "Ḍuʿf"']!,
              title: 'Lafaz Gharib Lain: "Malik" dan "Ḍuʿf"',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1. Malik\n'
                          'Surat Al-Fātiḥah: مٰلِكِ يَوۡمِ الدِّيۡن\ndibaca: Mālik atau Malik\n\n'
                          '2. Ḍuʿf\n'
                          'Surat Ar-Rūm ayat 54: اَللّٰهُ الَّذِىۡ خَلَقَكُمۡ مِّنۡ ضُعۡفٍ ثُمَّ جَعَلَ مِنۡۢ بَعۡدِ ضُعۡفٍ قُوَّةً ثُمَّ جَعَلَ مِنۡۢ بَعۡدِ قُوَّةٍ ضُعۡفًا وَّشَيۡبَةؕ يَخۡلُقُ مَا يَشَآءُ  وَهُوَ الۡعَلِيۡمُ الۡقَدِيۡر, \n '
                          'Bisa dibaca ḍaʿf (fathah) atau ḍuʿf (ḍammah)\n',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'مٰلِكِ يَوۡمِ الدِّيۡن',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Malik example with Arabic text
                  Text(
                    'Malik (Contoh Surat Al-Fātiḥah):',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Green color for Malik example
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'مٰلِكِ ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseMalikAudio,
                      child: Text(_isPlayingMalik ? "Pause Audio" : "Putar Audio Malik"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'اَللّٰهُ الَّذِىۡ خَلَقَكُمۡ مِّنۡ ضُعۡفٍ ثُمَّ جَعَلَ مِنۡۢ بَعۡدِ ضُعۡفٍ قُوَّةً ثُمَّ جَعَلَ مِنۡۢ بَعۡدِ قُوَّةٍ ضُعۡفًا وَّشَيۡبَةؕ يَخۡلُقُ مَا يَشَآءُ  وَهُوَ الۡعَلِيۡمُ الۡقَدِيۡر',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Ḍuʿf example with Arabic text
                  Text(
                    'Ḍuʿf (Contoh Surat Ar-Rūm ayat 54):',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Green color for Ḍuʿf example
                    ),
                  ),
                  Container(
                    color: Colors.white, // White background for Arabic text
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ضَعْفٍ',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button for audio playback
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseDufAudio,
                      child: Text(_isPlayingDuf ? "Pause Audio" : "Putar Audio Ḍuʿf"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BC34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ],// Add more sections as needed...
        ),
      ),
    );
  }

  Widget buildSection({
    required GlobalKey key,
    required String title,
    required Widget content,
  }) {
    return Container(
      key: key,
      child: buildCard(title: title, content: content),
    );
  }

  Widget buildCard({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFDDEB9D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF037A16),
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}
