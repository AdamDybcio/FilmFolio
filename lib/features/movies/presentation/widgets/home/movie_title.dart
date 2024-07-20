import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                  decoration: Styles(context: context).cardBoxDecoration.copyWith(
                        color: Theme.of(context).colorScheme.primary.withOpacity(1),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      movies[state.index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
