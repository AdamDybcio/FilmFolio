import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genres/genres_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/years/years_bloc.dart';

class YearsTabBar extends StatelessWidget {
  const YearsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (_, genresState) {
        if (genresState is GenresLoaded) {
          return BlocBuilder<YearsBloc, YearsState>(
            builder: (_, state) {
              return FadeIn(
                child: DefaultTabController(
                  length: 50,
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      context.read<DiscoverMoviesListBloc>().yearsBloc.add(YearsChangeEvent(DateTime.now().year - index));
                      context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent());
                    },
                    tabs: List.generate(50, (index) {
                      final year = DateTime.now().year - index;
                      return Tab(
                        text: year.toString(),
                      );
                    }),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
