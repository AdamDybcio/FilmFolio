import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: trailerId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: false,
        hideThumbnail: true,
        disableDragSeek: true,
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).colorScheme.tertiary,
            progressColors: ProgressBarColors(
              playedColor: Theme.of(context).colorScheme.tertiary,
              handleColor: Theme.of(context).colorScheme.tertiary,
            ),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
              RemainingDuration(),
            ],
          ),
        ),
      ),
    );
  }
}
