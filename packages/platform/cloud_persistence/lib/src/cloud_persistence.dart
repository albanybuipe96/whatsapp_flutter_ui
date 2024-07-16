import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cloudPersistenceProvider = Provider(
  (ref) => CloudPersistence(
    storage: null,
  ),
);

class CloudPersistence {
  CloudPersistence({required FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  Future<String> saveFile({
    required String ref,
    required File file,
  }) async {
    UploadTask task = _storage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await task;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
