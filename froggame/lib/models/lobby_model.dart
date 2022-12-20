class LobbyModel {
  String id, user1, user2;
  LobbyModel({required this.id, required this.user1, required this.user2});
  toJson() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
    };
  }
}
