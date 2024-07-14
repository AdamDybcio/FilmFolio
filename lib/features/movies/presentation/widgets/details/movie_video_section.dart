import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import '../../../../../common/widgets/youtube_player/yt_player_widget.dart';

class MovieVideoSection extends StatelessWidget {
  const MovieVideoSection({super.key, required this.trailer});

  final String trailer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Trailer'),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: YtPlayerWidget(trailerId: trailer),
            ),
          ),
        ),
      ],
    );
  }
}
