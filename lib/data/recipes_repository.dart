import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_flutter/domain/recipe.dart';

class RecipesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Recipe>> getRecipes() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('recipes').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Recipe(
        //  id: doc.id,
        name: data['name'].toString(),
        imageUrl: data['imageUrl'].toString(),
        ingredients: data['ingredients'].toString(),
        details:data['details'],
      );
    }).toList();
  }
}