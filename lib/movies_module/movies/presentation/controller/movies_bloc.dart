import 'package:bloc/bloc.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_event.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final GetNowMoviesPlayingUseCase getNowMoviesPlayingUseCase;
  MoviesBloc(this.getNowMoviesPlayingUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      final result = await getNowMoviesPlayingUseCase.execute();
      print(result);
    });
  }
}
