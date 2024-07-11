import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search/search/search_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: TextField(
        controller: context.read<SearchBloc>().controller,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              context.read<SearchBloc>().controller.clear();
              context.read<SearchBloc>().add(SearchMovies(context.read<SearchBloc>().controller.text));
            },
            icon: const Icon(Icons.clear),
          ),
        ),
        onChanged: (_) {
          context.read<SearchBloc>().add(SearchMovies(context.read<SearchBloc>().controller.text));
        },
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
