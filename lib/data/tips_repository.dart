import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_flutter/domain/tip.dart';

class TipsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Tip>> getTips() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('tips').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Tip(
        //  id: doc.id,
        title: data['title'].toString(),
        details: data['details'].toString(),
      );
    }).toList();
  }
}
