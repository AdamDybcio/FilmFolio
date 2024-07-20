import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../common/styles/styles.dart';

class MovieTitleSection extends StatelessWidget {
  const MovieTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: SizedBox(
        height: size.height * 0.15,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 12, right: 12),
            child: Container(
              decoration: Styles(context: context).cardBoxDecoration.copyWith(
                    color: Theme.of(context).colorScheme.primary.withOpacity(1),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
