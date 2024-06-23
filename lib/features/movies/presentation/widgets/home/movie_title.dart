import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (_, state) {
        if (state is MovieBackdropChanged) {
          return FadeIn(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    state.movie.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          backgroundColor: AppColors.blackHowl.withOpacity(0.5),
                          color: AppColors.perfume,
                        ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
