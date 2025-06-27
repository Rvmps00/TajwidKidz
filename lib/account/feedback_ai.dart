import 'package:flutter/material.dart';

class FeedbackAIPage extends StatefulWidget {
  const FeedbackAIPage({super.key});

  @override
  _FeedbackAIPageState createState() => _FeedbackAIPageState();
}

class _FeedbackAIPageState extends State<FeedbackAIPage> {
  String selectedModule = "Level 1: Mengenal Huruf Hijaiyah"; // Default module
  String feedback = "Bagus! Anda hanya perlu sedikit memperbaiki bacaan huruf 'Za'.";
  String suggestion = "Cobalah latihan pengucapan lebih lanjut pada huruf 'Za'.";

  // List of modules (simplified)
  final List<Map<String, String>> modules = [
    {"name": "Level 1: Mengenal Huruf Hijaiyah"},
    {"name": "Level 2: Mengenal Harakat"},
    {"name": "Level 3: Huruf Hijaiyah (Babibu)"},
    {"name": "Level 4: Mengenal Tajwid"},
    {"name": "Level 5: Membaca Surah dengan Tajwid"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDCB), // Background color set to #FAFDCB
      appBar: AppBar(
        title: const Text('Feedback AI'),
        backgroundColor: const Color(0xFF037A16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modul Selection Section
            Text(
              'Pilih Modul Belajar',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // ListView for modules (without images)
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedModule = module['name']!;
                        feedback = "Feedback untuk ${selectedModule}: ..."; // Customize feedback
                        suggestion = "Cobalah latihan lebih banyak di ${selectedModule}.";
                      });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 5,
                      color: Colors.green.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        child: Text(
                          module['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Displaying feedback
            Text(
              "Modul Terpilih: $selectedModule",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              feedback,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Saran Perbaikan:",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              suggestion,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
