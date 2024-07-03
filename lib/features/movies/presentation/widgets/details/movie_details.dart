import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/custom_placeholder.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import '../../blocs/details/movie_details_bloc.dart';
import 'genre_details.dart';
import 'simple_details.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

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
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomPlaceholder(
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
          ),
        );
      },
    );
  }
}
