import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/features/movies/data/models/review_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/details/reviews/reviews_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/review_tile.dart';

class AllReviewsSection extends StatelessWidget {
  const AllReviewsSection({super.key, required this.reviews, required this.isMaxPage});

  final List<ReviewModel> reviews;
  final bool isMaxPage;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          controller: scrollController
            ..addListener(() {
              if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isMaxPage) {
                context.read<ReviewsBloc>().add(ReviewsLoadMore());
              }
            }),
          children: [
            for (final review in reviews) ReviewTile(review: review),
            if (!isMaxPage)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
                ),
              ),
            if (isMaxPage) SizedBox(height: size.height * 0.05),
          ],
        ));
  }
}
