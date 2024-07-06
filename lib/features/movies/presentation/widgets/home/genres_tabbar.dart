import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';

import '../../blocs/home/genres/genres_bloc.dart';

class GenresTabBar extends StatelessWidget {
  const GenresTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder(
        bloc: context.read<HomeMoviesBloc>().discoverMoviesBloc.genresBloc,
        builder: (context, state) {
          if (state is GenresLoaded) {
            return FadeIn(
              child: DefaultTabController(
                length: state.genres.length,
                child: TabBar(
                  onTap: (index) {
                    context.read<HomeMoviesBloc>().discoverMoviesBloc.genresBloc.add(SelectGenre(genres: state.genres, selectedGenreIndex: index));
                    context.read<HomeMoviesBloc>().discoverMoviesBloc.add(const FetchDiscoverMovies());
                  },
                  tabs: state.genres.map((genre) => Tab(text: genre.name, height: 50)).toList(),
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
              ),
            );
          } else if (state is GenresError) {
            return ErrorPlaceholder(
              message: state.message,
              isSpecialHeight: true,
              height: 100,
              child: Text(state.message, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center, overflow: TextOverflow.fade),
            );
          } else {
            return LoadingPlaceholder(
              height: 100,
              isSpecialHeight: true,
              child: Text('Loading...', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center, overflow: TextOverflow.fade),
            );
          }
        },
      ),
    );
  }
}
