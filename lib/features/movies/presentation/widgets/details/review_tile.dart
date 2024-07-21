import 'package:animate_do/animate_do.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/core/utils/strings/url_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/review_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/rate_widget.dart';
import 'package:readmore/readmore.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
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
                          backgroundImage: review.avatarPath.trim() != ''
                              ? ExtendedNetworkImageProvider(
                                  '${UrlStrings.imageUrl}${review.avatarPath}',
                                  cache: true,
                                  printError: false,
                                )
                              : null,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          child: review.avatarPath.trim() == '' ? const Icon(Icons.person) : null,
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
                              review.author,
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
                              RateWidget(rate: review.rating),
                              const SizedBox(width: 5),
                              Text(
                                '${review.rating} / 10',
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
                  review.content,
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
    );
  }
}
