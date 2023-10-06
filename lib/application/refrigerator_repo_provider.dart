import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/refrigerator_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

final refrigeratorRepositoryProvider = Provider<MealsRepository>((ref) {
  return MealsRepository();
});

final refrigeratorStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});
