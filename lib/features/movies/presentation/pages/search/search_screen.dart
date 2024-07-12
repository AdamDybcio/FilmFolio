import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/icons/background_icon.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';

import '../../widgets/search/custom_search_bar.dart';
import '../../widgets/search/search_results.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundIcon(icon: Icons.search),
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomSearchBar(),
                  SizedBox(height: 20),
                  SearchResults(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
