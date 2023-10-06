import 'package:flutter/material.dart';

class AppBarPart extends StatelessWidget {
  const AppBarPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("logo", style: Theme.of(context).textTheme.displayLarge),
        Image.asset(
          "assets/images/bell.png",
          height: 50,
          width: 50,
        )
      ],
    );
  }
}
