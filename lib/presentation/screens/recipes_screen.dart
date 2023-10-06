import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/presentation/components/recipe_card.dart';
import 'package:food_app_flutter/presentation/screens/home_page.dart';

import '../../utils/color/app_colors.dart';
import '../../utils/constants/categories_list.dart';
import '../components/appBar_part.dart';
import '../components/background_image.dart';
import '../components/categories_list_view.dart';
import '../components/search_row.dart';
import '../components/titles.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomePage(ndx:5)),
          );
       //   Navigator.of(context).pushNamed('/addrecipescreen');
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.0))),
        backgroundColor: AppColors.blackPearl,
        child:  Image.asset("assets/images/add_recipe_icon.png")// const Icon(Icons.receipt,color: AppColors.milkWhite,),
      ),
      body: BackgroundImage(
        wid: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarPart(),
                  Titles(
                    mainTitle: "Recipes",
                    subTitle: 'List of Shared Recipes',
                  ),
                  SearchRow(),
                  const SizedBox(
                    height: 15,
                  ),
                  CategoriesListView(
                    categoriesList: categoriesList2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RecipCard(),
                ],
              ),
            )),
      ),
    );
  }
}
