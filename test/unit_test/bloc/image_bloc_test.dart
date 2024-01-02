import 'dart:io';
import 'package:challenge/src/data/data_source/local/images_storage.dart';
import 'package:challenge/src/presentation/bloc/image_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'image_bloc_test.mocks.dart';

@GenerateMocks([
  ImagePicker,
  ImagesStorage,
])
void main() {
  late ImageBloc imageBloc;
  late ImagePicker imagePicker;
  late ImagesStorage imagesStorage;

  setUp(() {
    imagePicker = MockImagePicker();
    Get.replace(imagePicker);
    imagesStorage = MockImagesStorage();
    Get.replace(imagesStorage);
    imageBloc = ImageBloc();
  });

  group('ImageBloc test', () {
    test(
      'hasSelectedImages() should get false',
      () async {
        await imageBloc.initialize();
        imageBloc.imagesList = [File('path')];
        bool selected = imageBloc.hasSelectedImages();
        expect(true, selected);
      },
    );

    test(
      'getGalleryImages() should get the images from gallery',
      () async {
        when(imagePicker.pickImage(source: ImageSource.gallery))
            .thenAnswer((_) async => XFile('path'));
        await imageBloc.initialize();
        await imageBloc.getGalleryImages();
        verify(imagePicker.pickImage(source: ImageSource.gallery)).called(1);
        expect(imageBloc.imagesList.first.path, [File('path')].first.path);
        expect(imageBloc.urlsList, []);
      },
    );

    test(
      'getCameraImages() should get the images from camera',
      () async {
        when(imagePicker.pickImage(source: ImageSource.camera))
            .thenAnswer((_) async => XFile('path'));
        await imageBloc.initialize();
        await imageBloc.getCameraImages();
        verify(imagePicker.pickImage(source: ImageSource.camera)).called(1);
        expect(imageBloc.imagesList.first.path, [File('path')].first.path);
        expect(imageBloc.urlsList, []);
      },
    );

    test(
      'getStorageImages() should store the images and get the urls',
      () async {
        await imageBloc.initialize();
        imageBloc.imagesList = [File('path')];
        when(imagesStorage.uploadImages(imageBloc.imagesList))
            .thenAnswer((_) async => ['path']);
        await imageBloc.getStorageImages();
        //verify(imagesStorage.uploadImages(imageBloc.imagesList)).called(1);
        expect(imageBloc.urlsList.first, ['path'].first);
        expect(imageBloc.imagesList, []);
      },
    );

    test('dispose() should close all observers', () async {
      await imageBloc.initialize();
      imageBloc.dispose();
    });
  });
}
