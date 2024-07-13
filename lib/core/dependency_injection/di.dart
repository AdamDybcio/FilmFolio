import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/features/movies/data/datasources/remote/tmdb_datasource.dart';
import 'package:movie_bloc_app/features/movies/data/datasources/remote/tmdb_datasource_impl.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/data/repositories/movie_repo_impl.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_genres.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_search_movies.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_popular.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/carousel_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home/home_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

import '../../features/movies/presentation/blocs/details/details_bloc.dart';

final sl = GetIt.I;

Future init() async {
  //Datasources
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<TmdbDatasource>(() => TmdbDatasourceImpl(sl()));
  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(tmdbDatasource: sl()));

  //Others
  sl.registerSingleton<TextEditingController>(TextEditingController(), instanceName: 'search_controller');
  sl.registerSingleton<List<MovieModel>>([], instanceName: 'search_movies');

  sl.registerSingleton<List<MovieModel>>([], instanceName: 'bookmarks');
  sl.registerSingleton<List<int>>([], instanceName: 'bookmarkIds');

  //Use cases
  sl.registerLazySingleton<GetPopular>(() => GetPopular(sl()));
  sl.registerLazySingleton<GetUpcoming>(() => GetUpcoming(sl()));
  sl.registerLazySingleton<GetGenres>(() => GetGenres(sl()));
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(sl()));
  sl.registerLazySingleton<GetSearchMovies>(() => GetSearchMovies(sl()));

  //Blocs
  sl.registerFactory(() => NavBarBloc());
  sl.registerFactory(() => CarouselBloc());

  sl.registerFactory(() => BookmarksBloc(
        bookmarks: sl(instanceName: 'bookmarks'),
        bookmarkIds: sl(instanceName: 'bookmarkIds'),
      ));

  //Pages Blocs
  sl.registerFactory(
    () => HomeBloc(
      getGenres: sl(),
      getUpcoming: sl(),
      getPopular: sl(),
    ),
  );

  sl.registerFactory(() => DetailsBloc(getMovieDetails: sl()));

  sl.registerFactory(
    () => SearchBloc(
      getSearchMovies: sl(),
      controller: sl(instanceName: 'search_controller'),
      movies: sl(instanceName: 'search_movies'),
    ),
  );
}
