import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/util/strings.dart';
import '../bloc/images_bloc.dart';
import '../widget/third_tab/image_button.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  final ImagesBloc imagesBloc = Get.find<ImagesBloc>();

  @override
  void initState() {
    super.initState();
    imagesBloc.initialize();
  }

  @override
  void dispose() {
    imagesBloc.dispose();
    super.dispose();
  }

  Widget _defaultMessage(String text) {
    return Container(
      color: Colors.blue,
      width: 280.0,
      height: 210.0,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _showSelectedImages() {
    return StreamBuilder<List<File>>(
      stream: imagesBloc.deviceImagesStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<File>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return _defaultMessage(
                Strings.imagesPageDefaultMessageDeviceImages);
          } else {
            return Container(
              color: Colors.blue,
              width: 280.0,
              height: 210.0,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: SizedBox(
                      width: 260.0,
                      height: 160.0,
                      child: Image.file(
                        snapshot.data![index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return _defaultMessage(Strings.imagesPageDefaultMessageDeviceImages);
        }
      },
    );
  }

  Widget _showStoredImages() {
    return StreamBuilder<List<String>>(
      stream: imagesBloc.storageImagesStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<String>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return _defaultMessage(
                Strings.imagesPageDefaultMessageStorageImages);
          } else {
            return Container(
              color: Colors.blue,
              width: 280.0,
              height: 210.0,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: SizedBox(
                      width: 260.0,
                      height: 160.0,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: snapshot.data![index],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return _defaultMessage(Strings.imagesPageDefaultMessageStorageImages);
        }
      },
    );
  }

  _openGallery() async {
    imagesBloc.getGalleryImages();
  }

  _openCamera() async {
    imagesBloc.getCameraImages();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return AlertDialog(
            title: const Text(
              Strings.imagesPageSelect,
              style: TextStyle(
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ImageButton(
                      text: Strings.imagesPageGallery,
                      onPressed: () {
                        _openGallery();
                        Navigator.of(context).pop();
                      }),
                  const Padding(
                    padding: EdgeInsets.all(
                      5.0,
                    ),
                  ),
                  ImageButton(
                      text: Strings.imagesPageCamera,
                      onPressed: () {
                        _openCamera();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 5.0,
              ),
              child: Text(
                Strings.imagesPageTitleDeviceImages,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            _showSelectedImages(),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 5.0,
              ),
              child: Text(
                Strings.imagesPageTitleStorageImages,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            _showStoredImages(),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageButton(
                  text: Strings.imagesPageTextButtonDeviceImages,
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                ),
                const SizedBox(
                  width: 15.0,
                ),
                ImageButton(
                  text: Strings.imagesPageTextButtonStorageImages,
                  onPressed: () async {
                    imagesBloc.getStorageImages();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text(
                          imagesBloc.hasSelectedImages()
                              ? Strings.imagesPageSnackBarWithImages
                              : Strings.imagesPageSnackBarWithoutImages,
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
