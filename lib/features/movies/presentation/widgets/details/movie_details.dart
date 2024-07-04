import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/custom_placeholder.dart';
import 'package:movie_bloc_app/core/utils/helpers/connection_helper.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import '../../blocs/details/movie_details_bloc.dart';
import 'genre_details.dart';
import 'simple_details.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MovieDetailsModel details = MovieDetailsModel.empty();
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (_, state) {
        if (state is MovieDetailsLoaded) {
          details = state.movieDetails;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: FadeIn(
                delay: const Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SimpleDetails(details: details),
                    VerticalDivider(
                        endIndent: size.height * 0.025, indent: size.height * 0.025, thickness: 2, width: size.width * 0.05, color: Theme.of(context).colorScheme.primary),
                    GenreDetails(details: details),
                  ],
                ),
              ),
            ),
          );
        } else if (state is MovieDetailsLoading) {
          return CustomPlaceholder(
            width: size.width,
            height: size.height * 0.4,
            play: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
                SizedBox(height: size.height * 0.05),
                Text('Loading...', style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          );
        } else {
          return CustomPlaceholder(
            width: size.width,
            height: size.height * 0.4,
            play: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50),
                SizedBox(height: size.height * 0.05),
                Text(
                  'Cannot load movie details.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: size.height * 0.025),
                OutlinedButton(
                  onPressed: () async {
                    await start();
                    if (connectionStatus[0] != ConnectivityResult.none) {
                      // ignore: use_build_context_synchronously
                      context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(movie.id));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                  child: const Text(
                    'Retry',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
