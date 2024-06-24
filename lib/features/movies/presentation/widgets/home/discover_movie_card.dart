import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_entity.dart';

class DiscoverMovieCard extends StatelessWidget {
  const DiscoverMovieCard({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: Center(
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(ApiStrings.imageUrl + movie.posterPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
