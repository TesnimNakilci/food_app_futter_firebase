import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/categories_list.dart';
import '../components/add_tip_form.dart';
import '../components/appBar_part.dart';
import '../components/background_image.dart';
import '../components/categories_list_view.dart';
import '../components/titles.dart';

class AddTipsScreen extends ConsumerWidget {
  const AddTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BackgroundImage(
        wid: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarPart(),
                  Titles(
                    mainTitle: "Add Tip ",
                    subTitle: 'Add Storge Tips',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CategoriesListView(
                    categoriesList: categoriesList1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AddTipForm(),
                ],
              ),
            )),
      ),
    );
  }
}
