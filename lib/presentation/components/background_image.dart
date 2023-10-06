import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget wid;

  BackgroundImage({
    required this.wid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: wid,
    );
  }
}
