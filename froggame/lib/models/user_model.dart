class UserModel {
  String userId, email, name, pic;
  String? nameIg, avatar;
  int? score, heart;
  String? age;
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic,
      this.heart,
      this.score,
      this.nameIg,
      this.avatar,
      this.age});
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'heart': heart,
      'score': score,
      'nameIg': nameIg,
      'avatar': avatar,
      'age': age
    };
  }

  // static UserModel fromJson(Map<String, dynamic> json) => UserModel(
  //     userId: json["userId"],
  //     email: json["email"],
  //     name: json["name"],
  //     pic: json["pic"],
  //     heart: json["heart"],
  //     score: json["score"]);
}
