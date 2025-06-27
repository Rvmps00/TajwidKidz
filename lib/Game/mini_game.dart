import 'package:flutter/material.dart';

class MiniGameWidget extends StatelessWidget {
  const MiniGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Game'),
        backgroundColor: Color(0xFF037A16),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang di Mini Game!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Anda bisa menambahkan mini game disini
            ElevatedButton(
              onPressed: () {
                // Aksi untuk memulai mini game
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Mini Game'),
                    content: Text('Mini game sedang berjalan...'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Mulai Mini Game'),
            ),
          ],
        ),
      ),
    );
  }
}
