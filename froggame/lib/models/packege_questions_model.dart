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
      'idUser': this.idUser,
      'idch': this.idch,
      'idlv': this.idlv,
      'timer': this.timer,
      'idgoi': this.idgoi
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
