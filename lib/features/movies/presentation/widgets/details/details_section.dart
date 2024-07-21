import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/movie/movies_section.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../../../common/widgets/texts/centered_message.dart';
import '../../blocs/details/details/details_bloc.dart';
import 'movie_actors_section.dart';
import 'movie_genres_section.dart';
import 'movie_image_section.dart';
import 'movie_overview_section.dart';
import 'movie_production_companies_section.dart';
import 'movie_reviews_section.dart';
import 'movie_title_section.dart';
import 'movie_video_section.dart';
import 'movie_year_section.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<DetailsBloc>(),
      builder: (context, state) {
        if (state is DetailsInitial) {
          return const CenteredMessage(message: 'Please wait...');
        } else if (state is DetailsLoading) {
          return const CenteredMessage(message: 'Loading...');
        } else if (state is DetailsError) {
          return FadeIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CenteredMessage(message: state.message),
                ElevatedButton(
                  onPressed: () => context.read<DetailsBloc>().add(GetMovieDetailsEvent(movie.id)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is DetailsLoaded) {
          String trailer = '';
          try {
            trailer = state.details.videos.firstWhere((video) => video.type == 'Trailer' && video.site == 'YouTube').key;
          } catch (e) {
            if (kDebugMode) print('No trailer available.');
          }

          return SingleChildScrollView(
            child: FadeIn(
              child: Column(
                children: [
                  MovieImageSection(movie: movie),
                  if (movie.title.trim() != '') MovieTitleSection(title: movie.title),
                  if (movie.releaseDate.trim() != '' || state.details.budget != -1 || state.details.originalLanguage.trim() != 'UNKNOWN' || state.details.runtime != -1)
                    MovieYearSection(
                      year: movie.releaseDate,
                      budget: state.details.budget,
                      language: state.details.originalLanguage,
                      runtime: state.details.runtime,
                    ),
                  if (movie.overview.trim().isNotEmpty) MovieOverviewSection(overview: movie.overview),
                  if (state.details.genres.isNotEmpty) MovieGenresSection(genres: state.details.genres),
                  if (state.details.actors.isNotEmpty) MovieActorsSection(actors: state.details.actors),
                  if (state.details.productionCompanies.isNotEmpty) MovieProductionCompaniesSection(productionCompanies: state.details.productionCompanies),
                  if (state.details.videos.isNotEmpty && trailer != '') MovieVideoSection(trailer: trailer),
                  if (state.similar.movies!.isNotEmpty) MoviesSection(movies: state.similar.movies!, isSimilar: true),
                  if (state.details.reviews.totalPages > 0) MovieReviewsSection(reviews: state.details.reviews, movieId: movie.id.toString()),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
