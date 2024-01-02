import 'dart:io';
import 'package:challenge/src/data/data_source/local/images_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ImagesStorage imagesStorage;

  setUp(() async {
    imagesStorage = ImagesStorage.instance;
  });

  test(
    'uploadImages() should store the images and get the urls',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp().then((value) async {
        final images = await imagesStorage.uploadImages([File('image')]);
        expect(images.first, 'image');
      });
    },
  );
}
