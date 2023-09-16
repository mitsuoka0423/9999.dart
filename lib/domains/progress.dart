class Progress {
  final String userId; // 進行状況に関連するユーザーのID
  final int number; // 対象となる数字（11〜19）
  final int correctCount; // 正解した回数
  final int incorrectCount; // 不正解だった回数
  final bool lastAttemptWasCorrect; // 最後の回答が正解だったかのフラグ

  Progress({
    required this.userId,
    required this.number,
    required this.correctCount,
    required this.incorrectCount,
    required this.lastAttemptWasCorrect,
  });
}
