import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String mainTitle;
  final String subTitle;


  Titles({
    required this.mainTitle,
    required this.subTitle,

  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(mainTitle,
            style: Theme.of(context).textTheme.displayMedium),
        SizedBox(
          height: 10,
        ),
        Text(subTitle,
            style: Theme.of(context).textTheme.bodySmall),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
