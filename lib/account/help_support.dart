import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqList = [
      {
        'question': 'Apa itu aplikasi TajwidKidz?',
        'answer':
        'TajwidKidz adalah aplikasi edukasi interaktif berbasis game dan AI yang membantu anak-anak belajar tajwid secara menyenangkan.'
      },
      {
        'question': 'Bagaimana cara memulai belajar tajwid?',
        'answer':
        'Cukup masuk ke menu utama dan pilih level pembelajaran sesuai usia atau kemampuan. Ikuti latihan dan kuis interaktif.'
      },
      {
        'question': 'Apa itu AI Smart Tutor?',
        'answer':
        'AI Smart Tutor adalah fitur yang memberikan bimbingan otomatis, mengevaluasi bacaan anak, dan memberikan umpan balik instan.'
      },
      {
        'question': 'Bagaimana cara menggunakan fitur Game Tajwid?',
        'answer':
        'Masuk ke menu Tantangan & Pencapaian, lalu pilih mode game. Ikuti permainan sambil menjawab soal tajwid.'
      },
      {
        'question': 'Apakah aplikasi ini bisa digunakan tanpa koneksi internet?',
        'answer':
        'Beberapa fitur seperti materi dasar dan game tersedia offline. Namun, fitur AI dan pembaruan konten memerlukan internet.'
      },
      {
        'question': 'Bagaimana cara melaporkan bug atau masalah?',
        'answer':
        'Anda dapat melaporkan masalah melalui email ke support@tajwidkidz.com atau menggunakan formulir pada menu Hubungi Kami.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bantuan & Dukungan',
          style: TextStyle(
            color: Colors.white, // Judul putih
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Icon back juga putih
        backgroundColor: const Color(0xFF037A16),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFFAFDCB),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            final faq = faqList[index];
            return ExpansionTile(
              title: Text(
                faq['question']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    faq['answer']!,
                    style: const TextStyle(color: Colors.black87),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
