import 'package:flutter/material.dart';

import '../../utils/color/app_colors.dart';

class RecipeItem extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String details;

  RecipeItem({
    required this.name,
    required this.imageUrl,
    required this.details,
  });

  @override
  _RecipeItemState createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
          margin: const EdgeInsets.only(bottom: 5),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 3, right: 10, left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: widget.imageUrl != "" && widget.imageUrl != null
                          ? Image.network(
                              widget.imageUrl,
                              width: double.infinity,
                              height: 220,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              "assets/images/meal.png",
                              width: double.infinity,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 5, right: 10, left: 10),
                      child: Image.asset(
                        "assets/images/design.png",
                        height: 20,
                        width: 180,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, right: 10, left: 10),
                    child: Text(
                      widget.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.black,
                            overflow: TextOverflow.clip,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, right: 10, left: 10),
                    child: Text(
                      widget.details,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
