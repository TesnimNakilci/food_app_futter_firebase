import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/utils/constants/data_constant.dart';

import '../../application/refrigerator_repo_provider.dart';
import '../../domain/meal.dart';
import '../widgets/meal_item.dart';
import 'package:intl/intl.dart';

final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  final repository = ref.read(refrigeratorRepositoryProvider);
  return repository.getMeals();
});

class MealCard extends ConsumerWidget {
  const MealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsyncValue = ref.watch(mealsProvider);
    return mealsAsyncValue.when(
      data: (meals) {
        // Use the list of posts to display data in your UI
        return ListView.builder(
          shrinkWrap: true,
          itemCount: meals.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final meal = meals[index];
            return MealItem(
              // id: data_meal[index].id,
              name: meal.name,
              imageUrl: meal.imageUrl,
              purchaseDate: DateTime.parse(meal.purchaseDate),
              expirationDate: DateTime.parse(meal.expirationDate),
              quantity: meal.quantity,
              unit: meal.unit,
              marketName: meal.marketName,
              notes: meal.notes,
              //weight: data_meal[index].weight,
              //days: data_meal[index].days,
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
