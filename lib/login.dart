import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup.dart';
import 'homepage.dart';
import 'auth_service.dart';

class LoginModel with ChangeNotifier {
  TextEditingController textController1 = TextEditingController();
  FocusNode textFieldFocusNode1 = FocusNode();

  TextEditingController textController2 = TextEditingController();
  FocusNode textFieldFocusNode2 = FocusNode();

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void disposeControllers() {
    textController1.dispose();
    textFieldFocusNode1.dispose();
    textController2.dispose();
    textFieldFocusNode2.dispose();
    super.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> saveUserToFirestore(User user) async {
    final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final snapshot = await userDoc.get();

    if (!snapshot.exists) {
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName ?? '',
        'photoUrl': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> _handleEmailLogin(BuildContext context, LoginModel model) async {
    final email = model.textController1.text.trim();
    final password = model.textController2.text;

    try {
      final user = await AuthService.signInWithEmailPassword(email, password);
      if (user != null) {
        await saveUserToFirestore(user);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePageWidget()),
        );
      }
    } catch (e) {
      _showSnackbar(context, e.toString().replaceAll('Exception: ', ''));
    }
  }

  Future<void> _handleGoogleLogin(BuildContext context) async {
    try {
      final user = await AuthService.signInWithGoogle();
      if (user != null) {
        await saveUserToFirestore(user);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePageWidget()),
        );
      }
    } catch (e) {
      _showSnackbar(context, e.toString().replaceAll('Exception: ', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xFFFAFFCA),
          body: SafeArea(
            child: Consumer<LoginModel>(builder: (context, model, child) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Text(
                        'TajwidKidz',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFFb9d4aa),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang Kembali',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Isi data di bawah ini untuk mengakses akun Anda.',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 40),
                            Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xFF037A16), offset: Offset(0, 2))],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: model.textController1,
                                focusNode: model.textFieldFocusNode1,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan email Anda',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Kata Sandi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xFF037A16), offset: Offset(0, 2))],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: model.textController2,
                                focusNode: model.textFieldFocusNode2,
                                obscureText: !model.isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan kata sandi Anda',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      model.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: model.togglePasswordVisibility,
                                  ),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: ElevatedButton(
                                  onPressed: () => _handleEmailLogin(context, model),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF037A16),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  child: Text('Masuk', style: TextStyle(fontSize: 25)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Belum punya akun? ', style: TextStyle(fontSize: 16)),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupWidget()),
                                  ),
                                  child: Text('Daftar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Atau masuk dengan', style: TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.redAccent, size: 20),
                                  onPressed: () => _handleGoogleLogin(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}