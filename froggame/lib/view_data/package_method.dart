import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/firesore_packageQuestion.dart';
import 'package:froggame/view_data/user_pre.dart';

class PackageMethod {
  static String _idgoi = UserSimplePreferences.getUserId();
  static int idlv = 0, idch = 0, timer = 0;
  static String idUser = _idgoi;
  static String idgoi = _idgoi;
  static bool isData = true;
  static var docPakage =
      FirebaseFirestore.instance.collection("packageQuestions");
  static Future createPackage({required index}) async {
    await docPakage
        .where('idgoi', isEqualTo: _idgoi + "${index}")
        .get()
        .then(((value) {
      value.docs.forEach((element) async {
        print("==1111111111111111===>  ${element.data()['idgoi']}");
        idgoi = "${element.data()['idgoi']}";
        idUser = "${element.data()['idUser']}";
        idlv = int.parse("${element.data()['idlv']}");
        idch = int.parse("${element.data()['idch']}");
        timer = int.parse("${element.data()['timer']}");
        print("==1111111111111111===>  ${idch}");
        UserSimplePreferences.setSL(index: idch!);

        isData = false;
      });
    }));
    //TODO: Them goi neu lan dau bam vao
    if (isData) {
      final _docPakage = FirebaseFirestore.instance
          .collection("packageQuestions")
          .doc(_idgoi + "${index}");
      await _docPakage.set({
        'idgoi': _idgoi + "${index}",
        'idch': idch ?? 0,
        'timer': 0,
        'idlv': index,
        'idUser': _idgoi
      });
    }
  }

  static Future UpatePackage(
      {required int currentIndex, required int index}) async {
    UserSimplePreferences.setSL(index: currentIndex);
    await docPakage.doc(_idgoi + "${index}").update({
      'idgoi': _idgoi + "${index}",
      'idch': UserSimplePreferences.getSL(),
      'timer': 0,
      'idlv': index,
      'idUser': _idgoi
    });
  }
}
