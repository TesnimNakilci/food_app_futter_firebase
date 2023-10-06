import 'package:flutter/foundation.dart';

class Meal {
  //final String id;
  final String name;
  final String imageUrl;

  // final String weight;
  // final String days;
  final String purchaseDate;
  final String expirationDate;
  final String quantity;
  final String unit;
  final String marketName;
  final String notes;

  const Meal({
    //   required this.id,
    required this.name,
    required this.imageUrl,
    // required this.weight,
    // required this.days,
    required this.purchaseDate,
    required this.expirationDate,
    required this.quantity,
    required this.unit,
    required this.marketName,
    required this.notes,
  });
}
