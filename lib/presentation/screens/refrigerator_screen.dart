import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/presentation/components/appBar_part.dart';
import 'package:food_app_flutter/presentation/components/background_image.dart';
import 'package:food_app_flutter/presentation/components/categories_list_view.dart';
import 'package:food_app_flutter/presentation/components/meal_card.dart';
import 'package:food_app_flutter/presentation/components/search_row.dart';
import 'package:food_app_flutter/presentation/components/titles.dart';

import '../../utils/constants/categories_list.dart';

class RefrigeratorScreen extends ConsumerWidget {
  RefrigeratorScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundImage(
        wid: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarPart(),
            Titles(
              mainTitle: "My Refrigerator",
              subTitle: 'List of items in my refrigerator',
            ),
            SearchRow(),
            const SizedBox(
              height: 15,
            ),
            CategoriesListView(
              categoriesList: categoriesList1,
            ),
            const SizedBox(
              height: 15,
            ),
            MealCard()
          ],
        ),
      ),
    ));
  }
}
