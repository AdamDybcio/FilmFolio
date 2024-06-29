import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_appbar.dart';

import '../../../data/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, required this.id});

  final String id;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              hasBackButton: true,
              title: FittedBox(fit: BoxFit.fitWidth, child: Text(movie.title)),
            ),
          ];
        },
        body: const SingleChildScrollView(),
      ),
    );
  }
}
