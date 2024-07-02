import 'package:animate_do/animate_do.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (_, state) {
        if (state is MovieBackdropChanged) {
          return FadeIn(
            child: Blur(
              blur: 2,
              colorOpacity: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      ApiStrings.imageUrl + state.movie.backdropPath,
                    ),
                    fit: BoxFit.cover,
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
