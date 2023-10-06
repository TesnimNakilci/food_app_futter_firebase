import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> tipsAddRepository({required name, required details}) async {
  final CollectionReference tipsCollection =
      FirebaseFirestore.instance.collection('tips');
  try {
    await tipsCollection.add({
      'title': name,
      'details': details,
    });
    print('Data added to Firestore successfully!');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}
