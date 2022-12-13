import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:quickalert/quickalert.dart';

// ignore: non_constant_identifier_names
void show_ModalBottomSheet(BuildContext context) {
  var txt = TextEditingController();

  showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 213, 91, 140),
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              // leading: Icon(Icons.close),
              title: Text('Gửi phản hồi cho chúng tôi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 209, 244),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            const Text(
              'Hãy mô tả vẫn đề của bạn.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              height: 5 * 24.0,
              child: TextField(
                controller: txt,
                maxLines: 5,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      'Hãy cho chúng tôi biết chúng tôi có thể làm gì để cải thiện sản phẩm của mình',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  //         final _docPakage = FirebaseFirestore.instance
                  //     .collection("packageQuestions")
                  //     // ignore: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps
                  //     .doc(_idgoi + "${index}");
                  // await _docPakage.set({
                  //   // ignore: prefer_interpolation_to_compose_strings
                  //   'idgoi': _idgoi + "$index",
                  //   'idch': idch,
                  //   'timer': 0,
                  //   'idlv': index,
                  //   'idUser': _idgoi
                  // });
                  final data = FirebaseFirestore.instance
                      .collection("report")
                      .doc(DateTime.now().toString());
                  await data.set({
                    "iduser": UserSimplePreferences.getUserId(),
                    "gamil": UserSimplePreferences.getUserEmail(),
                    "content": txt.text,
                    "time": DateTime.now().toString()
                  }).then((value) {
                    txt.clear();
                    Navigator.of(context).pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Đã gửi\n Cảm ơn đóng góp của bạn về ứng dụng...',
                    );
                  });
                },
                child: const Text("GỬI",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)))
          ],
        ),
      );
    },
  );
}
