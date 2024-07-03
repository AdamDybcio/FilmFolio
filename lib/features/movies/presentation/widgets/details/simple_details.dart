import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/extensions/string_extensions.dart';

import '../../../data/models/movie_details_model.dart';

class SimpleDetails extends StatelessWidget {
  const SimpleDetails({
    super.key,
    required this.details,
  });

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < 3; i++)
            Column(
              children: [
                Text(
                  i == 0
                      ? 'Original Language'
                      : i == 1
                          ? 'Budget (\$)'
                          : 'Runtime (min)',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                  ),
                  child: Text(
                    i == 0
                        ? details.originalLanguage.toUpperCase()
                        : i == 1
                            ? details.budget.toString().changeToMilion()
                            : details.runtime.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
