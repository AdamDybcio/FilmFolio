import 'package:animate_do/animate_do.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';
import 'package:movie_bloc_app/common/widgets/movie/vote_avg_widget.dart';

import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: SizedBox(
        height: size.height * 0.4,
        child: Stack(
          children: [
            Blur(
              colorOpacity: 0.25,
              blurColor: Colors.black,
              child: Container(
                width: double.infinity,
                height: size.height * 0.4,
                decoration: Styles(context: context, imagePath: movie.backdropPath).cardBoxDecoration,
              ),
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.35,
                child: MovieCard(
                  movie: movie,
                  showInfo: false,
                  aspectRatio: 10 / 16,
                  touchable: false,
                ),
              ),
            ),
            VoteAvgWidget(
              alignment: Alignment.bottomRight,
              voteAvg: movie.voteAverage,
              width: 70,
              height: 70,
              hasShadow: true,
              padding: const EdgeInsets.only(bottom: 20, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
