import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';

import '../../../data/models/genre_model.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({super.key, required this.genres});

  final List<GenreModel> genres;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: double.infinity,
      child: ListView.builder(
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final genre = genres[index];
          return GestureDetector(
            onTap: () {
              context.push('/genre/${genre.id}', extra: genre.name);
            },
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: Styles(context: context).cardBoxDecoration.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          image: const DecorationImage(
                            image: AssetImage('assets/placeholders/genre_placeholder.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: Styles(context: context).cardBoxDecoration.copyWith(
                              color: Theme.of(context).colorScheme.primary.withOpacity(1),
                            ),
                        child: Text(
                          genre.name,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
