class FriendModel {
  String userId, email, name, pic, idfriend, friendname, tokenMessage;
  int status;
  FriendModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
    required this.idfriend,
    required this.friendname,
    required this.status,
    required this.tokenMessage,
  });
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'idfriend': idfriend,
      'friendname': friendname,
      'status': status,
      'tokenMessage': tokenMessage
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
