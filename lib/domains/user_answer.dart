class UserAnswer {
  final String answerId; // 回答の一意識別子
  final String userId; // 回答したユーザーのID
  final String questionId; // 回答に関連する問題のID
  final int userAnswer; // ユーザーの回答
  final bool isCorrect; // 正解/不正解のフラグ
  final DateTime timestamp; // 回答の日時

  UserAnswer({
    required this.answerId,
    required this.userId,
    required this.questionId,
    required this.userAnswer,
    required this.isCorrect,
    required this.timestamp,
  });
}
