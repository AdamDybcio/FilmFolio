import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import '../../core/utils/strings/api_strings.dart';

class Styles {
  final BuildContext context;
  late BoxDecoration cardBoxDecoration;
  String imagePath;
  late List<Shadow> iconShadows;
  late List<BoxShadow>? containerShadows;

  Styles({required this.context, this.imagePath = ''}) {
    final isDark = HelperFunctions.isDarkMode(context);

    cardBoxDecoration = BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 0),
        ),
      ],
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 1,
      ),
      image: imagePath != ''
          ? DecorationImage(
              image: CachedNetworkImageProvider(ApiStrings.imageUrl + imagePath),
              fit: BoxFit.cover,
              onError: (_, __) {
                null;
              },
            )
          : null,
    );

    iconShadows = [
      const Shadow(
        color: Colors.black,
        offset: Offset(0, 0),
        blurRadius: 5,
      ),
    ];

    containerShadows = [
      const BoxShadow(
        color: Colors.black,
        offset: Offset(0, 0),
        spreadRadius: 2,
        blurRadius: 5,
      ),
    ];
  }
}
