import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:food_app_flutter/presentation/screens/add_new_item_screen.dart';
import 'package:food_app_flutter/presentation/screens/add_new_recipe_screen.dart';
import 'package:food_app_flutter/presentation/screens/add_tip_screen.dart';
import 'package:food_app_flutter/presentation/screens/recipes_screen.dart';
import 'package:food_app_flutter/presentation/screens/tips_screen.dart';

import '../../utils/color/app_colors.dart';
import 'refrigerator_screen.dart';

class HomePage extends StatefulWidget {
  final int ndx;

  HomePage({required this.ndx});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  final autoSizeGroup = AutoSizeGroup();

  final List<IconData> navigationBarIcon = [
    Icons.food_bank_rounded,
    Icons.receipt,
    Icons.tips_and_updates_outlined,
    Icons.account_circle
  ];

  final List<String> navigationBarText = [
    'Refrigerator',
    'Recipes',
    'Tips',
    'My Profile',
  ];

  @override
  void didChangeDependencies() {
    currentIndex = widget.ndx;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            RefrigeratorScreen(),
            RecipeScreen(),
            TipsScreen(),
            Center(
                child: Text(
              'My Profile',
              style: Theme.of(context).textTheme.bodyLarge,
            )),
            AddNewItemScreen(),
            AddNewRecipeScreen(),
            AddTipsScreen(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: AppColors.darkGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.0))),
        child: const Icon(
          Icons.add,
          color: AppColors.magnolia,
          size: 40,
        ),
        onPressed: () {
          setState(() => currentIndex = 4);
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 75,
        rightCornerRadius: 20,
        leftCornerRadius: 20,
        notchSmoothness: NotchSmoothness.sharpEdge,
        backgroundColor: AppColors.purple,
        gapLocation: GapLocation.center,
        itemCount: navigationBarIcon.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.darkPurple : AppColors.magnolia;
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navigationBarIcon[index],
                  size: 30,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: AutoSizeText(
                    navigationBarText[index],
                    maxLines: 1,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                    group: autoSizeGroup,
                  ),
                ),
              ],
            ),
          );
        },
        activeIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
