import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/data/models/video_model.dart';

class MovieVideoSection extends StatelessWidget {
  const MovieVideoSection({super.key, required this.videos});

  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Trailer'),
      ],
    );
  }
}
