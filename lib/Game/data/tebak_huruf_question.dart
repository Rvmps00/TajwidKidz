import '../models/question_model.dart'; // Sesuaikan path jika berbeda

// Level 1
final List<HijaiyahQuestion> tebakHurufQuestions = [
  // 1. Ba
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ba",
    options: ["ن", "ب", "ت", "ث"], // Diacak dari ["ب", "ت", "ث", "ن"]
    correctAnswer: "ب",
    notes: "Keluar dari dua bibir dengan merapatkannya.",
    correctImagePath: "assets/images/hijaiyah/ba.png",
    audioPath: "ba_2.wav",
  ),
  // 2. Ta
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ta",
    options: ["ك", "ث", "ت", "ب"], // Diacak dari ["ت", "ب", "ث", "ك"]
    correctAnswer: "ت",
    notes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    correctImagePath: "assets/images/hijaiyah/ta.png",
    audioPath: "ta_3.wav",
  ),
  // 3. Tsa
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "tsa",
    options: ["س", "ث", "ش", "ت"], // Diacak dari ["ث", "ت", "س", "ش"]
    correctAnswer: "ث",
    notes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    correctImagePath: "assets/images/hijaiyah/tsa.png",
    audioPath: "tsa_4.wav",
  ),
  // 4. Jim
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "jim",
    options: ["ي", "ج", "ح", "خ"], // Diacak dari ["ج", "ح", "خ", "ي"]
    correctAnswer: "ج",
    notes: "Keluar dari tengah lidah bersama dengan langit langit atas.",
    correctImagePath: "assets/images/hijaiyah/jim.png",
    audioPath: "jim_5.wav",
  ),
  // 5. Kha
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "kha",
    options: ["ق", "خ", "ح", "ج"], // Diacak dari ["خ", "ح", "ج", "ق"]
    correctAnswer: "خ",
    notes: "Keluar dari tenggorokan atas.",
    correctImagePath: "assets/images/hijaiyah/kha.png",
    audioPath: "kha_6.wav",
  ),
  // 6. Dal
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "dal",
    options: ["ز", "د", "ذ", "ر"], // Diacak dari ["د", "ذ", "ر", "ز"]
    correctAnswer: "د",
    notes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    correctImagePath: "assets/images/hijaiyah/dal.png",
    audioPath: "dal_7.wav",
  ),
  // 7. Zai
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "zai",
    options: ["ض", "ز", "ر", "ذ"], // Diacak dari ["ز", "ر", "ذ", "ض"]
    correctAnswer: "ز",
    notes: "Terletak pada akhir ujung lidah yang bertemu dengan dinding bagian dalam dari gigi seri bawah.",
    correctImagePath: "assets/images/hijaiyah/zai.png",
    audioPath: "za_10.wav",
  ),
  // 8. Sin
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "sin",
    options: ["ص", "س", "ش", "ث"], // Diacak dari ["س", "ص", "ش", "ث"]
    correctAnswer: "س",
    notes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    correctImagePath: "assets/images/hijaiyah/sin.png",
    audioPath: "sin_11.wav",
  ),
  // 9. Qof
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "qof",
    options: ["ف", "ق", "ك", "غ"], // Diacak dari ["ق", "ك", "غ", "ف"]
    correctAnswer: "ق",
    notes: "Keluar dari pangkal lidah menyentuh langit langit atas bagian daging.",
    correctImagePath: "assets/images/hijaiyah/qof.png",
    audioPath: "qaf_20.wav",
  ),
  // 10. Nun
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "nun",
    options: ["و", "ن", "م", "ل"], // Diacak dari ["ن", "م", "ل", "و"]
    correctAnswer: "ن",
    notes: "Keluar dari dua tepi ujung lidah menyentuh ujung langit langit atas.",
    correctImagePath: "assets/images/hijaiyah/nun.png",
    audioPath: "nun_23.wav",
  ),
  // 11. Huruf: ر
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ر",
    options: ["dzal", "ro", "za", "dal"], // Diacak dari ["ro", "za", "dal", "dzal"]
    correctAnswer: "ro",
    notes: "Terletak pada ujung lidah yang bertemu dengan apa yang sejajar dengannya dari gusi gigi atas sedikit masuk ke punggung lidah dekat dengan makhraj huruf nun.",
    correctImagePath: "assets/images/hijaiyah/ro.png",
    audioPath: "ra_9.wav",
  ),
  // 12. Huruf: ح
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ح",
    options: ["ain", "ha", "kha", "ja"], // Diacak dari ["ha", "kha", "ja", "ain"]
    correctAnswer: "ha",
    notes: "Terletak pada tengah tenggorokan.",
    correctImagePath: "assets/images/hijaiyah/ha.png",
    audioPath: "ha_6.wav",
  ),
  // 13. Huruf: ذ
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ذ",
    options: ["tho", "dza", "za", "dal"], // Diacak dari ["dza", "za", "dal", "tho"]
    correctAnswer: "dza",
    notes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    correctImagePath: "assets/images/hijaiyah/dza.png",
    audioPath: "dzal_8.wav",
  ),
  // 14. Huruf: ش
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ش",
    options: ["ja", "sha", "sa", "za"], // Diacak dari ["sa", "sha", "za", "ja"]
    correctAnswer: "sha",
    notes: "Keluar dari tengah lidah bersama langit langit atas.",
    correctImagePath: "assets/images/hijaiyah/sha.png",
    audioPath: "syin_12.wav",
  ),
  // 15. Huruf: ص
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ص",
    options: ["tsa", "shad", "sad", "sin"], // Diacak dari ["shad", "sad", "sin", "tsa"]
    correctAnswer: "shad",
    notes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    correctImagePath: "assets/images/hijaiyah/shad.png",
    audioPath: "shad_13.wav",
  ),
  // 16. Huruf: ك
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ك",
    options: ["kha", "kaf", "qaf", "fa"], // Diacak dari ["kaf", "qaf", "fa", "kha"]
    correctAnswer: "kaf",
    notes: "Keluar dari pangkal lidah menyentuh langit langit atas bagian daging.",
    correctImagePath: "assets/images/hijaiyah/kaf.png",
    audioPath: "kaf_21.wav",
  ),
  // 17. Huruf: ف
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    wordEngine: "ف",
    options: ["tsa", "fa", "qaf", "kaf"], // Diacak dari ["fa", "qaf", "kaf", "tsa"]
    correctAnswer: "fa",
    notes: "Terletak pada pertemuan antara ujung gigi seri atas yang bertemu dengan perut bibir bawah.",
    correctImagePath: "assets/images/hijaiyah/fa.png",
    audioPath: "fa_19.wav",
  ),
  // 18. Huruf: م
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "م",
    options: ["ain", "mim", "nun", "lam"], // Diacak dari ["mim", "nun", "lam", "ain"]
    correctAnswer: "mim",
    notes: "Terletak pada pertemuan antara 2 bibir yang disertai dengan ghunnah.",
    correctImagePath: "assets/images/hijaiyah/mim.png",
    audioPath: "mim_22.wav",
  ),
  // 19. Huruf: ي
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "ي",
    options: ["tha", "ya", "ta", "ba"], // Diacak dari ["ya", "ta", "ba", "tha"]
    correctAnswer: "ya",
    notes: "Keluar dari tengah lidah bersama langit langit atas.",
    correctImagePath: "assets/images/hijaiyah/ya.png",
    audioPath: "ya_28.wav",
  ),
  // 20. Huruf: غ
  HijaiyahQuestion(
    text: 'Pilih huruf hijaiyah\ndari bacaan:',
    word: "غ",
    options: ["qaf", "ghain", "ain", "ha"], // Diacak dari ["ghain", "ain", "ha", "qaf"]
    correctAnswer: "ghain",
    notes: "Terletak pada atas tenggorokan.",
    correctImagePath: "assets/images/hijaiyah/ghain.png",
    audioPath: "ghain_18.wav",
  ),
];

// Level 2
final List<HijaiyahQuestion2> tebakHurufQuestions2 = [
  // 1. Huruf "ج"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ج",
    options: ["tsa", "ja", "kha", "ha"], // Diacak dari ["kha", "ja", "ha", "tsa"]
    correctAnswer: "ja",
    feedbackImagePath: "assets/images/hijaiyah/jim.png",
    feedbackNotes: "Keluar dari tengah lidah bersama dengan langit-langit atas.",
    optionsAudioPath: ["tsa_4.wav", "jim_5.wav", "kha_6.wav", "ha_6.wav"], // Diacak sesuai options
  ),
  // 2. Huruf "ص"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ص",
    options: ["ro", "shad", "sin", "tha"], // Diacak dari ["sin", "shad", "tha", "ro"]
    correctAnswer: "shad",
    feedbackImagePath: "assets/images/hijaiyah/shad.png",
    feedbackNotes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    optionsAudioPath: ["ra_9.wav", "shad_13.wav", "sin_11.wav", "tha_15.wav"], // Diacak sesuai options
  ),
  // 3. Huruf "خ"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "خ",
    options: ["qaf", "kha", "ha", "ain"], // Diacak dari ["kha", "ha", "ain", "qaf"]
    correctAnswer: "kha",
    feedbackImagePath: "assets/images/hijaiyah/kha.png",
    feedbackNotes: "Keluar dari tenggorokan atas.",
    optionsAudioPath: ["qaf_20.wav", "kha_6.wav", "ha_6.wav", "ain_17.wav"], // Diacak sesuai options
  ),
  // 4. Huruf "ث"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ث",
    options: ["sa", "tsa", "ta", "dza"], // Diacak dari ["ta", "tsa", "dza", "sa"]
    correctAnswer: "tsa",
    feedbackImagePath: "assets/images/hijaiyah/tsa.png",
    feedbackNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    optionsAudioPath: ["sin_11.wav", "tsa_4.wav", "ta_3.wav", "dzal_8.wav"], // Diacak sesuai options
  ),
  // 5. Huruf "ذ"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ذ",
    options: ["tho", "dza", "za", "da"], // Diacak dari ["za", "da", "dza", "tho"]
    correctAnswer: "dza",
    feedbackImagePath: "assets/images/hijaiyah/dza.png",
    feedbackNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    optionsAudioPath: ["tha_15.wav", "dzal_8.wav", "za_10.wav", "dal_7.wav"], // Diacak sesuai options
  ),
  // 6. Huruf "ض"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ض",
    options: ["ro", "dhod", "tho", "shad"], // Diacak dari ["tho", "shad", "dhod", "ro"]
    correctAnswer: "dhod",
    feedbackImagePath: "assets/images/hijaiyah/dhod.png",
    feedbackNotes: "Keluar dari dua sisi lidah atau salah satunya menyentuh dinding bagian dalam gigi geraham atas.",
    optionsAudioPath: ["ra_9.wav", "dhad_14.wav", "tha_15.wav", "shad_13.wav"], // Diacak sesuai options
  ),
  // 7. Huruf "ع"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ع",
    options: ["ya", "ain", "ghain", "ha"], // Diacak dari ["ain", "ghain", "ha", "ya"]
    correctAnswer: "ain",
    feedbackImagePath: "assets/images/hijaiyah/ain.png",
    feedbackNotes: "Terletak pada tengah-tengah tenggorokan.",
    optionsAudioPath: ["ya_28.wav", "ain_17.wav", "ghain_18.wav", "ha_6.wav"], // Diacak sesuai options
  ),
  // 8. Huruf "غ"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "غ",
    options: ["qaf", "ghain", "ain", "kha"], // Diacak dari ["ain", "ghain", "kha", "qaf"]
    correctAnswer: "ghain",
    feedbackImagePath: "assets/images/hijaiyah/ghain.png",
    feedbackNotes: "Terletak pada atas tenggorokan.",
    optionsAudioPath: ["qaf_20.wav", "ghain_18.wav", "ain_17.wav", "kha_6.wav"], // Diacak sesuai options
  ),
  // 9. Huruf "ق"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ق",
    options: ["kha", "qof", "kaf", "fa"], // Diacak dari ["kaf", "qof", "fa", "kha"]
    correctAnswer: "qof",
    feedbackImagePath: "assets/images/hijaiyah/qof.png",
    feedbackNotes: "Keluar dari pangkal lidah menyentuh langit-langit atas bagian daging.",
    optionsAudioPath: ["kha_6.wav", "qaf_20.wav", "kaf_21.wav", "fa_19.wav"], // Diacak sesuai options
  ),
  // 10. Huruf "ر"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ر",
    options: ["dzho", "ra", "za", "dal"], // Diacak dari ["ra", "za", "dal", "dzho"]
    correctAnswer: "ra",
    feedbackImagePath: "assets/images/hijaiyah/ro.png",
    feedbackNotes: "Terletak pada ujung lidah yang bertemu dengan apa yang sejajar dengannya dari gusi gigi atas sedikit masuk ke punggung lidah dekat dengan makhraj huruf nun.",
    optionsAudioPath: ["zha_16.wav", "ra_9.wav", "za_10.wav", "dal_7.wav"], // Diacak sesuai options
  ),
  // 11. Audio "fa"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ف",
    questionImagePath: "assets/images/hijaiyah/fa.png",
    questionNotes: "Terletak pada pertemuan antara ujung gigi seri atas yang bertemu dengan perut bibir bawah.",
    options: ["ت", "ف", "ق", "ك"], // Diacak dari ["ف", "ق", "ك", "ت"]
    correctAnswer: "ف",
    audioPath: "fa_19.wav",
  ),
  // 12. Audio "ba"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ب",
    questionImagePath: "assets/images/hijaiyah/ba.png",
    questionNotes: "Keluar dari dua bibir dengan merapatkannya.",
    options: ["ت", "ب", "م", "ن"], // Diacak dari ["ب", "م", "ن", "ت"]
    correctAnswer: "ب",
    audioPath: "ba_2.wav",
  ),
  // 13. Audio "kha"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "خ",
    questionImagePath: "assets/images/hijaiyah/kha.png",
    questionNotes: "Keluar dari tenggorokan atas.",
    options: ["ع", "خ", "ح", "غ"], // Diacak dari ["خ", "ح", "غ", "ع"]
    correctAnswer: "خ",
    audioPath: "kha_6.wav",
  ),
  // 14. Audio "qof"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ق",
    questionImagePath: "assets/images/hijaiyah/qof.png",
    questionNotes: "Keluar dari pangkal lidah menyentuh langit-langit atas bagian daging.",
    options: ["ج", "ق", "ك", "ف"], // Diacak dari ["ق", "ك", "ف", "ج"]
    correctAnswer: "ق",
    audioPath: "qaf_20.wav",
  ),
  // 15. Audio "sha"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ش",
    questionImagePath: "assets/images/hijaiyah/sha.png",
    questionNotes: "Keluar dari tengah lidah bersama langit-langit atas.",
    options: ["ث", "ش", "س", "ص"], // Diacak dari ["ش", "س", "ص", "ث"]
    correctAnswer: "ش",
    audioPath: "syin_12.wav",
  ),
  // 16. Audio "'ain"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ع",
    questionImagePath: "assets/images/hijaiyah/ain.png",
    questionNotes: "Terletak pada tengah-tengah tenggorokan.",
    options: ["هـ", "ع", "غ", "ح"], // Diacak dari ["ع", "غ", "ح", "هـ"]
    correctAnswer: "ع",
    audioPath: "ain_17.wav",
  ),
  // 17. Audio "tsa"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ث",
    questionImagePath: "assets/images/hijaiyah/tsa.png",
    questionNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    options: ["س", "ث", "ت", "ذ"], // Diacak dari ["ث", "ت", "ذ", "س"]
    correctAnswer: "ث",
    audioPath: "tsa_4.wav",
  ),
  // 18. Audio "ja"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ج",
    questionImagePath: "assets/images/hijaiyah/jim.png",
    questionNotes: "Keluar dari tengah lidah bersama dengan langit-langit atas.",
    options: ["ذ", "ج", "ز", "ض"], // Diacak dari ["ج", "ز", "ض", "ذ"]
    correctAnswer: "ج",
    audioPath: "jim_5.wav",
  ),
  // 19. Audio "dhod"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ض",
    questionImagePath: "assets/images/hijaiyah/dhod.png",
    questionNotes: "Keluar dari dua sisi lidah atau salah satunya menyentuh dinding bagian dalam gigi geraham atas.",
    options: ["د", "ض", "ص", "ط"], // Diacak dari ["ض", "ص", "ط", "د"]
    correctAnswer: "ض",
    audioPath: "dhad_14.wav",
  ),
  // 20. Audio "dzho"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ظ",
    questionImagePath: "assets/images/hijaiyah/dzho.png",
    questionNotes: "Terletak pada ujung lidah yang bertemu dengan apa yang sejajar dengannya dari gusi gigi atas sedikit masuk ke punggung lidah dekat dengan makhraj huruf nun.",
    options: ["ض", "ظ", "ذ", "ز"], // Diacak dari ["ظ", "ذ", "ز", "ض"]
    correctAnswer: "ظ",
    audioPath: "zha_16.wav",
  ),
];

// Level 3
final List<HijaiyahQuestion2> tebakHurufQuestions3 = [
  // 1. Huruf "ذ"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ذ",
    options: ["dhod", "dza", "dzho", "za"], // Diacak dari ["dza", "dzho", "za", "dhod"]
    correctAnswer: "dza",
    feedbackImagePath: "assets/images/hijaiyah/dza.png",
    feedbackNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    optionsAudioPath: ["dhad_14.wav", "dzal_8.wav", "zha_16.wav", "za_10.wav"], // Diacak sesuai options
  ),
  // 2. Huruf "د"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "د",
    options: ["ta", "dal", "dzal", "dhod"], // Diacak dari ["dal", "dzal", "dhod", "ta"]
    correctAnswer: "dal",
    feedbackImagePath: "assets/images/hijaiyah/dal.png",
    feedbackNotes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    optionsAudioPath: ["ta_3.wav", "dal_7.wav", "dzal_8.wav", "dhad_14.wav"], // Diacak sesuai options
  ),
  // 3. Huruf "ح"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ح",
    options: ["ain", "ha", "haa", "kha"], // Diacak dari ["ha", "haa", "kha", "ain"]
    correctAnswer: "ha",
    feedbackImagePath: "assets/images/hijaiyah/ha.png",
    feedbackNotes: "Terletak pada tengah tenggorokan.",
    optionsAudioPath: ["ain_17.wav", "ha_6.wav", "ha`_25.wav", "kha_6.wav"], // Diacak sesuai options
  ),
  // 4. Huruf "ظ"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ظ",
    options: ["za", "dzho", "dza", "dhod"], // Diacak dari ["dzho", "dza", "dhod", "za"]
    correctAnswer: "dzho",
    feedbackImagePath: "assets/images/hijaiyah/dzho.png",
    feedbackNotes: "Terletak pada ujung lidah yang bertemu dengan apa yang sejajar dengannya dari gusi gigi atas sedikit masuk ke punggung lidah dekat dengan makhraj huruf nun.",
    optionsAudioPath: ["za_10.wav", "zha_16.wav", "dzal_8.wav", "dhad_14.wav"], // Diacak sesuai options
  ),
  // 5. Huruf "س"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "س",
    options: ["sha", "sin", "shad", "tsa"], // Diacak dari ["sin", "shad", "tsa", "sha"]
    correctAnswer: "sin",
    feedbackImagePath: "assets/images/hijaiyah/sin.png",
    feedbackNotes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    optionsAudioPath: ["syin_12.wav", "sin_11.wav", "shad_13.wav", "tsa_4.wav"], // Diacak sesuai options
  ),
  // 6. Huruf "ص"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ص",
    options: ["tho", "shad", "sin", "dhod"], // Diacak dari ["shad", "sin", "dhod", "tho"]
    correctAnswer: "shad",
    feedbackImagePath: "assets/images/hijaiyah/shad.png",
    feedbackNotes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    optionsAudioPath: ["tha_15.wav", "shad_13.wav", "sin_11.wav", "dhad_14.wav"], // Diacak sesuai options
  ),
  // 7. Huruf "ض"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ض",
    options: ["tho", "dhod", "shad", "dzho"], // Diacak dari ["dhod", "shad", "dzho", "tho"]
    correctAnswer: "dhod",
    feedbackImagePath: "assets/images/hijaiyah/dhod.png",
    feedbackNotes: "Keluar dari dua sisi lidah atau salah satunya menyentuh dinding bagian dalam gigi geraham atas.",
    optionsAudioPath: ["tha_15.wav", "dhad_14.wav", "shad_13.wav", "zha_16.wav"], // Diacak sesuai options
  ),
  // 8. Huruf "ث"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ث",
    options: ["sha", "tsa", "ta", "sin"], // Diacak dari ["tsa", "ta", "sin", "sha"]
    correctAnswer: "tsa",
    feedbackImagePath: "assets/images/hijaiyah/tsa.png",
    feedbackNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    optionsAudioPath: ["syin_12.wav", "tsa_4.wav", "ta_3.wav", "sin_11.wav"], // Diacak sesuai options
  ),
  // 9. Huruf "ت"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ت",
    options: ["dal", "ta", "tho", "tsa"], // Diacak dari ["ta", "tho", "tsa", "dal"]
    correctAnswer: "ta",
    feedbackImagePath: "assets/images/hijaiyah/ta.png",
    feedbackNotes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    optionsAudioPath: ["dal_7.wav", "ta_3.wav", "tha_15.wav", "tsa_4.wav"], // Diacak sesuai options
  ),
  // 10. Huruf "ز"
  HijaiyahQuestion2(
    type: QuestionType.listenAndChooseText,
    text: "Perhatikan huruf berikut, lalu pilih audio pelafalan yang benar:",
    questionWord: "ز",
    options: ["dzho", "zai", "dzal", "dhod"], // Diacak dari ["zai", "dzal", "dhod", "dzho"]
    correctAnswer: "zai",
    feedbackImagePath: "assets/images/hijaiyah/zai.png",
    feedbackNotes: "Terletak pada akhir ujung lidah yang bertemu dengan dinding bagian dalam dari gigi seri bawah.",
    optionsAudioPath: ["zha_16.wav", "za_10.wav", "dzal_8.wav", "dhad_14.wav"], // Diacak sesuai options
  ),
  // 11. Audio "dza"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "dza",
    questionImagePath: "assets/images/hijaiyah/dza.png",
    questionNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    options: ["ض", "ذ", "د", "ز"], // Diacak dari ["ذ", "د", "ز", "ض"]
    correctAnswer: "ذ",
    audioPath: "dzal_8.wav",
  ),
  // 12. Audio "tha"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "tha",
    questionImagePath: "assets/images/hijaiyah/tha.png",
    questionNotes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    options: ["ض", "ط", "ت", "ث"], // Diacak dari ["ط", "ت", "ث", "ض"]
    correctAnswer: "ط",
    audioPath: "tha_15.wav",
  ),
  // 13. Audio "shad"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "shad",
    questionImagePath: "assets/images/hijaiyah/shad.png",
    questionNotes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    options: ["ط", "ص", "س", "ض"], // Diacak dari ["ص", "س", "ض", "ط"]
    correctAnswer: "ص",
    audioPath: "shad_13.wav",
  ),
  // 14. Audio "tsa"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "tsa",
    questionImagePath: "assets/images/hijaiyah/tsa.png",
    questionNotes: "Keluar dari dua tepi ujung lidah dari arah permukaan atasnya menyentuh ujung dua gigi seri atas.",
    options: ["ت", "ث", "س", "ش"], // Diacak dari ["ث", "س", "ش", "ت"]
    correctAnswer: "ث",
    audioPath: "tsa_4.wav",
  ),
  // 15. Audio "zai"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "zai",
    questionImagePath: "assets/images/hijaiyah/zai.png",
    questionNotes: "Terletak pada akhir ujung lidah yang bertemu dengan dinding bagian dalam dari gigi seri bawah.",
    options: ["ر", "ز", "ذ", "ض"], // Diacak dari ["ز", "ذ", "ض", "ر"]
    correctAnswer: "ز",
    audioPath: "za_10.wav",
  ),
  // 16. Audio "dzho"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "dzho",
    questionImagePath: "assets/images/hijaiyah/dzho.png",
    questionNotes: "Terletak pada ujung lidah yang bertemu dengan apa yang sejajar dengannya dari gusi gigi atas sedikit masuk ke punggung lidah dekat dengan makhraj huruf nun.",
    options: ["ز", "ظ", "ض", "ذ"], // Diacak dari ["ظ", "ض", "ذ", "ز"]
    correctAnswer: "ظ",
    audioPath: "zha_16.wav",
  ),
  // 17. Audio "dal"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "dal",
    questionImagePath: "assets/images/hijaiyah/dal.png",
    questionNotes: "Keluar dari punggung ujung lidah menyentuh pangkal dua gigi seri atas.",
    options: ["ط", "د", "ذ", "ر"], // Diacak dari ["د", "ذ", "ر", "ط"]
    correctAnswer: "د",
    audioPath: "dal_7.wav",
  ),
  // 18. Audio "ha"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "ha",
    questionImagePath: "assets/images/hijaiyah/ha.png",
    questionNotes: "Terletak pada tengah tenggorokan.",
    options: ["ع", "ح", "ه", "خ"], // Diacak dari ["ح", "ه", "خ", "ع"]
    correctAnswer: "ح",
    audioPath: "ha_6.wav",
  ),
  // 19. Audio "dhod"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "dhod",
    questionImagePath: "assets/images/hijaiyah/dhod.png",
    questionNotes: "Keluar dari dua sisi lidah atau salah satunya menyentuh dinding bagian dalam gigi geraham atas.",
    options: ["د", "ض", "ص", "ظ"], // Diacak dari ["ض", "ص", "ظ", "د"]
    correctAnswer: "ض",
    audioPath: "dhad_14.wav",
  ),
  // 20. Audio "sin"
  HijaiyahQuestion2(
    type: QuestionType.seeAndChooseAudio,
    text: "Dengarkan audio, lihat gambar & catatan, lalu pilih huruf yang benar:",
    questionWord: "sin",
    questionImagePath: "assets/images/hijaiyah/sin.png",
    questionNotes: "Keluar dari ujung lidah diletakkan pada dinding bagian dalam dua gigi seri bawah sehingga suara keluar melalui celah antara gigi atas dan bawah.",
    options: ["ث", "س", "ش", "ص"], // Diacak dari ["س", "ش", "ص", "ث"]
    correctAnswer: "س",
    audioPath: "sin_11.wav",
  ),
];
