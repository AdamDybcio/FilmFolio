import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../../../common/widgets/texts/centered_message.dart';
import '../../blocs/details/details_bloc.dart';
import 'movie_actors_section.dart';
import 'movie_genres_section.dart';
import 'movie_image_section.dart';
import 'movie_overview_section.dart';
import 'movie_production_companies_section.dart';
import 'movie_title_section.dart';
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CenteredMessage(message: state.message),
              ElevatedButton(
                onPressed: () => context.read<DetailsBloc>().add(GetMovieDetailsEvent(movie.id)),
                child: const Text('Retry'),
              ),
            ],
          );
        } else if (state is DetailsLoaded) {
          return SingleChildScrollView(
            child: FadeIn(
              child: Column(
                children: [
                  MovieImageSection(movie: movie),
                  if (movie.title != '') MovieTitleSection(title: movie.title),
                  if (movie.releaseDate != '') MovieYearSection(year: movie.releaseDate, budget: state.details.budget, language: state.details.originalLanguage),
                  if (movie.overview.isNotEmpty) MovieOverviewSection(overview: movie.overview),
                  if (state.details.genres.isNotEmpty) MovieGenresSection(genres: state.details.genres),
                  if (state.details.actors.isNotEmpty) MovieActorsSection(actors: state.details.actors),
                  if (state.details.productionCompanies.isNotEmpty) MovieProductionCompaniesSection(productionCompanies: state.details.productionCompanies),
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
