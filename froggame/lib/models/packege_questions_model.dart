class PackageQuestionModel {
  String idUser, idgoi;
  int idch, idlv, timer;

  PackageQuestionModel(
      {required this.idUser,
      required this.idgoi,
      required this.idch,
      required this.idlv,
      required this.timer});

  toJson() {
    return {
      // ignore: unnecessary_this
      'idUser': idUser,
      // ignore: unnecessary_this
      'idch': idch,
      // ignore: unnecessary_this
      'idlv': idlv,
      // ignore: unnecessary_this
      'timer': timer,
      'idgoi': idgoi
    };
  }

  static PackageQuestionModel fromJson(Map<String, dynamic> json) =>
      PackageQuestionModel(
        idgoi: json['idgoi'],
        idUser: json["idUser"],
        idch: json["idch"],
        idlv: json["idlv"],
        timer: json["timer"],
      );
}
