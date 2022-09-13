import 'package:clean_arch_ug/movies_module/core/services/services_locator.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_event.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl())..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }

}
