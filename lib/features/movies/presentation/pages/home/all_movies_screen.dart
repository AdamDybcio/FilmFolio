import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/appbars_navbars/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/icons/background_icon.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/all_movies/all_movies_bloc.dart';

import '../../widgets/home/all_movies_section.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({super.key, required this.section, required this.title});

  final String section;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AllMoviesBloc>()..add(FetchAllMovies(section)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(
                hasBackButton: true,
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(title),
                ),
                actions: const [],
              ),
            ];
          },
          body: Stack(
            children: [
              const BackgroundIcon(icon: Icons.movie),
              BlocBuilder<AllMoviesBloc, AllMoviesState>(
                builder: (context, state) {
                  if (state is AllMoviesError) {
                    return FadeIn(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CenteredMessage(
                            message: state.message,
                          ),
                          ElevatedButton(
                            onPressed: () => context.read<AllMoviesBloc>().add(FetchAllMovies(section)),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is AllMoviesInitial) {
                    return const CenteredMessage(
                      message: 'Please wait...',
                    );
                  } else if (state is AllMoviesLoading) {
                    return const CenteredMessage(
                      message: 'Loading...',
                    );
                  } else if (state is AllMoviesLoaded) {
                    return FadeIn(
                        child: AllMoviesSection(
                      movies: state.movies,
                      isMaxPage: state.isMaxPage,
                      section: section,
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
