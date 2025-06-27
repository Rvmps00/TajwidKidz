import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String _selectedLanguage = 'ID';
  bool _isSoundEnabled = true;
  bool _isNotificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'ID';
      _isSoundEnabled = prefs.getBool('isSoundEnabled') ?? true;
      _isNotificationsEnabled = prefs.getBool('isNotificationsEnabled') ?? true;
    });
  }

  void _changeLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = language;
    });
    prefs.setString('language', language);
  }

  void _toggleSound(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSoundEnabled = value;
    });
    prefs.setBool('isSoundEnabled', value);
  }

  void _toggleNotifications(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationsEnabled = value;
    });
    prefs.setBool('isNotificationsEnabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDCB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16),
        title: const Text(
          'Pengaturan Akun',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // warna ikon back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Pengaturan Bahasa
            ListTile(
              tileColor: const Color(0xFFFAFDCB),
              leading: const Icon(Icons.language),
              title: const Text('Bahasa'),
              subtitle: Text(_selectedLanguage == 'ID' ? 'Bahasa Indonesia' : 'English'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pilih Bahasa'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text('Bahasa Indonesia'),
                            onTap: () {
                              _changeLanguage('ID');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text('English'),
                            onTap: () {
                              _changeLanguage('EN');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(),

            // Pengaturan Suara
            ListTile(
              tileColor: const Color(0xFFFAFDCB),
              leading: const Icon(Icons.volume_up),
              title: const Text('Aktifkan Suara'),
              trailing: Switch(
                value: _isSoundEnabled,
                onChanged: _toggleSound,
              ),
            ),
            const Divider(),

            // Pengaturan Notifikasi
            ListTile(
              tileColor: const Color(0xFFFAFDCB),
              leading: const Icon(Icons.notifications),
              title: const Text('Aktifkan Notifikasi'),
              trailing: Switch(
                value: _isNotificationsEnabled,
                onChanged: _toggleNotifications,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
