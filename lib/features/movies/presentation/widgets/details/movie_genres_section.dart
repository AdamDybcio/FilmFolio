import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import '../../../data/models/genre_model.dart';

class MovieGenresSection extends StatelessWidget {
  const MovieGenresSection({super.key, required this.genres});

  final List<GenreModel> genres;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Genres'),
        SizedBox(
          height: size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index];
              return FadeIn(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    label: AutoSizeText(genre.name, maxFontSize: 24),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
