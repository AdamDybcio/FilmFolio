import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:readmore/readmore.dart';

class MovieReviews extends StatelessWidget {
  const MovieReviews({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.tertiary,
                                blurRadius: 6,
                                spreadRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 65,
                                      height: 65,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: CircleAvatar(
                                          backgroundImage: details.reviews.reviews[i].avatarPath != ''
                                              ? CachedNetworkImageProvider(
                                                  '${ApiStrings.imageUrl}${details.reviews.reviews[i].avatarPath}',
                                                )
                                              : null,
                                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                          child: details.reviews.reviews[i].avatarPath == '' ? const Icon(Icons.person) : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            details.reviews.reviews[i].author,
                                            style: Theme.of(context).textTheme.titleMedium,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              if ((details.reviews.reviews[i].rating / 2) % 1 == 0)
                                                for (int j = 0; j < details.reviews.reviews[i].rating / 2; j++)
                                                  const FaIcon(
                                                    FontAwesomeIcons.solidStar,
                                                    color: Colors.yellow,
                                                    size: 15,
                                                  ),
                                              if ((details.reviews.reviews[i].rating / 2) % 1 != 0)
                                                for (int j = 1; j < details.reviews.reviews[i].rating / 2; j++)
                                                  const FaIcon(
                                                    FontAwesomeIcons.solidStar,
                                                    color: Colors.yellow,
                                                    size: 15,
                                                  ),
                                              if ((details.reviews.reviews[i].rating / 2) % 1 != 0)
                                                const FaIcon(
                                                  FontAwesomeIcons.starHalfStroke,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                ),
                                              if (details.reviews.reviews[i].rating != 0.0) const SizedBox(width: 5),
                                              if (details.reviews.reviews[i].rating != 0.0)
                                                Text(
                                                  '${details.reviews.reviews[i].rating} / 10',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.right,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: ReadMoreText(
                                  details.reviews.reviews[i].content,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  trimLines: 5,
                                  textAlign: TextAlign.left,
                                  colorClickableText: Theme.of(context).colorScheme.tertiary,
                                  moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        color: Theme.of(context).colorScheme.tertiary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: ' Show more',
                                  trimExpandedText: ' Show less',
                                ),
                              ),
                            ],
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
