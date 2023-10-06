import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

String? imageUrl;
Future<void> recipesAddRepository(
    {required imageFile,
      required name,
      required ingredients,
      required details}) async {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    if(imageFile!=null) {
      final storageRef = storage.ref().child('images').child(
          '${DateTime.now()}image.jpg');
      final firebase_storage.UploadTask uploadTask = storageRef.putFile(imageFile);
      await uploadTask;
      imageUrl = await storageRef.getDownloadURL();
    }
    else{imageUrl="https://img.freepik.com/premium-vector/food-logo-with-spoon-fork-symbol-illustration_337180-907.jpg";}

    await firestore.collection('recipes').add({
      'imageUrl': imageUrl,
      'name': name,
      'ingredients': ingredients,
      'details': details,
    });
    print('Data added to Firestore successfully!');
  } catch (e) {
    print('Error uploading image: $e');
  }
}
