import 'package:flutter/material.dart';

class CustomMovieList extends StatelessWidget {
  const CustomMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Text('Movie Item');
      },
    );
  }
}
