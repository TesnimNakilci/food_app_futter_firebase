import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/domain/recipe.dart';
import 'package:food_app_flutter/utils/constants/data_constant.dart';

import '../../application/recipe_repo_provider.dart';
import '../widgets/recipe_item.dart';

final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  final repository = ref.read(recipesRepositoryProvider);
  return repository.getRecipes();
});

class RecipCard extends ConsumerWidget {
  const RecipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipesProvider);

    return recipesAsyncValue.when(
      data: (recipes) {
        // Use the list of posts to display data in your UI
        return ListView.builder(
          shrinkWrap: true,
          itemCount: recipes.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final recipe = recipes[index];
            return RecipeItem(
              name: recipe.name.toString(),
              imageUrl: recipe.imageUrl.toString(),
              details: recipe.details.toString(),
              // ingredients:recipe.ingredients
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );



  }
}
