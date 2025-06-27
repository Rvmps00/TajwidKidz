import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  XFile? _imageFile;

  // Fungsi untuk memilih gambar
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/${pickedFile.name}';
      final File localFile = File(filePath);
      await localFile.writeAsBytes(await pickedFile.readAsBytes());

      setState(() {
        _imageFile = XFile(localFile.path);
      });
    }
  }

  // Fungsi untuk menyimpan perubahan
  Future<void> _saveChanges() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    final user = FirebaseAuth.instance.currentUser;

    if (username.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap lengkapi semua kolom!')),
      );
      return;
    }

    String? imageUrl;
    if (_imageFile != null) {
      final ref = FirebaseStorage.instance.ref().child('profile_images/${user!.uid}.jpg');
      await ref.putFile(File(_imageFile!.path));
      imageUrl = await ref.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      'fullName': username,
      'email': email,
      if (imageUrl != null) 'photoUrl': imageUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan berhasil disimpan')),
    );

    Navigator.pop(context); // kembali ke account.dart
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDCB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16),
        elevation: 0,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Ikon di AppBar jadi putih
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.green.shade700,
                  backgroundImage: _imageFile != null
                      ? FileImage(File(_imageFile!.path))
                      : null,
                  child: _imageFile == null
                      ? const Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: Colors.white,
                  )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Nama Lengkap ',
                hintText: 'Masukkan Nama Lengkap atau Username baru',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                hintText: 'Masukkan email baru (jika diperlukan)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 30),

            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF037A16),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
