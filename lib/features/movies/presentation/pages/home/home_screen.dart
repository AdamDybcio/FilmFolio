import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/movie/custom_movie_backdrop.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genres/genres_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/now_playing/now_playing_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/top_rated/top_rated_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/custom_movie_carousel.dart';

import '../../blocs/home/backdrop/movie_backdrop_bloc.dart';
import '../../widgets/home/browse_movies.dart';
import '../../widgets/home/more_movies.dart';
import '../../widgets/home/movie_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieBackdropBloc>().add(const MovieBackdropRefreshEvent());
        context.read<MovieCarouselBloc>().add(const CarouselLoadEvent());
        context.read<GenresBloc>().add(GenresLoadEvent());
        context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent());
        context.read<UpcomingBloc>().add(FetchUpcoming());
        context.read<TopRatedBloc>().add(FetchTopRated());
        context.read<NowPlayingBloc>().add(FetchNowPlaying());
        return Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.525,
              child: const Stack(
                children: [
                  CustomMovieBackdrop(),
                  CustomMovieCarousel(),
                  MovieTitle(),
                ],
              ),
            ),
            const BrowseMovies(),
            const MoreMovies(),
          ],
        ),
      ),
    );
  }
}
