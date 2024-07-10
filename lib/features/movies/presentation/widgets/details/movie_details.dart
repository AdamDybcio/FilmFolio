import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/general_info.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/movie_reviews.dart';

import 'movie_cast.dart';
import 'movie_trailer.dart';
import 'production_companies.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(title: 'General Info', delay: Duration(seconds: 1)),
        GeneralInfo(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Cast', delay: Duration(seconds: 1)),
        MovieCast(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Production Companies', delay: Duration(seconds: 1)),
        ProductionCompanies(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Trailer', delay: Duration(seconds: 1)),
        MovieTrailer(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Reviews', delay: Duration(seconds: 1)),
        MovieReviews(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    );
  }
}
