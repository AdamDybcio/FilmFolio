import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'years_event.dart';
part 'years_state.dart';

class YearsBloc extends Bloc<YearsEvent, YearsState> {
  YearsBloc() : super(YearsInitial()) {
    on<YearsChangeEvent>((event, emit) {
      emit(YearsChanged(event.year));
    });
  }
}
