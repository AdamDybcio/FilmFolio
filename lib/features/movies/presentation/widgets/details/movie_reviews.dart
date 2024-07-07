import 'package:flutter/material.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../common/widgets/texts/header.dart';

class MovieReviews extends StatelessWidget {
  const MovieReviews({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: 'Reviews (${details.reviews.reviews.length})', delay: const Duration(seconds: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: details.reviews.reviews.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'No reviews available.',
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Column(
                  children: [
                    for (int i = 0; i < details.reviews.reviews.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            details.reviews.reviews[i].author,
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}
