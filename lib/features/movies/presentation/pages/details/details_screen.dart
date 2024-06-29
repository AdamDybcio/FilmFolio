import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, required this.id});

  final String id;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
