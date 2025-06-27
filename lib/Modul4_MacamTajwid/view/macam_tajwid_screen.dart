import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TajwidKidz/Modul4_MacamTajwid/viewmodel/macam_tajwid_viewmodel.dart';

class MacamTajwidScreen extends StatelessWidget {
  const MacamTajwidScreen({super.key});

  TextSpan _buildStyledText(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
    final List<TextSpan> spans = [];

    text.splitMapJoin(
      arabicRegex,
      onMatch: (m) {
        spans.add(TextSpan(
          text: m.group(0),
          style: const TextStyle(
            fontSize: 28,
            color: Colors.black,
            height: 1.5, // <-- Tambahkan ini untuk mengatur line height teks Arab
          ),
        ));
        return '';
      },
      onNonMatch: (nm) {
        spans.add(TextSpan(
          text: nm,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            height: 1.5, // <-- Tambahkan ini untuk mengatur line height teks non-Arab
          ),
        ));
        return '';
      },
    );

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MacamTajwidViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Macam - Macam Tajwid"),
          backgroundColor: Color(0xFFFAFDCB),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu), // Hamburger menu
              onPressed: () {
                // Aksi untuk hamburger menu
              },
            ),
          ],
        ),
        body: Consumer<MacamTajwidViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: viewModel.tajwidList.length,
              itemBuilder: (context, index) {
                final tajwid = viewModel.tajwidList[index];
                final isOdd = (index + 1) % 2 != 0; // Cek ganjil/genap berdasarkan nomor tajwid
                final backgroundColor =
                    isOdd ? const Color(0xFFDDEB9D) : const Color(0xFFFAFDCB);

                String fullTextToSpeak =
                    "${tajwid.title} ${tajwid.otherTitle}. Huruf yang Berpengaruh: ${tajwid.influentialLetter}. Cara Baca: ${tajwid.howToRead}.";

                print('Full Text to Speak: $fullTextToSpeak');
                print('Text Length: ${fullTextToSpeak.length}');

                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  color: backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row untuk Nomor, Judul, Sub-judul, dan Speaker
                        Row(
                          children: [
                            Text(
                              tajwid.number + ".",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    tajwid.title,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  if (tajwid.otherTitle.isNotEmpty)
                                    const SizedBox(height: 0),
                                  if (tajwid.otherTitle.isNotEmpty)
                                    Text(
                                      tajwid.otherTitle,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/images/icon_speaker_green.png',
                                width: 45,
                                height: 45,
                              ),
                              onPressed: () {
                                viewModel.speak(fullTextToSpeak);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        const Text(
                          "Huruf yang Berpengaruh : ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        const SizedBox(height: 6),

                        RichText(
                          text: _buildStyledText(tajwid.influentialLetter), // <-- Panggil fungsi baru
                        ),

                        const SizedBox(height: 16),

                        // Cara Baca
                        const Text(
                          "Cara Baca:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tajwid.howToRead,
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          "Contoh Kata:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        
                        const SizedBox(height: 12),

                        ...List.generate(tajwid.exampleWord.length, (i) {
                          final subExamples = tajwid.exampleWord[i];
                          final subImages = tajwid.exampleImage[i];

                          if (subExamples.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          if (subExamples.length == 1) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              child: Text(
                                subExamples[0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(subExamples.length, (j) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end, // Memindahkan seluruh Row ke kanan
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/images/icon_speaker_green.png', // Pastikan path ini benar
                                          width: 35,
                                          height: 35,
                                        ),
                                        onPressed: () {
                                          viewModel.speak(subExamples[j], forceIndonesian: true);
                                        },
                                      ),
                                      const SizedBox(width: 6),
                                      if (subImages.isNotEmpty && subImages[j].isNotEmpty)
                                        Image.asset(
                                          subImages[j],
                                          height: 35,
                                          fit: BoxFit.contain,
                                        ),
                                      if (subImages.isNotEmpty && subImages[j].isNotEmpty)
                                        const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          subExamples[j],
                                          textAlign: TextAlign.end, // <-- Tambahkan ini untuk perataan kanan
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}