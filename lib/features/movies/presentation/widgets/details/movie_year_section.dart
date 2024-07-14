import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/core/utils/extensions/string_extensions.dart';

class MovieYearSection extends StatelessWidget {
  const MovieYearSection({super.key, required this.year});

  final String year;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: SizedBox(
        height: size.height * 0.1,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 12, right: 12),
            child: Container(
              decoration: Styles(context: context).cardBoxDecoration.copyWith(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Release Date: ${year.displayDate()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
