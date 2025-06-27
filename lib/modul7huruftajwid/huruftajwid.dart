import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class LatihanHurufTajwidPage extends StatefulWidget {
  const LatihanHurufTajwidPage({super.key});

  @override
  State<LatihanHurufTajwidPage> createState() => _LatihanHurufTajwidPageState();
}

class _LatihanHurufTajwidPageState extends State<LatihanHurufTajwidPage> {
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isPlayingAlif = false;
  bool _isPlayingBa = false;
  bool _isPlayingTa = false;
  bool _isPlayingTsa = false;
  bool _isPlayingJim = false;
  bool _isPlayingHa = false;
  bool _isPlayingKho = false;
  bool _isPlayingDal = false;
  bool _isPlayingDzal = false;
  bool _isPlayingRa = false;
  bool _isPlayingZa = false;
  bool _isPlayingSin = false;
  bool _isPlayingSyin = false;
  bool _isPlayingShod = false;
  bool _isPlayingDho = false;
  bool _isPlayingTho = false;
  bool _isPlayingDzo = false;
  bool _isPlayingAin = false;
  bool _isPlayingGho = false;
  bool _isPlayingFa = false;
  bool _isPlayingQof= false;
  bool _isPlayingKaf= false;
  bool _isPlayingLam= false;
  bool _isPlayingMim= false;
  bool _isPlayingNun= false;
  bool _isPlayingWau= false;
  bool _isPlayingHaa= false;
  bool _isPlayingYa= false;





  final Map<String, GlobalKey> sectionKeys = {
    'Latihan Huruf Alif': GlobalKey(),
    'Latihan Huruf Ba': GlobalKey(),
    'Latihan Huruf Ta': GlobalKey(),
    'Latihan Huruf Tsa': GlobalKey(),
    'Latihan Huruf Jim': GlobalKey(),
    'Latihan Huruf Ha': GlobalKey(),
    'Latihan Huruf Kho': GlobalKey(),
    'Latihan Huruf Dal': GlobalKey(),
    'Latihan Huruf Dzal': GlobalKey(),
    'Latihan Huruf Ra': GlobalKey(),
    'Latihan Huruf Za': GlobalKey(),
    'Latihan Huruf Sin': GlobalKey(),
    'Latihan Huruf Syin': GlobalKey(),
    'Latihan Huruf Shod': GlobalKey(),
    'Latihan Huruf Dho': GlobalKey(),
    'Latihan Huruf Tho': GlobalKey(),
    'Latihan Huruf Dzo': GlobalKey(),
    'Latihan Huruf Ain': GlobalKey(),
    'Latihan Huruf Gho': GlobalKey(),
    'Latihan Huruf Fa': GlobalKey(),
    'Latihan Huruf Qof': GlobalKey(),
    'Latihan Huruf Kaf': GlobalKey(),
    'Latihan Huruf Lam': GlobalKey(),
    'Latihan Huruf Mim': GlobalKey(),
    'Latihan Huruf Nun': GlobalKey(),
    'Latihan Huruf Wau': GlobalKey(),
    'Latihan Huruf Haa': GlobalKey(),
    'Latihan Huruf Ya': GlobalKey(),

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

  void _playPauseAlifAudio() async {
    if (_isPlayingAlif) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_alif1.mp3'));
    }
    setState(() {
      _isPlayingAlif = !_isPlayingAlif;
    });
  }

  void _playPauseBaAudio() async {
    if (_isPlayingBa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ba2.mp3'));
    }
    setState(() {
      _isPlayingBa = !_isPlayingBa;
    });
  }

  void _playPauseTaAudio() async {
    if (_isPlayingTa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ta3.mp3'));
    }
    setState(() {
      _isPlayingTa = !_isPlayingTa;
    });
  }

  void _playPauseTsaAudio() async {
    if (_isPlayingTsa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_tsa4.mp3'));
    }
    setState(() {
      _isPlayingTsa = !_isPlayingTsa;
    });
  }

  void _playPauseJimAudio() async {
    if (_isPlayingJim) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_jim5.mp3'));
    }
    setState(() {
      _isPlayingJim = !_isPlayingJim;
    });
  }

  void _playPauseHaAudio() async {
    if (_isPlayingHa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ha6.mp3'));
    }
    setState(() {
      _isPlayingHa = !_isPlayingHa;
    });
  }

  void _playPauseKhoAudio() async {
    if (_isPlayingKho) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_kho7.mp3'));
    }
    setState(() {
      _isPlayingKho = !_isPlayingKho;
    });
  }

  void _playPauseDalAudio() async {
    if (_isPlayingDal) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_dal8.mp3'));
    }
    setState(() {
      _isPlayingDal = !_isPlayingDal;
    });
  }

  void _playPauseDzalAudio() async {
    if (_isPlayingDzal) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_dza9.mp3'));
    }
    setState(() {
      _isPlayingDzal = !_isPlayingDzal;
    });
  }

  void _playPauseRaAudio() async {
    if (_isPlayingRa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ra10.mp3'));
    }
    setState(() {
      _isPlayingRa = !_isPlayingRa;
    });
  }

  void _playPauseZaAudio() async {
    if (_isPlayingZa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_za11.mp3'));
    }
    setState(() {
      _isPlayingZa = !_isPlayingZa;
    });
  }

  void _playPauseSinAudio() async {
    if (_isPlayingSin) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_sin12.mp3'));
    }
    setState(() {
      _isPlayingSin = !_isPlayingSin;
    });
  }

  void _playPauseSyinAudio() async {
    if (_isPlayingSyin) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_syin13.mp3'));
    }
    setState(() {
      _isPlayingSyin = !_isPlayingSyin;
    });
  }

  void _playPauseShodAudio() async {
    if (_isPlayingShod) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_shod14.mp3'));
    }
    setState(() {
      _isPlayingShod = !_isPlayingShod;
    });
  }

  void _playPauseDhoAudio() async {
    if (_isPlayingDho) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_Dho14.mp3'));
    }
    setState(() {
      _isPlayingDho = !_isPlayingDho;
    });
  }

  void _playPauseThoAudio() async {
    if (_isPlayingTho) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_tho15.mp3'));
    }
    setState(() {
      _isPlayingTho = !_isPlayingTho;
    });
  }

  void _playPauseDzoAudio() async {
    if (_isPlayingDzo) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_dzo16.mp3'));
    }
    setState(() {
      _isPlayingDzo = !_isPlayingDzo;
    });
  }

  void _playPauseAinAudio() async {
    if (_isPlayingAin) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ain17.mp3'));
    }
    setState(() {
      _isPlayingAin = !_isPlayingAin;
    });
  }

  void _playPauseGhoAudio() async {
    if (_isPlayingGho) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_gho18.mp3'));
    }
    setState(() {
      _isPlayingGho = !_isPlayingGho;
    });
  }

  void _playPauseFaAudio() async {
    if (_isPlayingFa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_fa19.mp3'));
    }
    setState(() {
      _isPlayingFa = !_isPlayingFa;
    });
  }

  void _playPauseQofAudio() async {
    if (_isPlayingQof) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_qof20.mp3'));
    }
    setState(() {
      _isPlayingQof = !_isPlayingQof;
    });
  }

  void _playPauseKafAudio() async {
    if (_isPlayingKaf) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_kaf21.mp3'));
    }
    setState(() {
      _isPlayingKaf = !_isPlayingKaf;
    });
  }

  void _playPauseLamAudio() async {
    if (_isPlayingLam) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_lam22.mp3'));
    }
    setState(() {
      _isPlayingLam = !_isPlayingLam;
    });
  }

  void _playPauseMimAudio() async {
    if (_isPlayingMim) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_mim23.mp3'));
    }
    setState(() {
      _isPlayingMim = !_isPlayingMim;
    });
  }

  void _playPauseNunAudio() async {
    if (_isPlayingNun) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_nun24.mp3'));
    }
    setState(() {
      _isPlayingNun = !_isPlayingNun;
    });
  }

  void _playPauseWauAudio() async {
    if (_isPlayingWau) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_wau25.mp3'));
    }
    setState(() {
      _isPlayingWau = !_isPlayingWau;
    });
  }

  void _playPauseHaaAudio() async {
    if (_isPlayingHaa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_haa26.mp3'));
    }
    setState(() {
      _isPlayingHaa = !_isPlayingHaa;
    });
  }

  void _playPauseYaAudio() async {
    if (_isPlayingYa) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audios/usmani_ya27.mp3'));
    }
    setState(() {
      _isPlayingYa = !_isPlayingYa;
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
          ' Level 7 Latihan Pengu \n capan Huruf Tajwid',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
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
              'Latihan Tajwid',
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
              key: sectionKeys['Latihan Huruf Alif']!,
              title: 'Alif (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['َءَا', 'إِىْ', 'أُوْ', 'أَأْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['أُوأً', 'أَنِ', 'أَأْنَ', 'مِنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['الْمُؤْنِ', 'َمَئِيْئًا أَنِئًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseAlifAudio,
                      child: Text(_isPlayingAlif ? "Pause Audio" : "Putar Audio Alif"),
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
              key: sectionKeys['Latihan Huruf Ba']!,
              title: 'Ba (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['بَا', 'بِي', 'بُوْ', 'أَبْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['بُوبًا', 'بَنَ', 'بَبْنَِ', 'مِنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['الْمُبْنِ', 'مَبِيْبًا', 'بَنِبًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseBaAudio,
                      child: Text(_isPlayingBa ? "Pause Audio" : "Putar Audio Ba"),
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
              key: sectionKeys['Latihan Huruf Ta']!,
              title: 'Ta (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['تَا', 'تِي', 'تُوْ', 'أَْتْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['تُوْتًا', 'تَنِ', 'تَتْنَ', 'مِنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['الْمُتْنِ', 'مَتِيْتًا', 'تَنِتًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseTaAudio,
                      child: Text(_isPlayingTa ? "Pause Audio" : "Putar Audio Ta"),
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
              key: sectionKeys['Latihan Huruf Tsa']!,
              title: 'Tsa (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['ثَا', 'ثِي', 'ثُو', 'أَْثْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['ثُوْتًا', 'ثَنِِ', 'ثَثْنَ', 'مِنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['الْمُثْنِ', 'مَثِيْئًا', 'ثَنِيًّا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseTsaAudio,
                      child: Text(_isPlayingTsa ? "Pause Audio" : "Putar Audio Tsa"),
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
              key: sectionKeys['Latihan Huruf Jim']!,
              title: 'Jim (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['جَا', 'جِي', 'جُو', 'أَجْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['جُوْجًا', 'جَنِ', 'جَجْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow([ 'مِنَ','الْمُجْنِ', 'مَجِيجًا',]),
                  const SizedBox(height: 20),
                  buildLetterRow([ 'جَنِجًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseJimAudio,
                      child: Text(_isPlayingJim ? "Pause Audio" : "Putar Audio Jim"),
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
              key: sectionKeys['Latihan Huruf Ha']!,
              title: 'Ha (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['حَا', 'حِيْ', 'حُوْ', 'أَحْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['حُوْحًا', 'حَنِ', 'حَحْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow([ 'مِنَ','الْمُحْنِ', 'مَحِيْحَا']),
                  const SizedBox(height: 20),
                  buildLetterRow([  'حَنِحًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseHaAudio,
                      child: Text(_isPlayingHa ? "Pause Audio" : "Putar Audio Ha"),
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
              key: sectionKeys['Latihan Huruf Kho']!,
              title: 'Kho (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['خَا', 'خِيْ', 'خُو', 'أَخْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['خُوْخًا', 'خَنِ', 'خَخْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow([ 'مِنَ', 'الْمُخْنِ', 'مَخِيْخًا']),
                  const SizedBox(height: 20),
                  buildLetterRow([  'خَنِخًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseKhoAudio,
                      child: Text(_isPlayingKho ? "Pause Audio" : "Putar Audio Kho"),
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
              key: sectionKeys['Latihan Huruf Dal']!,
              title: 'Dal (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['دَا', 'دِي', 'دُو', 'أَدْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['دُوْدًا', 'دَنِ', 'دَدْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُدْنِ', 'مَدِيدًا']),
                  const SizedBox(height: 20),
                  buildLetterRow(['دَنِدًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseDalAudio,
                      child: Text(_isPlayingDal ? "Pause Audio" : "Putar Audio Dal"),
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
              key: sectionKeys['Latihan Huruf Dzal']!,
              title: 'Dzal (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['ذَا', 'ذِي', 'ذُو', 'أَذْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['ذُوْذَا', 'ذَن', 'ذَذْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُذْنِ', 'مَذِيذَا']),
                  const SizedBox(height: 20),
                  buildLetterRow(['ذَيْنًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseDzalAudio,
                      child: Text(_isPlayingDzal ? "Pause Audio" : "Putar Audio Dzal"),
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
              key: sectionKeys['Latihan Huruf Ra']!,
              title: 'Ra (Latihan Huruf Tajwid)',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['رَا', 'رِي', 'رُو', 'أَرْ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['رُوْرًا', 'رَنِ', 'رَرْنَ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُرْنِ']),
                  const SizedBox(height: 20),
                  buildLetterRow(['مَرِيرًا', 'رَنِرًا']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseRaAudio,
                      child: Text(_isPlayingRa ? "Pause Audio" : "Putar Audio Ra"),
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
              key: sectionKeys['Latihan Huruf Za']!, // Mengganti 'Ra' menjadi 'Za'
              title: 'Za (Latihan Huruf Tajwid)', // Mengganti 'Ra' menjadi 'Za'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['زَا', 'زِي', 'زُو', 'أَزْ']), // Menambahkan variasi huruf Za
                  const SizedBox(height: 20),
                  buildLetterRow(['زُوْزًا', 'زَنِ', 'زَزْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُزْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَزِيزًا', 'زَنِْرًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseZaAudio, // Mengganti _playPauseRaAudio menjadi _playPauseZaAudio
                      child: Text(_isPlayingZa ? "Pause Audio" : "Putar Audio Za"), // Mengganti 'Ra' menjadi 'Za'
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
              key: sectionKeys['Latihan Huruf Sin']!, // Mengganti 'Za' menjadi 'Sin'
              title: 'Sin (Latihan Huruf Tajwid)', // Mengganti 'Za' menjadi 'Sin'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['سََا', 'سِي', 'سُو', 'أَسْ']), // Menambahkan variasi huruf Sin
                  const SizedBox(height: 20),
                  buildLetterRow(['سُوْسًا', 'سَن', 'سَسْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُسْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَسِيْسًا', 'سَنِسًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSinAudio, // Mengganti _playPauseZaAudio menjadi _playPauseSinAudio
                      child: Text(_isPlayingSin ? "Pause Audio" : "Putar Audio Sin"), // Mengganti 'Za' menjadi 'Sin'
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
              key: sectionKeys['Latihan Huruf Syin']!, // Mengganti 'Sin' menjadi 'Syin'
              title: 'Syin (Latihan Huruf Tajwid)', // Mengganti 'Sin' menjadi 'Syin'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['شَا', 'شِي', 'شُو', 'أَشْ']), // Menambahkan variasi huruf Syin
                  const SizedBox(height: 20),
                  buildLetterRow(['شُوشَاْ', 'شَنِ', 'شَشْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُشْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَشِيشَّاشَنِشًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseSyinAudio, // Mengganti _playPauseSinAudio menjadi _playPauseSyinAudio
                      child: Text(_isPlayingSyin ? "Pause Audio" : "Putar Audio Syin"), // Mengganti 'Sin' menjadi 'Syin'
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
              key: sectionKeys['Latihan Huruf Shod']!, // Mengganti 'Syin' menjadi 'Shod'
              title: 'Shod (Latihan Huruf Tajwid)', // Mengganti 'Syin' menjadi 'Shod'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['صَا', 'صِي', 'صُوْ', 'أَصْ']), // Menambahkan variasi huruf Shod
                  const SizedBox(height: 20),
                  buildLetterRow(['صُوْصًا', 'صَن', 'صَصْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُصْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَصِيصًا', 'صَنِصًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseShodAudio, // Mengganti _playPauseSyinAudio menjadi _playPauseShodAudio
                      child: Text(_isPlayingShod ? "Pause Audio" : "Putar Audio Shod"), // Mengganti 'Syin' menjadi 'Shod'
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
              key: sectionKeys['Latihan Huruf Dho']!, // Mengganti 'Shod' menjadi 'Dho'
              title: 'Dho (Latihan Huruf Tajwid)', // Mengganti 'Shod' menjadi 'Dho'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['ضََا', 'فِي', 'ضُوْ', 'أَضْ']), // Menambahkan variasi huruf Dho
                  const SizedBox(height: 20),
                  buildLetterRow(['ضُوْضًا', 'ضَنِ', 'ضَضْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُضْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَضِيْضًا', 'ضَنِضًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseDhoAudio, // Mengganti _playPauseShodAudio menjadi _playPauseDhoAudio
                      child: Text(_isPlayingDho ? "Pause Audio" : "Putar Audio Dho"), // Mengganti 'Shod' menjadi 'Dho'
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
              key: sectionKeys['Latihan Huruf Tho']!, // Mengganti 'Dho' menjadi 'Tho'
              title: 'Tho (Latihan Huruf Tajwid)', // Mengganti 'Dho' menjadi 'Tho'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['طَا',' طَى', 'طُوْ', 'أَطُ' ]), // Menambahkan variasi huruf Tho
                  const SizedBox(height: 20),
                  buildLetterRow(['طُوطًا','طَنِ', 'طَطْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُطْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَطِيطًا', 'طَنِطًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseThoAudio, // Mengganti _playPauseDhoAudio menjadi _playPauseThoAudio
                      child: Text(_isPlayingTho ? "Pause Audio" : "Putar Audio Tho"), // Mengganti 'Dho' menjadi 'Tho'
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
              key: sectionKeys['Latihan Huruf Dzo']!, // Mengganti 'Tho' menjadi 'Dzo'
              title: 'Dzo (Latihan Huruf Tajwid)', // Mengganti 'Tho' menjadi 'Dzo'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['ظََا', 'ِظِي', 'ُظُو', 'أَظُ']), // Menambahkan variasi huruf Dzo
                  const SizedBox(height: 20),
                  buildLetterRow(['ُظُوْظًا', 'ظَنِ', 'ظَظْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُظْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَظِيْظًا', 'ظَنِظًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseDzoAudio, // Mengganti _playPauseThoAudio menjadi _playPauseDzoAudio
                      child: Text(_isPlayingDzo ? "Pause Audio" : "Putar Audio Dzo"), // Mengganti 'Tho' menjadi 'Dzo'
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
              key: sectionKeys['Latihan Huruf Ain']!, // Mengganti 'Dzo' menjadi 'Ain'
              title: 'Ain (Latihan Huruf Tajwid)', // Mengganti 'Dzo' menjadi 'Ain'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['عََا', 'عِْوْ', 'عُوْ', 'أَعْ']), // Menambahkan variasi huruf Ain
                  const SizedBox(height: 20),
                  buildLetterRow(['عُوْعًا', 'عَنِ', 'عَعْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُعْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَعِيعًا', 'عَنِعًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseAinAudio, // Mengganti _playPauseDzoAudio menjadi _playPauseAinAudio
                      child: Text(_isPlayingAin ? "Pause Audio" : "Putar Audio Ain"), // Mengganti 'Dzo' menjadi 'Ain'
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
              key: sectionKeys['Latihan Huruf Gho']!, // Mengganti 'Ain' menjadi 'Gho'
              title: 'Gho (Latihan Huruf Tajwid)', // Mengganti 'Ain' menjadi 'Gho'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['غََا', 'ِغِي', 'غُرُ', 'أَغْ']), // Menambahkan variasi huruf Gho
                  const SizedBox(height: 20),
                  buildLetterRow(['غُوْا', 'عَنِ', 'غَغْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُغْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَغِيعًا', 'غَنِفًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseGhoAudio, // Mengganti _playPauseAinAudio menjadi _playPauseGhoAudio
                      child: Text(_isPlayingGho ? "Pause Audio" : "Putar Audio Gho"), // Mengganti 'Ain' menjadi 'Gho'
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
              key: sectionKeys['Latihan Huruf Fa']!, // Mengganti 'Gho' menjadi 'Fa'
              title: 'Fa (Latihan Huruf Tajwid)', // Mengganti 'Gho' menjadi 'Fa'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['فََا', 'فِي', 'فُوْ', 'أَفْ']), // Menambahkan variasi huruf Fa
                  const SizedBox(height: 20),
                  buildLetterRow(['فُوْفًا', 'فَن', 'فَفْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُفْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَفِيفًا', 'فَنِفًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseFaAudio, // Mengganti _playPauseGhoAudio menjadi _playPauseFaAudio
                      child: Text(_isPlayingFa ? "Pause Audio" : "Putar Audio Fa"), // Mengganti 'Gho' menjadi 'Fa'
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
              key: sectionKeys['Latihan Huruf Qof']!, // Mengganti 'Fa' menjadi 'Qof'
              title: 'Qof (Latihan Huruf Tajwid)', // Mengganti 'Fa' menjadi 'Qof'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['قََا', 'قِِي', 'قُوْ', 'أَقْ']), // Menambahkan variasi huruf Qof
                  const SizedBox(height: 20),
                  buildLetterRow(['قُوْقًا', 'قَنِ', 'َقَقْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُقْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَقِيقًا', 'قَنِقًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseQofAudio, // Mengganti _playPauseFaAudio menjadi _playPauseQofAudio
                      child: Text(_isPlayingQof ? "Pause Audio" : "Putar Audio Qof"), // Mengganti 'Fa' menjadi 'Qof'
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
              key: sectionKeys['Latihan Huruf Kaf']!, // Mengganti 'Qof' menjadi 'Kaf'
              title: 'Kaf (Latihan Huruf Tajwid)', // Mengganti 'Qof' menjadi 'Kaf'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['كََا', 'كِِي', 'كُو', 'أَكْ']), // Menambahkan variasi huruf Kaf
                  const SizedBox(height: 20),
                  buildLetterRow(['كُوْكً', 'كَنِ', 'كَكْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُكْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَكِيْكًا', 'كَنِكًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseKafAudio, // Mengganti _playPauseQofAudio menjadi _playPauseKafAudio
                      child: Text(_isPlayingKaf ? "Pause Audio" : "Putar Audio Kaf"), // Mengganti 'Qof' menjadi 'Kaf'
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
              key: sectionKeys['Latihan Huruf Lam']!, // Mengganti 'Kaf' menjadi 'Lam'
              title: 'Lam (Latihan Huruf Tajwid)', // Mengganti 'Kaf' menjadi 'Lam'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['لَا', 'لِي', 'لُو', 'أَلْ']), // Menambahkan variasi huruf Lam
                  const SizedBox(height: 20),
                  buildLetterRow(['لُوْلًا', 'لَن', 'لَلْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'المُلْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَلِيْلًا', 'لَئِلًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseLamAudio, // Mengganti _playPauseKafAudio menjadi _playPauseLamAudio
                      child: Text(_isPlayingLam ? "Pause Audio" : "Putar Audio Lam"), // Mengganti 'Kaf' menjadi 'Lam'
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
              key: sectionKeys['Latihan Huruf Mim']!, // Mengganti 'Lam' menjadi 'Mim'
              title: 'Mim (Latihan Huruf Tajwid)', // Mengganti 'Lam' menjadi 'Mim'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['مََا', 'مِنْ', 'مُوْ', 'أَمْ']), // Menambahkan variasi huruf Mim
                  const SizedBox(height: 20),
                  buildLetterRow(['مُوْمًا', 'مَن', 'مَمْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُمْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَمِيمًا', 'مَنِمًا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseMimAudio, // Mengganti _playPauseLamAudio menjadi _playPauseMimAudio
                      child: Text(_isPlayingMim ? "Pause Audio" : "Putar Audio Mim"), // Mengganti 'Lam' menjadi 'Mim'
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
              key: sectionKeys['Latihan Huruf Nun']!, // Mengganti 'Mim' menjadi 'Nun'
              title: 'Nun (Latihan Huruf Tajwid)', // Mengganti 'Mim' menjadi 'Nun'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['نََا', 'نِي', 'نُوْ', 'أَنْ']), // Menambahkan variasi huruf Nun
                  const SizedBox(height: 20),
                  buildLetterRow(['نُوْنًا', 'نَنِ', 'نَنْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُنْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَنِينَا', 'نَنِنَا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseNunAudio, // Mengganti _playPauseMimAudio menjadi _playPauseNunAudio
                      child: Text(_isPlayingNun ? "Pause Audio" : "Putar Audio Nun"), // Mengganti 'Mim' menjadi 'Nun'
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
              key: sectionKeys['Latihan Huruf Wau']!, // Mengganti 'Nun' menjadi 'Wau'
              title: 'Wau (Latihan Huruf Tajwid)', // Mengganti 'Nun' menjadi 'Wau'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['وَا', 'وِی', 'وُوُ', 'أَوْ']), // Menambahkan variasi huruf Wau
                  const SizedBox(height: 20),
                  buildLetterRow(['وُوْوًا', 'وَنِ', 'وَوْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْوُوْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['َوَوِيوًا', 'وَنِوَّا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseWauAudio, // Mengganti _playPauseNunAudio menjadi _playPauseWauAudio
                      child: Text(_isPlayingWau ? "Pause Audio" : "Putar Audio Wau"), // Mengganti 'Nun' menjadi 'Wau'
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
              key: sectionKeys['Latihan Huruf Haa']!, // Mengganti 'Wau' menjadi 'Haa'
              title: 'Haa (Latihan Huruf Tajwid)', // Mengganti 'Wau' menjadi 'Haa'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['هََا', 'هِِي', 'هُوَ', 'أَهْ']), // Menambahkan variasi huruf Haa
                  const SizedBox(height: 20),
                  buildLetterRow(['هُوْهًا', 'هَنِ', 'هَهْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'المُهْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَهِيْهَا', 'هَنِهَا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseHaaAudio, // Mengganti _playPauseWauAudio menjadi _playPauseHaaAudio
                      child: Text(_isPlayingHaa ? "Pause Audio" : "Putar Audio Haa"), // Mengganti 'Wau' menjadi 'Haa'
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
              key: sectionKeys['Latihan Huruf Ya']!, // Mengganti 'Haa' menjadi 'Ya'
              title: 'Ya (Latihan Huruf Tajwid)', // Mengganti 'Haa' menjadi 'Ya'
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLetterRow(['يَا', 'بِيْ', 'يُو', 'أَي']), // Menambahkan variasi huruf Ya
                  const SizedBox(height: 20),
                  buildLetterRow(['يُوْيًا', 'يَنِ', 'بَيْنَ']), // Menambahkan variasi tambahan
                  const SizedBox(height: 20),
                  buildLetterRow(['مِنَ', 'الْمُيْنِ']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  buildLetterRow(['مَبِييًا', 'يَنِيًّا']), // Menambahkan variasi lainnya
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _playPauseYaAudio, // Mengganti _playPauseHaaAudio menjadi _playPauseYaAudio
                      child: Text(_isPlayingYa ? "Pause Audio" : "Putar Audio Ya"), // Mengganti 'Haa' menjadi 'Ya'
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
          ],
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

  Widget buildLetterRow(List<String> letters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: letters
          .map((letter) => Expanded(child: buildLetterBox(letter)))
          .toList(),
    );
  }

  Widget buildLetterBox(String letter) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFDDEB9D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          letter,
          style: GoogleFonts.inter(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
