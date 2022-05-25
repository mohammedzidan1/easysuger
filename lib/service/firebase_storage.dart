import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageService {
  static Future<String> uploadFile(String path, {bool isImage = true}) async {
    String fileName = path.split('/').last;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('users/images/${DateTime.now().microsecond}_$fileName');

    await ref.putFile(File(path));

    return await ref.getDownloadURL();
  }
}
