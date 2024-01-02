import 'dart:async';
import 'dart:io';
import 'package:challenge/src/presentation/bloc/image_bloc.dart';
import 'package:challenge/src/presentation/view/third_tab.dart';
import 'package:challenge/src/presentation/widget/third_tab/image_button.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'third_tab_test.mocks.dart';

@GenerateMocks([
  ImageBloc,
])
void main() {
  late ImageBloc imagesBloc;
  late List<File> imagesList;
  late List<String> urlsList;

  setUp(() {
    imagesBloc = MockImageBloc();
    Get.replace(imagesBloc);
    imagesList = [File('path')];
    urlsList = [''];
  });

  testWidgets('ThirdTab() should display the images page',
      (WidgetTester tester) async {
    when(imagesBloc.initialize()).thenAnswer((_) async => true);
    when(imagesBloc.getCameraImages()).thenAnswer((_) async => true);
    when(imagesBloc.getGalleryImages()).thenAnswer((_) async => true);
    when(imagesBloc.hasSelectedImages()).thenAnswer((_) => true);
    when(imagesBloc.getStorageImages()).thenAnswer((_) async => true);
    when(imagesBloc.deviceImagesStream)
        .thenAnswer((_) => Stream.value(imagesList));
    when(imagesBloc.storageImagesStream)
        .thenAnswer((_) => Stream.value(urlsList));
    await tester.pumpWidget(
      MaterialApp(
        home: ThirdTab(),
      ),
    );
    await tester.pump();
    expect(find.byType(ImageButton), findsNWidgets(2));
    expect(find.byType(WidgetEmpty), findsNothing);
    expect(find.byType(WidgetError), findsNothing);
  });
}
