import 'package:flutter/material.dart';

void show_ModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Gửi phản hồi cho chúng tôi'),
            ),
            Text(
              'Hãy mô tả vẫn đề của bạn.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 5 * 24.0,
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Hãy cho chúng tôi biết chúng tôi có thể làm gì để cải thiện sản phẩm của mình',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
