import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/details/movie_details_bloc.dart';

import '../../../../../core/dependency_injection/di.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/details/movie_details.dart';
import '../../widgets/details/movie_image.dart';
import '../../widgets/details/movie_info.dart';
import '../../widgets/details/movie_overview.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, required this.id});

  final String id;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsBloc(getMovieDetails: sl())..add(GetMovieDetailsEvent(movie.id)),
      child: Scaffold(
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                MovieImage(movie: movie),
                const Header(title: 'Movie Info'),
                MovieInfo(movie: movie),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Header(title: 'Overview', delay: Duration(milliseconds: 1000)),
                MovieOverview(movie: movie),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Header(title: 'Movie Details', delay: Duration(milliseconds: 1000)),
                const MovieDetails(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Header(title: 'Cast', delay: Duration(milliseconds: 1000)),
                // MovieCast(movie: movie),
                // MovieTrailer(movie: movie),
                // MovieReviews(movie: movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
