import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/adult_widget.dart';
import 'package:movie_bloc_app/common/widgets/movie/mark_widget.dart';
import 'package:movie_bloc_app/common/widgets/movie/vote_avg_widget.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class MovieCarouselCard extends StatelessWidget {
  const MovieCarouselCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push('/details/${movie.id}', extra: movie);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 16),
        child: Container(
          height: size.height * 0.4,
          decoration: Styles(context: context).cardBoxDecoration.copyWith(
                image: movie.posterPath != ''
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(ApiStrings.imageUrl + movie.posterPath),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
          child: Stack(
            children: [
              if (movie.posterPath == '')
                SizedBox(
                  height: size.height * 0.4,
                  child: const FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.film),
                    ),
                  ),
                ),
              MarkWidget(movie: movie),
              VoteAvgWidget(voteAvg: movie.voteAverage, alignment: Alignment.bottomRight),
              if (movie.adult) const AdultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
