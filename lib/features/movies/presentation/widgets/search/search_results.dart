import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SearchBloc>(),
      builder: (context, state) {
        if (state is SearchLoaded) {
          return ListView.builder(
            itemCount: state.movies.movies!.length,
            itemBuilder: (context, index) {
              final movie = state.movies.movies![index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
              );
            },
          );
        }

        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 30),
              Text(
                'Search for movies',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        );
      },
    );
  }
}
