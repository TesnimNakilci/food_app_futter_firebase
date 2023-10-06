import 'package:flutter/material.dart';

import '../../utils/color/app_colors.dart';

class CategoriesListView extends StatefulWidget {
  final List categoriesList;

  CategoriesListView({
    required this.categoriesList,
  });

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.categoriesList.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () => setState(() => currentIndex = index),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: currentIndex == index
                          ? AppColors.darkGrey
                          : AppColors.magnolia),
                  child: Center(
                    child: Text(widget.categoriesList[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: currentIndex != index
                                  ? AppColors.darkGrey
                                  : AppColors.magnolia,
                              overflow: TextOverflow.clip,
                            )),
                  ),
                ));
          }),
    );
  }
}
