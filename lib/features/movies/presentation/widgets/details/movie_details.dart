import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Header(title: 'Movie Details', delay: Duration(seconds: 1)),
        Header(title: 'Cast', delay: Duration(seconds: 1)),
        Header(title: 'Production Companies', delay: Duration(seconds: 1)),
        Header(title: 'Videos', delay: Duration(seconds: 1)),
        Header(title: 'Reviews', delay: Duration(seconds: 1)),
      ],
    );
  }
}
