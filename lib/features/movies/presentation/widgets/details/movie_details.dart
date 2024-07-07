import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/general_info.dart';

import 'movie_cast.dart';

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
        if (details.actors.isNotEmpty) const Header(title: 'Cast', delay: Duration(seconds: 1)),
        if (details.actors.isNotEmpty) MovieCast(details: details),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Production Companies', delay: Duration(seconds: 1)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Videos', delay: Duration(seconds: 1)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Reviews', delay: Duration(seconds: 1)),
      ],
    );
  }
}
