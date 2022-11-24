import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';

class FureStoreCategory {
  static final CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");

//TODO: Stream
  static final StreamCategories = FirebaseFirestore.instance
      .collection("categoties")
      .orderBy("createddate")
      .snapshots();

     static GetData()async{
        final data = FirebaseFirestore.instance.collection('users');
          await data.get().then((value) {

          value.docs.forEach((element) {
      print("---------------------------------------${element.data()['score']}");

    //print("=======================>>>${element.data()['name']}");

           // lst.add(element.data()['name'] as String);
      });
        });
      }
static List<String>lst=[];

}

