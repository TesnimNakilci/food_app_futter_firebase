import 'package:flutter/material.dart';

import '../../utils/color/app_colors.dart';

class MealItem extends StatefulWidget {
  // final String id;
  final String name;
  final String imageUrl;

  //final String weight;
  //final String days;
  final DateTime purchaseDate;
  final DateTime expirationDate;
  final String quantity;
  final String unit;
  final String marketName;
  final String notes;

  MealItem({
    // required this.id,
    required this.name,
    required this.imageUrl,
    //required this.weight,
    // required this.days,
    required this.purchaseDate,
    required this.expirationDate,
    required this.quantity,
    required this.unit,
    required this.marketName,
    required this.notes,
  });

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    DateTime dt1 =
        widget.expirationDate; // DateTime.parse(widget.expirationDate);
    DateTime dt2 = widget.purchaseDate; //DateTime.parse(widget.purchaseDate);
    var diff = dt1.difference(dt2).inDays;

    return InkWell(
      onTap: () {},
      child: Card(
        color: AppColors.magnolia,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.only(right: 10),
          height: 80,
          child: Row(
            children: [
              Expanded(
                  child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.avatar,
                child: IconButton(
                    onPressed: () {},
                    icon: widget.imageUrl != "" && widget.imageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(widget.imageUrl,
                                height: 50, width: 50, fit: BoxFit.fill),
                          )
                        : Image.asset(
                            "assets/images/tomato.png",
                            height: 50,
                            width: 50,
                          )),
              )),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.name,
                            style: Theme.of(context).textTheme.titleMedium),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.purple,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_location_outlined,
                                color: AppColors.magnolia,
                                size: 15,
                              )),
                        )
                      ],
                    )),
                    const SizedBox(height: 3),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          diff.toString() + "  days",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          widget.quantity + " " + widget.unit,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.redOrange,
                          child: Container(
                            padding: EdgeInsets.all(0.1),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.restore_from_trash_outlined,
                                  color: AppColors.magnolia,
                                  size: 15,
                                )),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
