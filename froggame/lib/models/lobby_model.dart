class LobbyModel {
  String id, user1, user2;
  int? user1score, user2score;
  LobbyModel({
    required this.id,
    required this.user1,
    required this.user2,
    required this.user1score,
    required this.user2score,
  });
  toJson() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
      'user1status': user1score,
      'user2status': user2score,
    };
  }
}
