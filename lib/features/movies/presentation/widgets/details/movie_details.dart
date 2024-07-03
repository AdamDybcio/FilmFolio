import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import '../../blocs/details/movie_details_bloc.dart';

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
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(details.originalLanguage),
                    Text(details.budget.toString()),
                    Text(details.runtime.toString()),
                    Text(details.genres.map((v) => v.name).toList().toString()),
                  ],
                ),
                VerticalDivider(endIndent: size.height * 0.05, indent: size.height * 0.05, color: Theme.of(context).colorScheme.primary),
                Column(),
              ],
            ),
          ),
        );
      },
    );
  }
}
