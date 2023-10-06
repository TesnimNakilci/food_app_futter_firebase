import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_storage/firebase_storage.dart';
import '../data/recipes_repository.dart';

final recipesRepositoryProvider = Provider<RecipesRepository>((ref) {
  return RecipesRepository();
});

final recipesStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});
