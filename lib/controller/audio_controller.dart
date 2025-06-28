import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

class AudioController {
  final AudioPlayer _player = AudioPlayer();
  Uint8List? _cachedBytes;
  String? _cachedFileName;

  AudioController() {
    _player.setReleaseMode(ReleaseMode.release);
  }

  /// Preload audio from Firebase Storage and cache the bytes
  Future<void> setSource(String fileName) async {
    if (_cachedFileName == fileName && _cachedBytes != null) return;

    try {
      final ref = FirebaseStorage.instance.ref('Audios/$fileName');
      final Uint8List? audioBytes = await ref.getData();

      if (audioBytes != null) {
        _cachedBytes = audioBytes;
        _cachedFileName = fileName;
      } else {
        print("Preload error: No data returned for $fileName");
      }
    } catch (e) {
      print("Preload error: $e");
    }
  }

  /// Play the preloaded audio (or preload and play if needed)
  Future<void> play({String? fileName}) async {
    try {
      if (fileName != null) {
        await setSource(fileName);
      }

      if (_cachedBytes != null) {
        await _player.play(BytesSource(_cachedBytes!));
      } else {
        print("Play error: No cached audio to play");
      }
    } catch (e) {
      print("Play error: $e");
    }
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Stream<PlayerState> get playerStateStream => _player.onPlayerStateChanged;

  Future<PlayerState> get currentState async => _player.state;
}
