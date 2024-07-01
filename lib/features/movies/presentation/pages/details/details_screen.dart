import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import '../../../data/models/movie_model.dart';
import '../../widgets/details/movie_image.dart';
import '../../widgets/details/movie_info.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, required this.id});

  final String id;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              hasBackButton: true,
              title: FittedBox(fit: BoxFit.fitWidth, child: Text(movie.title)),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieImage(movie: movie),
              const Header(title: 'Movie Info'),
              MovieInfo(movie: movie),
              const Header(title: 'Overview'),
              // MovieOverview(movie: movie),
              // MovieCast(movie: movie),
              // MovieTrailer(movie: movie),
              // MovieReviews(movie: movie),
            ],
          ),
        ),
      ),
    );
  }
}
