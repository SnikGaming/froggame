
// ignore_for_file: file_names

import 'const_image.dart';

class TypeModel {
  String name, image;
  TypeModel({required this.name, required this.image});

  static List<TypeModel> listType = [
    TypeModel(name: "Khoa học", image: khoahoc1),
    TypeModel(name: "IT", image: it2),
    TypeModel(name: "Toán", image: math2),
    TypeModel(name: "Địa lí", image: diali),
    TypeModel(name: "Lịch sử", image: lichsu),

  ];
}
