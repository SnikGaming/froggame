class UserModel {
  String userId, email, name, pic;
  int? score, heart;
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic,
      this.heart,
      this.score});
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'heart': heart,
      'score': score
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["userId"],
      email: json["email"],
      name: json["name"],
      pic: json["pic"],
      heart: json["heart"],
      score: json["score"]);
}
