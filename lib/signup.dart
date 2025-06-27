import 'package:flutter/material.dart';
import 'login.dart';
import 'auth_service.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  static String routeName = 'Signup';
  static String routePath = '/signup';

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _handleSignup() async {
    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackbar('Semua field harus diisi');
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar('Konfirmasi kata sandi tidak cocok');
      return;
    }

    try {
      final user = await AuthService.signUpWithEmailPassword(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (user != null) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Pendaftaran Berhasil'),
            content: const Text('Akun Anda telah berhasil didaftarkan. Silakan login untuk melanjutkan.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // tutup dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginWidget()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      _showSnackbar(e.toString().replaceAll('Exception: ', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFFCA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Daftar Akun',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: const Color(0xFFb9d4aa),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Nama Lengkap'),
                      _buildTextField(
                        controller: _nameController,
                        hint: 'Masukkan nama lengkap Anda',
                        obscure: false,
                      ),
                      const SizedBox(height: 20),
                      _buildLabel('Email'),
                      _buildTextField(
                        controller: _emailController,
                        hint: 'Masukkan email Anda',
                        obscure: false,
                      ),
                      const SizedBox(height: 20),
                      _buildLabel('Kata Sandi'),
                      _buildTextField(
                        controller: _passwordController,
                        hint: 'Masukkan kata sandi Anda',
                        obscure: !_isPasswordVisible,
                        isVisibleToggle: _isPasswordVisible,
                        onToggle: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildLabel('Konfirmasi Kata Sandi'),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        hint: 'Masukkan konfirmasi kata sandi Anda',
                        obscure: !_isConfirmPasswordVisible,
                        isVisibleToggle: _isConfirmPasswordVisible,
                        onToggle: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: _handleSignup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF037A16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontFamily: 'Inter Tight',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah punya akun? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginWidget()),
                              );
                            },
                            child: const Text(
                              'Masuk',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    VoidCallback? onToggle,
    bool isVisibleToggle = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Color(0xFF037A16), offset: Offset(0, 2)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Inter', fontSize: 16),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          isDense: true,
          suffixIcon: onToggle != null
              ? IconButton(
                  icon: Icon(
                    isVisibleToggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: onToggle,
                )
              : null,
        ),
        style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
        cursorColor: Colors.black,
      ),
    );
  }
}
