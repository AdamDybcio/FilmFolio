import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/extensions/string_extensions.dart';

import '../../../../../common/widgets/dividers/custom_divider.dart';
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
      height: size.height * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Text(
              'Info',
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ),
          const CustomDivider(isVertical: false),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Column(
                    children: [
                      Text(
                        index == 0
                            ? 'Original Language'
                            : index == 1
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
                          index == 0
                              ? details.originalLanguage.toUpperCase()
                              : index == 1
                                  ? details.budget.toString().changeToMilion()
                                  : details.runtime.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
