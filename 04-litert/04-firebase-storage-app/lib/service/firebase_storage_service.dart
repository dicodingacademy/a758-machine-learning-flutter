import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStorageService {
  Future<File> loadModel() async {
    final storageRef = FirebaseStorage.instance.ref(
      'models/house_price_prediction.tflite',
    );
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/house_price_prediction.tflite');
    await storageRef.writeToFile(file);
    return file;
  }
}
