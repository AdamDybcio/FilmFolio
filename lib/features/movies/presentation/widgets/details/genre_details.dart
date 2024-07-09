import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/dividers/custom_divider.dart';

import '../../../data/models/movie_details_model.dart';

class GenreDetails extends StatelessWidget {
  const GenreDetails({
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
              'Genres',
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ),
          const CustomDivider(isVertical: false),
          Expanded(
            child: ListView.builder(
              itemCount: details.genres.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Center(
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.primary,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          details.genres[index].name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
