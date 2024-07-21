import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/icons/background_icon.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genre_movies/genre_movies_bloc.dart';

import '../../../../../common/widgets/appbars_navbars/custom_appbar.dart';
import '../../widgets/home/genre_movies.dart';

class GenreMoviesScreen extends StatelessWidget {
  const GenreMoviesScreen({super.key, required this.genreId, required this.genreName});

  final String genreId;
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GenreMoviesBloc>()..add(FetchGenreMovies(genreId, DateTime.now().year)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(
                hasBackButton: true,
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(genreName),
                ),
                actions: const [],
              ),
            ];
          },
          body: Stack(
            children: [
              const BackgroundIcon(icon: Icons.theater_comedy),
              BlocBuilder<GenreMoviesBloc, GenreMoviesState>(
                builder: (context, state) {
                  if (state is GenreMoviesError) {
                    return FadeIn(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CenteredMessage(
                            message: state.message,
                          ),
                          ElevatedButton(
                            onPressed: () => context.read<GenreMoviesBloc>().add(FetchGenreMovies(genreId, DateTime.now().year)),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is GenreMoviesInitial) {
                    return const CenteredMessage(
                      message: 'Please wait...',
                    );
                  } else if (state is GenreMoviesLoading) {
                    return const CenteredMessage(
                      message: 'Loading...',
                    );
                  } else if (state is GenreMoviesLoaded) {
                    return FadeIn(
                        child: GenreMovies(
                      movies: state.movies,
                      isMaxPage: state.isMaxPage,
                      selectedYear: state.selectedYear,
                      genreId: genreId,
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
