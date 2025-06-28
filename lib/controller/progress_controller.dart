import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgressController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> updateProgress(int levelIndex, bool completed) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore.collection('users').doc(uid).set({
      'progress': {
        'level$levelIndex': completed,
      }
    }, SetOptions(merge: true));
  }

  Future<List<bool>> getProgress() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return List.filled(7, false);

    final doc = await _firestore.collection('users').doc(uid).get();
    final data = doc.data();
    if (data == null || data['progress'] == null) return List.filled(7, false);

    Map<String, dynamic> progress = Map<String, dynamic>.from(data['progress']);
    return List.generate(7, (index) => progress['level${index + 1}'] ?? false);
  }
}
