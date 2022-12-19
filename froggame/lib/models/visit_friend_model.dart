import 'package:froggame/models/category_model.dart';
import 'package:froggame/models/packege_questions_model.dart';

class FriendInfo {
  final String avatar;
  final String name;
  final String iduser;
  final List<Category> lstCat;
  final int score;

  FriendInfo(
      {required this.avatar,
      required this.name,
      required this.iduser,
      required this.lstCat,
      required this.score});
}
