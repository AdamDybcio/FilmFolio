import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc_app/features/movies/data/datasources/remote/tmdb_datasource.dart';
import 'package:movie_bloc_app/features/movies/data/datasources/remote/tmdb_datasource_impl.dart';
import 'package:movie_bloc_app/features/movies/data/repositories/movie_repo_impl.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';

final sl = GetIt.I;

Future init() async {
  //Datasources
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<TmdbDatasource>(() => TmdbDatasourceImpl(sl()));
  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(tmdbDatasource: sl()));

  //Use cases
  sl.registerLazySingleton<GetTrending>(() => GetTrending(sl()));

  //Blocs
  sl.registerFactory(() => MovieCarouselBloc(getTrending: sl()));
}
