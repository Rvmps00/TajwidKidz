class EvaluationResult {
  final double mad;
  final double ghunnah;
  final double ikhfa;

  EvaluationResult({
    required this.mad,
    required this.ghunnah,
    required this.ikhfa,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      mad: json['Mad'] ?? 0.0,
      ghunnah: json['Ghunnah'] ?? 0.0,
      ikhfa: json['Ikhfaa'] ?? 0.0,
    );
  }
}
