import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../blocs/details/details_bloc.dart';
import 'movie_details.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: context.read<DetailsBloc>(),
      builder: (context, state) {
        if (state is DetailsLoading) {
          return const LoadingPlaceholder(height: 0.4);
        } else if (state is DetailsError) {
          return ErrorPlaceholder(
            message: state.message,
            height: 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.clip,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<DetailsBloc>().add(GetMovieDetailsEvent(movie.id));
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is DetailsLoaded) {
          return MovieDetails(details: state.details);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
