import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/presentation/screens/add_new_recipe_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app_flutter/presentation/screens/home_page.dart';
import 'package:riverpod_context/riverpod_context.dart';

import 'package:firebase_core/firebase_core.dart';


import 'utils/color/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Very Important to do (Reason below)
  await Firebase.initializeApp();
  runApp(ProviderScope(child: InheritedConsumer(child: MyApp())));
 // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lightBlue[800],
            fontFamily: GoogleFonts.roboto().toString(),
            textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
              displayLarge: GoogleFonts.ibarraRealNova(
                  textStyle: textTheme.displayLarge,
                  fontSize: 59,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: AppColors.black),
              displayMedium: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackPearl),
              titleMedium: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackPearl),
              displaySmall: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackPearl),
              bodySmall: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w500),
              bodyMedium: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400),
              bodyLarge: const TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400),
            ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => HomePage(ndx:0),
          '/addrecipescreen': (context) => AddNewRecipeScreen(),
        },
      ),
    );
  }
}

