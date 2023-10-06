import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/data/tips_repository.dart';

final tipRepositoryProvider = Provider<TipsRepository>((ref) {
  return TipsRepository();
});
