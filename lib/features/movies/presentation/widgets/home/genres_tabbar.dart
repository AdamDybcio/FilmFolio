import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/custom_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';

import '../../blocs/home/genres/genres_bloc.dart';

class GenresTabBar extends StatelessWidget {
  const GenresTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<GenresBloc, GenresState>(
        builder: (context, state) {
          if (state is GenresLoaded) {
            return FadeIn(
              child: DefaultTabController(
                length: state.genres.length,
                child: TabBar(
                  onTap: (index) {
                    context.read<DiscoverMoviesListBloc>().genresBloc.add(GenresSelectEvent(genres: state.genres, selectedGenreIndex: index));
                    context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent(page: 1));
                  },
                  tabs: state.genres.map((genre) => Tab(text: genre.name, height: 50)).toList(),
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
              ),
            );
          } else if (state is GenresError) {
            return CustomPlaceholder(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: FadeIn(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 30),
                    const SizedBox(width: 20),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return CustomPlaceholder(
              height: 100,
              width: MediaQuery.of(context).size.width,
              play: true,
              child: const Text('Loading genres...'),
            );
          }
        },
      ),
    );
  }
}
