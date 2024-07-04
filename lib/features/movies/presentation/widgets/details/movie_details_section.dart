import 'package:flutter/widgets.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../../../common/widgets/texts/header.dart';
import 'movie_details.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDetails(movie: movie),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Header(title: 'Cast', delay: Duration(milliseconds: 1000)),
      ],
    );
  }
}
