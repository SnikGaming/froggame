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
}
