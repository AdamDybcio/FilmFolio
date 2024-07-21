import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/strings/url_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:blur/blur.dart';

import '../../blocs/home/carousel/carousel_bloc.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        child: BlocBuilder(
      bloc: context.read<CarouselBloc>(),
      builder: (context, state) {
        if (state is CarouselChanged) {
          return Blur(
            blur: 2,
            colorOpacity: 0.25,
            blurColor: Colors.black,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: movies[state.index].backdropPath != ''
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(UrlStrings.imageUrl + movies[state.index].backdropPath),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    ));
  }
}
