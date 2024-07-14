import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:readmore/readmore.dart';

class MovieOverviewSection extends StatelessWidget {
  const MovieOverviewSection({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(title: 'Overview'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: Styles(context: context).cardBoxDecoration.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ReadMoreText(
                overview,
                style: Theme.of(context).textTheme.titleMedium,
                trimLines: 10,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
