import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/dividers/custom_divider.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/genre_details.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/details/simple_details.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: FadeIn(
          delay: const Duration(seconds: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleDetails(details: details),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.025),
                child: const CustomDivider(isVertical: true),
              ),
              GenreDetails(details: details),
            ],
          ),
        ),
      ),
    );
  }
}
