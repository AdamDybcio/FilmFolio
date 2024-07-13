import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../blocs/home/carousel/carousel_bloc.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<CarouselBloc>(),
      builder: (context, state) {
        if (state is CarouselChanged) {
          return FadeIn(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 12, right: 12),
                child: Container(
                  decoration: Styles(context: context).cardBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movies[state.index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
