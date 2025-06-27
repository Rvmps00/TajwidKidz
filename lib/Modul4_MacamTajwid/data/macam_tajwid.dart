import 'package:TajwidKidz/Modul4_MacamTajwid/models/tajwid_model.dart';

final List<TajwidModel> susunHurufQuestions = [
  TajwidModel(
    number: "1",
    title: "Izhar Halqi",
    otherTitle: "(Dibaca Jelas)",
    influentialLetter: "ء ,ﻩ , ع, ح, غ, خ",
    howToRead: "Nun sukun atau tanwin dibaca jelas tanpa dengung.",
    exampleWord: [
      ['Nun sukun (ن) bertemu dengan huruf Ya (ي)', 'Nun sukun (ن) bertemu dengan huruf Ha (ه)', 'Nun sukun (ن) bertemu dengan huruf Ghoin (غ )']
    ],
    exampleImage: [
      ['assets/images/contoh_izhar_1.png', 'assets/images/contoh_izhar_2.png', 'assets/images/contoh_izhar_3.png']
    ],
  ),
  TajwidModel(
    number: "2",
    title: "Idgham Bighunnah",
    otherTitle: "(Dimasukkan Dengan Dengung)",
    influentialLetter: "ي, و, م, ن",
    howToRead:
        "Apabila ada nun sukun atau tanwin bertemu dengan salah satu huruf ي, و, م, ن, maka dibaca dengan dengung.",
    exampleWord: [
      ['Nun sukun (ن) bertemu dengan huruf Ya (ي)', 'Nun sukun (ن) bertemu dengan huruf Wa (و)', 'Kasrah tanwin (ـ ) bertemu dengan huruf Wa (و)']
    ],
    exampleImage: [
      ['assets/images/contoh_idgham_bighunnah_1.png', 'assets/images/contoh_idgham_bighunnah_2.png', 'assets/images/contoh_idgham_bighunnah_3.png']
    ],
  ),
  TajwidModel(
    number: "3",
    title: "Idgham Bilaghunnah",
    otherTitle: "(Dimasukkan Tanpa Dengung)",
    influentialLetter: "ل, ر",
    howToRead:
        "Nun sukun atau tanwin yang bertemu dengan huruf lam (ل) atau ra (ر) dibaca lebur tanpa dengung.",
    exampleWord: [
      [': nun sukun (ن) bertemu dengan huruf Lam (ل)', ': nun sukun (ن) bertemu dengan huruf Ro (ر)', ': nun sukun (ن) bertemu dengan huruf Lam (ل)']
    ],
    exampleImage: [
      ['assets/images/contoh_idgham_bilaghunnah_1.png', 'assets/images/contoh_idgham_bilaghunnah_2.png', 'assets/images/contoh_idgham_bilaghunnah_3.png']
    ],
  ),
  TajwidModel(
    number: "4",
    title: "Ikhfa Haqiqi",
    otherTitle: "(Dibaca Samar dengan Dengung)",
    influentialLetter: "ت, ث, ج, د, ذ, ز, س, ش, ص, ض, ط, ظ, ف, ق, ك",
    howToRead:
        "Apabila ada nun sukun atau tanwin bertemu dengan salah satu huruf tersebut maka dibaca samar dengan dengung",
    exampleWord: [
      [': nun sukun (ن) bertemu dengan huruf Ta (ت)', ': nun sukun (ن) bertemu dengan huruf Tsa (ث)', ': nun sukun (ن) bertemu dengan huruf Jim(ج)']
    ],
    exampleImage: [
      ['assets/images/contoh_ikhfa_haqiqi_1.png', 'assets/images/contoh_ikhfa_haqiqi_2.png', 'assets/images/contoh_ikhfa_haqiqi_3.png']
    ],
  ),
  TajwidModel(
    number: "5",
    title: "Iqlab",
    otherTitle: "(Dibaca dengan Dengung dan Berubah Jadi Mim)",
    influentialLetter:
        "ب",
    howToRead:
        "Apabila ada nun sukun atau tanwin bertemu dengan huruf Ba (ب), maka berubah menjadi mim dengan dengung",
    exampleWord: [
      [': nun sukun (ن) bertemu dengan huruf Ba (ب)', ': nun sukun (ن) bertemu dengan huruf Ba (ب)', ': nun sukun (ن) bertemu dengan huruf Ba (ب)']
    ],
    exampleImage: [
      ['assets/images/contoh_iqlab_1.png', 'assets/images/contoh_iqlab_2.png', 'assets/images/contoh_iqlab_3.png']
    ],
  ),
  TajwidModel(
    number: "6",
    title: "Ikhfa Syafawi",
    otherTitle: "",
    influentialLetter: "ب",
    howToRead:
        "Apabila ada mim sukun (مْ) bertemu dengan huruf Ba (ب), maka dibaca samar dengan dengung",
    exampleWord: [
      ['mim sukun (م) bertemu dengan huruf Ba (ب)', 'mim sukun (مْ) bertemu dengan huruf Ba (ب)', 'mim sukun (مْ) bertemu dengan huruf Ba (ب)']
    ],
    exampleImage: [
      ['assets/images/contoh_ikhfa_syafawi_1.png', 'assets/images/contoh_ikhfa_syafawi_2.png', 'assets/images/contoh_ikhfa_syafawi_3.png']
    ],
  ),
  TajwidModel(
    number: "7",
    title: "Idhgam Mimi",
    otherTitle: "",
    influentialLetter: "م",
    howToRead:
        "Apabila ada mim sukun (مْ) bertemu dengan huruf Mim (م), maka dibaca dengan dengung",
    exampleWord: [
      [': mim sukun (مْ) bertemu dengan huruf mim (م)', ': mim sukun (مْ) bertemu dengan huruf mim (م)', ': mim sukun (مْ) bertemu dengan huruf mim (م)']
    ],
    exampleImage: [
      ['assets/images/contoh_idhgam_mini_1.png', 'assets/images/contoh_idhgam_mini_2.png', 'assets/images/contoh_idhgam_mini_3.png']
    ],
  ),
  TajwidModel(
    number: "8",
    title: "Izhar Syafawi",
    otherTitle: "",
    influentialLetter: "Semua huruf kecuali م dan ب",
    howToRead:
        "Apabila ada mim sukun (مْ) bertemu dengan selain huruf م dan ب maka mim sukun dibaca dengan jelas tanpa dengung",
    exampleWord: [
      [': mim sukun (مْ) bertemu dengan huruf Qaf (ق)', ': mim sukun (مْ) bertemu dengan huruf Fa (ف)', ': mim sukun (مْ) bertemu dengan huruf Ta (ت)']
    ],
    exampleImage: [
      ['assets/images/contoh_izhar_syafawi_1.png', 'assets/images/contoh_izhar_syafawi_2.png', 'assets/images/contoh_izhar_syafawi_3.png']
    ],
  ),
  TajwidModel(
    number: "9",
    title: "Mad Thabi’i",
    otherTitle: "(Bacaan Panjang 2 Harakat)",
    influentialLetter: "ا, و, ي",
    howToRead:
        "hukum bacaan dalam ilmu tajwid yangterjadi ketika ada huruf alif (ا) setelah harakat fathah, huruf ya sukun (ْي) setelah harakat kasrah, dan huruf wau sukun (و) setelah harakat dammah Panjang bacaan 2 harakat",
    exampleWord: [
      [': Huruf alif (ا) didahului fathah', ': Huruf ya sukun (ي) didahului kasrah', ': Huruf wawu sukun (و) didahului dhommah']
    ],
    exampleImage: [
      ['assets/images/contoh_mad_thobii_1.png', 'assets/images/contoh_mad_thobii_2.png', 'assets/images/contoh_mad_thobii_3.png']
    ],
  ),
  TajwidModel(
    number: "10",
    title: "Mad Wajib Muttasil",
    otherTitle: "(Bacaan Panjang 4-5 Harakat)",
    influentialLetter: "Jenis mad yang terjadi ketika huruf mad thabi'i (alif, ya, atau wawu yang berharakat) bertemu dengan huruf hamzah dalam satu kata.",
    howToRead:
        "Panjang bacaan 4-5 harakat",
    exampleWord: [
      [': mad thabi’i Wa sukun (و) bertemu dengan huruf hamzah (ء)', ': mad thabi’i Alif (ا) bertemu dengan huruf hamzah (ء)', '​: mad thabi’i Ya sukun (ي) bertemu dengan huruf hamzah (ء)']
    ],
    exampleImage: [
      ['assets/images/contoh_mad_wajib_mutt_1.png', 'assets/images/contoh_mad_wajib_mutt_2.png', 'assets/images/contoh_mad_wajib_mutt_3.png']
    ],
  ),
  TajwidModel(
    number: "11",
    title: "Mad Jaiz Munfasil",
    otherTitle: "(Bacaan Panjang 4-5 Harakat)",
    influentialLetter: "Hukum bacaan yang terjadi ketika mad thabi'i bertemu dengan hamzah, namun hamzah tersebut berada di kata berikutnya (tidak dalam satu kata)",
    howToRead:
        "Panjang bacaan 4-5 harakat",
    exampleWord: [
      [': mad thabi’i Alif (ا) bertemu dengan huruf hamzah (ء)', ': mad thabi’i Wa sukun (و) bertemu dengan huruf hamzah (ء)', '​: mad thabi’i Ya sukun ( ْي) bertemu dengan huruf hamzah (ء)']
    ],
    exampleImage: [
      ['assets/images/contoh_mad_jaiz_1.png', 'assets/images/contoh_mad_jaiz_2.png', 'assets/images/contoh_mad_jaiz_3.png']
    ],
  ),
  TajwidModel(
    number: "12",
    title: "Mad Lazim Kalimi Muthaqqal",
    otherTitle: "(Bacaan Panjang 4-5 Harakat)",
    influentialLetter:
        "Mad bertemu huruf bertasydid dalam satu kata",
    howToRead:
        "Panjang bacaan 6 harakat",
    exampleWord: [
      [': mad Alif (ا) bertemu dengan harakat tasydid ', ': mad Alif (ا) bertemu dengan harakat tasydid ', ': mad Alif (ا) bertemu dengan harakat tasydid ']
    ],
    exampleImage: [
      ['assets/images/contoh_mad_lazim_1.png', 'assets/images/contoh_mad_lazim_2.png', 'assets/images/contoh_mad_lazim_3.png']
    ],
  ),
  TajwidModel(
    number: "13",
    title: "Qalqalah",
    otherTitle: "(Getaran Suara pada Huruf Qalqalah)",
    influentialLetter: "ب, ج, د, ط, ق",
    howToRead: "Huruf qalqalah dibaca dengan pantulan suara",
    exampleWord: [
      ['Qalqalah Sughra (Pantulan ringan)'], // Sub-judul untuk Qalqalah Sugra
      [': Huruf Ba (ب) dengan pantulan ringan', ':Huruf Jim ( ج ) dengan pantulan ringan', ': Huruf Dal (د) dengan pantulan ringan'], // Contoh Qalqalah Sugra
      ['Qalqalah Kubra (Pantulan Kuat, saat Waqaf)'], // Sub-judul untuk Qalqalah Kubra
      [': Huruf Ba (ب) dengan pantulan kuat', ': Huruf Ba (ب) dengan pantulan kuat', ': Huruf Qaf (ق) dengan pantulan kuat'], // Contoh Qalqalah Kubra
    ],
    exampleImage: [
      [''], // Kosong untuk sub-judul
      ['assets/images/contoh_qalqalah_sugra_1.png', 'assets/images/contoh_qalqalah_sugra_2.png', 'assets/images/contoh_qalqalah_sugra_3.png'],
      [''], // Kosong untuk sub-judul
      ['assets/images/contoh_qalqalah_kubra_1.png', 'assets/images/contoh_qalqalah_kubra_2.png', 'assets/images/contoh_qalqalah_kubra_3.png'],
    ],
  ),
  TajwidModel(
    number: "14",
    title: "Hukum Tafkhim dan Tarqiq pada Huruf Ra",
    otherTitle: "", // Kosong karena sudah ada di judul
    influentialLetter: "ر",
    howToRead: "Hukum bacaan huruf Ra (ر) terbagi menjadi dua, yaitu Tafkhim (tebal) dan Tarqiq (tipis).",
    exampleWord: [
      ['Tafkhim (Dibaca Tebal)'], // Sub-judul untuk Ra Tafkhim
      [': huruf رَ Fathah', ': huruf رُ Dhammah', ': huruf رَ Fathah'], // Contoh Ra Tafkhim
      ['Tarqiq (Dibaca Tipis)'], // Sub-judul untuk Ra Tarqiq
      ['Huruf ر kasrah', 'Huruf ر kasrah', 'Huruf ر kasrah'] // Contoh Ra Tarqiq
    ],
    exampleImage: [
      [''], // Kosong untuk sub-judul
      ['assets/images/contoh_tafkhim_1.png', 'assets/images/contoh_tafkhim_2.png', 'assets/images/contoh_tafkhim_3.png'],
      [''], // Kosong untuk sub-judul
      ['assets/images/contoh_tarqiq_1.png', 'assets/images/contoh_tarqiq_2.png', 'assets/images/contoh_tarqiq_3.png']
    ],
  ),
  TajwidModel(
    number: "15",
    title: "Alif Lam Qomariyah",
    otherTitle: "",
    influentialLetter: "ا, ب, ج, ح, خ, ع, غ, فـ, قـ, كـ, م, ه, و, ي",
    howToRead:
        "Huruf Lam Qomariah dibaca jelas dan terang (tidak dilebur) dengan mengucapkan huruf Lam dengan jelas.",
    exampleWord: [
      [': Alif Lam (ال) bertemu dengan huruf ق', ': Alif Lam (ال) bertemu dengan huruf ب', ': Alif Lam (ال) bertemu dengan huruf ف']
    ], // Diubah
    exampleImage: [
      ['assets/images/contoh_alif_lam_qomariyah_1.png', 'assets/images/contoh_alif_lam_qomariyah_2.png', 'assets/images/contoh_alif_lam_qomariyah_3.png']
    ],
  ),
];