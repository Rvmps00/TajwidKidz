import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

class AudioController {
  final AudioPlayer _player = AudioPlayer();

  AudioController() {
    _player.setReleaseMode(ReleaseMode.release);
  }

  Future<void> play(String fileName) async {
    try {
      final ref = FirebaseStorage.instance.ref('Audios/$fileName'); // full path from model
      final Uint8List? audioBytes = await ref.getData();

      if (audioBytes != null) {
        await _player.play(BytesSource(audioBytes));
      } else {
        print("Audio playback error: No data returned for $fileName");
      }
    } catch (e) {
      print("Audio playback error: $e");
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
