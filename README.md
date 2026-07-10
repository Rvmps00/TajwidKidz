# TajwidKidz

TajwidKidz is a Flutter-based mobile application designed to help children learn Tajwid rules through gamified lessons, interactive exercises, and voice-based feedback. The app combines structured learning modules, mini games, progress tracking, and community-style motivation to make Tajwid practice engaging and accessible for young learners.

## Key Features

- **Gamified Tajwid Learning**: Structured levels teach Hijaiyah letters, Harakat (vowel marks), Babibu syllables, Tajwid rules, Surah reading, and Gharib pronunciations.
- **Mini Games**: Includes letter recognition, word arrangement, and Tajwid pronunciation games to reinforce learning with fun challenges.
- **Progress Tracking**: Students can monitor completed levels and game progress, with visual progress bars and score summaries.
- **Leaderboard**: A ranking system that encourages healthy competition and rewards students with points for completed games.
- **Voice Practice**: Speech recognition is used in the Tajwid game module to evaluate pronunciation and help learners practice aloud.
- **Firebase Integration**: Uses Firebase Authentication, Firestore, Firebase Storage, and App Check for authentication, user profile data, audio storage, and secure app delivery.
- **Audio Support**: Built-in audio lessons and playback for letter pronunciation, Tajwid examples, and game prompts.
- **Profile and Feedback**: User account management and in-app feedback features to personalize learning progress.

## App Structure

The app is organized into several major sections:

- `lib/main.dart` — App entry point and Firebase initialization.
- `lib/homepage.dart` — Main dashboard with navigation to learning, mini games, progress, and leaderboard.
- `lib/learning.dart` — Learning modules and lesson level navigation.
- `lib/Game/view/minigame.dart` — Main mini game dashboard with score overview.
- `lib/Game/viewmodel/game_tajwid_viewmodel.dart` — Voice recognition and Tajwid game logic.
- `lib/leaderboard.dart` — Leaderboard display and score ranking.
- `lib/account/` — User profile, edit profile, and feedback pages.
- `pubspec.yaml` — Dependencies, assets, and Flutter configuration.

## Supported Learning Modules

- Level 1: Mengenal Huruf Hijaiyah
- Level 2: Mengenal Harakat
- Level 3: Huruf Hijaiyah (Ba Bi Bu)
- Level 4: Mengenal Tajwid
- Level 5: Membaca Surah dengan Tajwid
- Level 6: Mengenal Gharib
- Level 7: Latihan Pengucapan dengan Hukum Tajwid

## Gamified Experience

The app is intentionally crafted for children by using:

- colorful UI cards and playful icons
- progress bars and completion badges
- interactive mini games to make practice feel like play
- ranking and trophies on the leaderboard
- audio cues and immediate feedback for voice exercises

## Installation

### Prerequisites

- Flutter SDK installed
- Android Studio or Xcode installed for mobile emulators/devices
- A connected Android/iOS device or emulator

### Run the App

1. Open the project root in a terminal.
2. Install dependencies:

```bash
flutter pub get
```

3. Run the app on a connected device or emulator:

```bash
flutter run
```

## Firebase Configuration

This project uses Firebase services, so you must set up your own Firebase project and download the required configuration files:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

Make sure Firebase Authentication, Firestore, Firebase Storage, and App Check are enabled in your Firebase console.

## Assets

The app includes image and audio assets under:

- `assets/images/`
- `assets/audios/`

These assets support the learning content, game illustrations, and pronunciation cues.

## Notes

- Keep the asset paths defined in `pubspec.yaml` aligned with the files stored in the project.
- The app is built for Flutter 3.x and Dart 3.x compatibility in mind.
- Review the site-specific modules within `lib/modul1hijaiyah/`, `lib/Modul2harakat/`, `lib/Modul3_babibu/`, `lib/Modul4_MacamTajwid/`, `lib/Modul5_SurahTajwid/`, `lib/Modul6gharib/`, and `lib/modul7huruftajwid/` for lesson implementations.

## License

This repository is intended for educational and development use. Update the license information as needed.
