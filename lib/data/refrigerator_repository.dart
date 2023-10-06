import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_flutter/domain/meal.dart';

class MealsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Meal>> getMeals() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('refrigerator').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Meal(
        //  id: doc.id,
        name: data['name'].toString(),
        imageUrl: data['imageUrl'].toString(),
        purchaseDate: data['purchaseDate'],
        expirationDate: data['expirationDate'],
        quantity: data['quantity'].toString(),
        unit: data['unit'].toString(),
        marketName: data['marketName'].toString(),
        notes: data['notes'].toString(),
      );
    }).toList();
  }
}
