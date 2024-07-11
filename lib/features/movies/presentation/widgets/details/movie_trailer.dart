import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../common/widgets/youtube_player/yt_player_widget.dart';

class MovieTrailer extends StatelessWidget {
  const MovieTrailer({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    String trailerId = '';

    try {
      trailerId = details.videos.firstWhere((video) => video.type == 'Trailer' && video.site == 'YouTube').key;
    } catch (e) {
      if (kDebugMode) print('No trailer available.');
    }

    if (trailerId == '') {
      return Center(
        child: Text(
          'No trailer available.',
          style: Theme.of(context).textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );
    }

    return FadeIn(
      delay: const Duration(seconds: 1),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: SizedBox(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: YtPlayerWidget(trailerId: trailerId),
          ),
        ),
      ),
    );
  }
}
