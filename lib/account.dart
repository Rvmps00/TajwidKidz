import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAD2), // warna kuning pucat tema
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16),
        elevation: 0,
        title: const Text(
          'Akun Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // Avatar dan nama/email
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.shade700,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nadia Salsabila',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'nadia@email.com',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Tombol Edit Profil
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implementasi edit profil
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profil ditekan')),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF037A16),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 32),

              // List menu fitur
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(
                      icon: Icons.settings,
                      label: 'Pengaturan',
                      onTap: () {
                        // TODO: Navigasi ke halaman pengaturan
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Pengaturan ditekan')),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      label: 'Bantuan & Dukungan',
                      onTap: () {
                        // TODO: Navigasi ke halaman bantuan
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Bantuan ditekan')),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {
                        // TODO: Implementasi logout
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logout ditekan')),
                        );
                      },
                      iconColor: Colors.red,
                      labelColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    Color? labelColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black87),
      title: Text(
        label,
        style: TextStyle(color: labelColor ?? Colors.black87, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
