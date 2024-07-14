import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/features/movies/data/models/reviews_result_model.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/texts/header.dart';
import '../../../../../core/utils/strings/api_strings.dart';
import 'rate_widget.dart';

class MovieReviewsSection extends StatelessWidget {
  const MovieReviewsSection({super.key, required this.reviews});

  final ReviewsResultModel reviews;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Reviews'),
        for (int i = 0; i < reviews.reviews.length; i++)
          FadeIn(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: Styles(context: context).cardBoxDecoration.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: Styles(context: context).cardBoxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(65),
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: CircleAvatar(
                                backgroundImage: reviews.reviews[i].avatarPath != ''
                                    ? CachedNetworkImageProvider(
                                        '${ApiStrings.imageUrl}${reviews.reviews[i].avatarPath}',
                                      )
                                    : null,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                child: reviews.reviews[i].avatarPath == '' ? const Icon(Icons.person) : null,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: Text(
                                    reviews.reviews[i].author,
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    RateWidget(rate: reviews.reviews[i].rating),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${reviews.reviews[i].rating} / 10',
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
                        reviews.reviews[i].content,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                        trimLines: 5,
                        textAlign: TextAlign.left,
                        colorClickableText: Theme.of(context).colorScheme.tertiary,
                        moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
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
          ),
      ],
    );
  }
}
