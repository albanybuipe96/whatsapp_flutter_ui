import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({void Function(String error)? onError}) async {
  File? image;
  try {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      image = File(picked.path);
    }
  } catch (e) {
    onError != null ? onError(e.toString()) : throw Exception(e.toString());
  }
  return image;
}
