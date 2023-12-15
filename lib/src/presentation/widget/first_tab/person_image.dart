import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/src/core/util/endpoints.dart';
import 'package:flutter/material.dart';

class PersonImage extends StatelessWidget {
  final String posterPath;

  const PersonImage({
    super.key,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: '${Endpoints.imageNetwork}$posterPath',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
