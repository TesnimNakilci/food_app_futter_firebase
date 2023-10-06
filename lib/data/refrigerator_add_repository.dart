import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

String? imageUrl;

Future<void> refrigeratorAddRepository(
    {required imageFile,
    required name,
    required purchaseDate,
    required expirationDate,
    required quantity,
    required unit,
    required marketName,
    required notes}) async {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    if (imageFile != null) {
      final storageRef =
          storage.ref().child('images').child('${DateTime.now()}image.jpg');
      final firebase_storage.UploadTask uploadTask =
          storageRef.putFile(imageFile);
      await uploadTask;
      imageUrl = await storageRef.getDownloadURL();
    } else {
      imageUrl =
          "https://img.freepik.com/premium-vector/food-logo-with-spoon-fork-symbol-illustration_337180-907.jpg";
    }

    await firestore.collection('refrigerator').add({
      'imageUrl': imageUrl,
      'name': name,
      'purchaseDate': purchaseDate,
      'expirationDate': expirationDate,
      'quantity': quantity,
      'unit': unit,
      'marketName': marketName,
      'notes': notes,
    });
    print('Data added to Firestore successfully!');
  } catch (e) {
    print('Error uploading image: $e');
  }
}
