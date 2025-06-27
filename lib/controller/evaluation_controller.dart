import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/evaluation_result.dart';

class EvaluationController {
  final String modelEndpoint = 'https://tajwid-server-979008559811.asia-southeast2.run.app/predict';

  Future<EvaluationResult?> evaluateFromFirebasePath(String firebasePath) async {
    try {
      // Ambil download URL dari Firebase Storage
      final ref = FirebaseStorage.instance.ref(firebasePath);
      final url = await ref.getDownloadURL();

      // Unduh file .wav ke lokal
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) throw Exception("Failed to download audio");

      final tempDir = await getTemporaryDirectory();
      final localFile = File('${tempDir.path}/temp.wav');
      await localFile.writeAsBytes(response.bodyBytes);

      // Kirim ke server Flask
      final request = http.MultipartRequest('POST', Uri.parse(modelEndpoint));
      request.files.add(await http.MultipartFile.fromPath('file', localFile.path));
      final streamedResponse = await request.send();

      final res = await http.Response.fromStream(streamedResponse);
      if (res.statusCode == 200) {
        return EvaluationResult.fromJson(json.decode(res.body));
      } else {
        print('Evaluation error: ${res.body}');
        return null;
      }
    } catch (e) {
      print('Error evaluating audio: $e');
      return null;
    }
  }
}
