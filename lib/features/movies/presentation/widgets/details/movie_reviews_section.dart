import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/features/movies/data/models/reviews_result_model.dart';

import '../../../../../common/widgets/texts/header.dart';
import 'review_tile.dart';

class MovieReviewsSection extends StatelessWidget {
  const MovieReviewsSection({super.key, required this.reviews, required this.movieId});

  final ReviewsResultModel reviews;
  final String movieId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        Header(
          title: 'Reviews',
          onTap: reviews.reviews.length > 3
              ? () {
                  context.push('/reviews/$movieId');
                }
              : null,
        ),
        if (reviews.reviews.length <= 3)
          for (int i = 0; i < reviews.reviews.length; i++) ReviewTile(review: reviews.reviews[i]),
        if (reviews.reviews.length > 3)
          for (int i = 0; i < 3; i++) ReviewTile(review: reviews.reviews[i]),
      ],
    );
  }
}
