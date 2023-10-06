import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/presentation/components/add_refrigerator_form.dart';
import 'package:food_app_flutter/presentation/screens/home_page.dart';

import '../../utils/constants/categories_list.dart';
import '../components/appBar_part.dart';
import '../components/background_image.dart';
import '../components/categories_list_view.dart';
import '../components/titles.dart';

class AddNewItemScreen extends ConsumerWidget {
  const AddNewItemScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundImage(
        wid: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            children: [
              AppBarPart(),
              Titles(mainTitle: "Add New Item", subTitle: 'Add item to your refrigerator',),

              CategoriesListView(categoriesList: categoriesList1,),
              const SizedBox(
                height: 15,
              ),
              Expanded(child: AddRefrigeratorForm())
            ],
          ),
        ));
  }
}
