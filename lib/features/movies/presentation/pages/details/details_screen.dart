import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/appbars_navbars/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/movie/mark_widget.dart';

import '../../../../../core/dependency_injection/di.dart';
import '../../../data/models/movie_model.dart';
import '../../blocs/details/details_bloc.dart';
import '../../widgets/details/details_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, required this.id});

  final String id;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DetailsBloc>()..add(GetMovieDetailsEvent(movie.id)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(
                hasBackButton: true,
                title: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('Details'),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: MarkWidget(movie: movie, align: false),
                  ),
                ],
              ),
            ];
          },
          body: DetailsSection(movie: movie),
        ),
      ),
    );
  }
}
