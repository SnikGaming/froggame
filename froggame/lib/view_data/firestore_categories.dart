// ignore: unused_import
import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: unused_import
import '../models/category_model.dart';

class FureStoreCategory {
  static final CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categoties");

// ignore: todo
//TODO: Stream
  // ignore: non_constant_identifier_names
  static final StreamCategories = FirebaseFirestore.instance
      .collection("categoties")
      .orderBy("createddate")
      .snapshots();

  // ignore: non_constant_identifier_names
  static GetData() async {
    final data = FirebaseFirestore.instance.collection('categoties');
    await data.get().then((value) {
      // ignore: avoid_function_literals_in_foreach_calls
      value.docs.forEach((element) {
        //print("=======================>>>${element.data()['name']}");

        // lst.add(element.data()['name'] as String);
        lst.add(element.data()['name']);
      });
    });
  }

  static List<String> lst = [];

//!: GET ALL DATA CATEGORIES
  static List<Category> lsData = [];
  static getAllData() {
    FirebaseFirestore.instance
        .collection('categoties')
        .orderBy("createddate", descending: false)
        .get()
        .then((value) {
      for (var data in value.docs) {
        lsData.add(Category(
            name: data.data()['name'],
            img: data.data()['img'],
            createddate: data.data()['createddate']));
      }
    });
  }
}
