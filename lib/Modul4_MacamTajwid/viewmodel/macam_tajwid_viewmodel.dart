import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:TajwidKidz/Modul4_MacamTajwid/data/macam_tajwid.dart';
import 'package:TajwidKidz/Modul4_MacamTajwid/models/tajwid_model.dart';
import 'package:flutter/foundation.dart';

class MacamTajwidViewModel extends ChangeNotifier {
  final List<TajwidModel> _tajwidList = susunHurufQuestions;
  late FlutterTts flutterTts;
  bool _isTtsInitSuccessful = false;

  List<TajwidModel> get tajwidList => _tajwidList;
  bool get isTtsReady => _isTtsInitSuccessful;

  MacamTajwidViewModel() {
    flutterTts = FlutterTts();
    _initTts();
  }

  Future<void> _initTts() async {
    print("TTS: Initializing TTS...");

    flutterTts.setStartHandler(() {
      print("TTS: EVENT - Speaking started");
    });

    flutterTts.setCompletionHandler(() {
      print("TTS: EVENT - Speaking completed");
    });

    flutterTts.setErrorHandler((msg) {
      print("TTS: EVENT - Error: $msg");
      _isTtsInitSuccessful = false;
      notifyListeners();
    });

    try {
      final List<dynamic> languages = await flutterTts.getLanguages;
      print("TTS: Available languages: $languages");

      bool isArabicAvailable = await flutterTts.isLanguageAvailable("ar-SA");
      bool isIndonesianAvailable = await flutterTts.isLanguageAvailable("id-ID");

      print("TTS: Arabic (ar-SA) available: $isArabicAvailable");
      print("TTS: Indonesian (id-ID) available: $isIndonesianAvailable");

      if (!isArabicAvailable && !isIndonesianAvailable) {
        print("TTS: Neither ar-SA nor id-ID available, falling back to en-US");
        await flutterTts.setLanguage("en-US");
      } else {
        await flutterTts.setLanguage(isIndonesianAvailable ? "id-ID" : "ar-SA");
      }

      if (isIndonesianAvailable) {
        final voices = await flutterTts.getVoices;
        print("TTS: Available voices: $voices");
        final indonesianVoice = voices.firstWhere(
          (voice) => voice['locale'] == 'id-ID',
          orElse: () => null,
        );
        if (indonesianVoice != null) {
          await flutterTts.setVoice({"name": indonesianVoice['name'], "locale": "id-ID"});
          print("TTS: Selected Indonesian voice: ${indonesianVoice['name']}");
        }
      }

      await flutterTts.setSpeechRate(0.4); // Default for Indonesian
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.2);
      await flutterTts.awaitSpeakCompletion(true);

      await Future.delayed(const Duration(milliseconds: 500));

      _isTtsInitSuccessful = true;
      print("TTS: Initialization successful.");
    } catch (e) {
      print("TTS: Failed to initialize TTS: $e");
      _isTtsInitSuccessful = false;
    }

    notifyListeners();
  }

  bool _containsArabic(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text);
  }

  String preprocessTextForIndonesian(String text) {
    const arabicToTranslit = {
      'ا': 'alif',
      'ب': 'ba',
      'ج': 'jim',
      'د': 'dal',
      'ذ': 'dzal',
      'ز': 'zain',
      'س': 'sin',
      'ش': 'syin',
      'ص': 'shad',
      'ض': 'dhad',
      'ط': 'tha',
      'ظ': 'zha',
      'ف': 'fa',
      'ق': 'qaf',
      'ك': 'kaf',
      'ل': 'lam',
      'م': 'mim',
      'ن': 'nun',
      'ه': 'ha',
      'و': 'waw',
      'ي': 'ya',
      'ر': 'ra',
      'خ': 'kha',
      'ح': 'ha',
      'غ': 'ghain',
      'ع': 'ain',
      'ء': 'hamzah',
      'ﻩ': 'ha',
      'ْ': '',
      'ٍ': '',
      'َ': '',
      'ُ': '',
      'ِ': '',
      'ّ': '',
      'عـ': 'ain',
      'فـ': 'fa',
      'قـ': 'qaf',
      'كـ': 'kaf',
      'ال': 'alif lam',
    };

    String cleanedText = text.replaceAll(RegExp(r'\([^)]*\)'), '');
    arabicToTranslit.forEach((key, value) {
      cleanedText = cleanedText.replaceAll(key, value);
    });
    cleanedText = cleanedText.replaceAll(RegExp(r'[^\x00-\x7F]'), ' ');
    cleanedText = cleanedText.replaceAll(RegExp(r'\s+'), ' ').trim();
    return cleanedText;
  }

  String preprocessTextForArabic(String text) {
    String cleanedText = text.replaceAll(',', ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
    cleanedText = cleanedText.replaceAll(RegExp(r'[\u064B-\u065F]'), '');
    return cleanedText;
  }

  Future<void> speak(String text, {bool forceIndonesian = false}) async {
    if (!_isTtsInitSuccessful) {
      print("TTS: Not ready. Reinitializing...");
      await _initTts();
      if (!_isTtsInitSuccessful) {
        print("TTS: Initialization failed. Speak canceled.");
        return;
      }
    }

    try {
      await flutterTts.stop();

      // Define speech rates
      const double indonesianSpeechRate = 0.4; // Default for Indonesian
      const double arabicSpeechRate = 0.15; // Slower for Arabic

      // Helper function to set Indonesian voice and speech rate
      Future<void> setIndonesianVoice() async {
        await flutterTts.setLanguage("id-ID");
        await flutterTts.setSpeechRate(indonesianSpeechRate);
        final voices = await flutterTts.getVoices;
        final indonesianVoice = voices.firstWhere(
          (voice) => voice['locale'] == 'id-ID',
          orElse: () => null,
        );
        if (indonesianVoice != null) {
          await flutterTts.setVoice({"name": indonesianVoice['name'], "locale": "id-ID"});
          print("TTS: Selected Indonesian voice: ${indonesianVoice['name']}");
        }
      }

      // If forceIndonesian is true, speak the entire text in Indonesian
      if (forceIndonesian) {
        await setIndonesianVoice();
        final cleanedText = preprocessTextForIndonesian(text);
        print("TTS: Speaking Indonesian (forced): $cleanedText");
        final result = await flutterTts.speak(cleanedText);
        if (result != 1) {
          print("TTS: Failed to speak forced Indonesian part, result: $result");
        }
        await flutterTts.awaitSpeakCompletion(true);
        return;
      }

      // Split text into parts for main IconButton
      final parts = text.split("Huruf yang Berpengaruh:");
      final titlePart = parts[0].trim(); // e.g., "Izhar Halqi (Dibaca Jelas)"
      final afterInfluential = parts.length > 1 ? parts[1].trim() : "";
      final influentialLetter = afterInfluential.split(".").first.trim(); // e.g., "عـ ﻩ ع ح غ خ"
      final remainingText = afterInfluential.split(".").skip(1).join(". ").trim(); // e.g., "Cara Baca: ..."

      // Speak title part in Indonesian
      if (titlePart.isNotEmpty) {
        await setIndonesianVoice();
        final cleanedTitle = preprocessTextForIndonesian(titlePart);
        print("TTS: Speaking Indonesian title: $cleanedTitle");
        final result = await flutterTts.speak(cleanedTitle);
        if (result != 1) {
          print("TTS: Failed to speak title part, result: $result");
        }
        await flutterTts.awaitSpeakCompletion(true);
      }

      // Speak "Huruf yang Berpengaruh" in Indonesian
      const hurufBerpengaruh = "Huruf yang Berpengaruh";
      await setIndonesianVoice();
      print("TTS: Speaking Indonesian: $hurufBerpengaruh");
      final resultHuruf = await flutterTts.speak(hurufBerpengaruh);
      if (resultHuruf != 1) {
        print("TTS: Failed to speak 'Huruf yang Berpengaruh', result: $resultHuruf");
      }
      await flutterTts.awaitSpeakCompletion(true);

      // Speak influentialLetter in Arabic if it contains Arabic characters
      if (influentialLetter.isNotEmpty) {
        if (_containsArabic(influentialLetter) && await flutterTts.isLanguageAvailable("ar-SA")) {
          await flutterTts.setLanguage("ar-SA");
          await flutterTts.setSpeechRate(arabicSpeechRate); // Slower for Arabic
          final voices = await flutterTts.getVoices;
          final arabicVoice = voices.firstWhere(
            (voice) => voice['locale'] == 'ar-SA',
            orElse: () => null,
          );
          if (arabicVoice != null) {
            await flutterTts.setVoice({"name": arabicVoice['name'], "locale": "ar-SA"});
            print("TTS: Selected Arabic voice: ${arabicVoice['name']}");
          } else {
            print("TTS: No Arabic voice available, using default ar-SA voice");
          }
          final cleanedArabic = preprocessTextForArabic(influentialLetter);
          print("TTS: Speaking Arabic part: $cleanedArabic");
          final result = await flutterTts.speak(cleanedArabic);
          if (result != 1) {
            print("TTS: Failed to speak Arabic part, result: $result");
          }
          await flutterTts.awaitSpeakCompletion(true);
        } else {
          await setIndonesianVoice();
          final cleanedInfluential = preprocessTextForIndonesian(influentialLetter);
          print("TTS: Speaking Indonesian transliteration: $cleanedInfluential");
          final result = await flutterTts.speak(cleanedInfluential);
          if (result != 1) {
            print("TTS: Failed to speak transliterated part, result: $result");
          }
          await flutterTts.awaitSpeakCompletion(true);
        }
      }

      // Speak remaining text in Indonesian
      if (remainingText.isNotEmpty) {
        await setIndonesianVoice();
        final cleanedRemaining = preprocessTextForIndonesian(remainingText);
        print("TTS: Speaking Indonesian part (after): $cleanedRemaining");
        final result = await flutterTts.speak(cleanedRemaining);
        if (result != 1) {
          print("TTS: Failed to speak remaining part, result: $result");
        }
        await flutterTts.awaitSpeakCompletion(true);
      }
    } catch (e, stackTrace) {
      print("TTS: Exception during speak: $e");
      print("Stack trace: $stackTrace");
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}