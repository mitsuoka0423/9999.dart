class User {
  final String userId; // ユーザーの一意識別子
  final String authProvider; // ログイン方法（GoogleやLINE）
  final String displayName; // ユーザーの表示名

  User({
    required this.userId,
    required this.authProvider,
    required this.displayName,
  });
}
