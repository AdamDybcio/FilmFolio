import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/widgets/appbars_navbars/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/icons/background_icon.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/details/reviews/reviews_bloc.dart';

import '../../widgets/details/all_reviews_section.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.movieId});

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ReviewsBloc>()..add(ReviewsFetch(int.parse(movieId))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const CustomAppBar(
                hasBackButton: true,
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('All Reviews'),
                ),
                actions: [],
              ),
            ];
          },
          body: Stack(
            children: [
              const BackgroundIcon(icon: FontAwesomeIcons.comment),
              BlocBuilder<ReviewsBloc, ReviewsState>(
                builder: (context, state) {
                  if (state is ReviewsError) {
                    return FadeIn(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CenteredMessage(
                            message: state.message,
                          ),
                          ElevatedButton(
                            onPressed: () => context.read<ReviewsBloc>().add(ReviewsFetch(int.parse(movieId))),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is ReviewsInitial) {
                    return const CenteredMessage(
                      message: 'Please wait...',
                    );
                  } else if (state is ReviewsLoading) {
                    return const CenteredMessage(
                      message: 'Loading...',
                    );
                  } else if (state is ReviewsLoaded) {
                    return FadeIn(
                        child: AllReviewsSection(
                      reviews: state.reviews,
                      isMaxPage: state.isMaxPage,
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
