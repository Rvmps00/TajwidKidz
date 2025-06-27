import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/audio_model.dart';

class AudioRecordController {
  final AudioRecorder _recorder = AudioRecorder();

  Future<bool> _requestPermission() async {
    return await _recorder.hasPermission();
  }

  Future<AudioModel?> startRecording() async {
    if (!await _requestPermission()) return null;

    final dir = await getTemporaryDirectory();
    final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.wav';
    final fullPath = '${dir.path}/$fileName';

    // Konfigurasi untuk WAV 16-bit mono, 11025 Hz
    final config = RecordConfig(
      encoder: AudioEncoder.wav,
      sampleRate: 11025,
      bitRate: 128000,
      numChannels: 1,
    );

    await _recorder.start(config, path: fullPath);

    return AudioModel(
      label: 'Recording started at ${DateTime.now()}',
      fileName: fileName,
    );
  }

  Future<String?> stopAndUpload(AudioModel audio, {String folderPath = 'recordings'}) async {
    final path = await _recorder.stop();
    if (path == null) return null;

    final file = File(path);

    try {
      final ref = FirebaseStorage.instance.ref().child('$folderPath/${audio.fileName}');
      await ref.putFile(file);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Upload failed: $e');
      return null;
    } finally {
      await _recorder.dispose();
    }
  }
}
