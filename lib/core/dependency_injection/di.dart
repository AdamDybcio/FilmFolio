import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/core/settings/user_settings.dart';
import 'package:movie_bloc_app/features/movies/data/datasources/remote/tmdb_datasource.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/data/repositories/movie_repo_impl.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_genres.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_nowplaying.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_search_movies.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_popular.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_toprated.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/carousel_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home/home_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';

import '../../features/movies/presentation/blocs/details/details_bloc.dart';

final sl = GetIt.instance;

Future init() async {
  //Datasources
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<TmdbDatasource>(() => TmdbDatasource(sl()));
  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(tmdbDatasource: sl()));

  //Others
  sl.registerSingleton<TextEditingController>(TextEditingController(), instanceName: 'search_controller');
  sl.registerSingleton<List<MovieModel>>([], instanceName: 'search_movies');

  sl.registerSingleton<List<MovieModel>>([], instanceName: 'bookmarks');
  sl.registerSingleton<List<int>>([], instanceName: 'bookmarkIds');

  sl.registerLazySingleton<UserSettings>(() => UserSettings());

  //Use cases
  sl.registerLazySingleton<GetPopular>(() => GetPopular(sl()));
  sl.registerLazySingleton<GetUpcoming>(() => GetUpcoming(sl()));
  sl.registerLazySingleton<GetGenres>(() => GetGenres(sl()));
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(sl()));
  sl.registerLazySingleton<GetSearchMovies>(() => GetSearchMovies(sl()));
  sl.registerLazySingleton<GetNowplaying>(() => GetNowplaying(sl()));
  sl.registerLazySingleton<GetToprated>(() => GetToprated(sl()));
  sl.registerLazySingleton<GetTrending>(() => GetTrending(sl()));

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
      getNowPlaying: sl(),
      getTopRated: sl(),
      getTrending: sl(),
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

  sl.registerFactory(() => SettingsBloc());
}
