import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../domain/entities/params/params.dart';
import '../../../domain/usecases/get_movie_details.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetMovieDetails getMovieDetails;

  DetailsBloc({required this.getMovieDetails}) : super(DetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const DetailsError('No internet connection.'));
        return;
      }

      emit(DetailsLoading());

      try {
        final result = await getMovieDetails(Params(id: event.movieId));
        emit(DetailsLoaded(result));
      } catch (e) {
        emit(const DetailsError('Cannot load movie details.'));
        return;
      }
    });
  }
}
