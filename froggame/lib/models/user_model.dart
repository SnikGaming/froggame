class UserModel {
  String userId, email, name, pic;
  int? score;
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic,
      this.score});
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'score': score
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["userId"],
      email: json["email"],
      name: json["name"],
      pic: json["pic"],
      score: json["score"]);
}
