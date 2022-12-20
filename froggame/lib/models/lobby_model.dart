class LobbyModel {
  String id, user1, user2;
  String? user1status, user2status;
  LobbyModel({
    required this.id,
    required this.user1,
    required this.user2,
    required this.user1status,
    required this.user2status,
  });
  toJson() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
      'user1status': user1status,
      'user2status': user2status
    };
  }
}
