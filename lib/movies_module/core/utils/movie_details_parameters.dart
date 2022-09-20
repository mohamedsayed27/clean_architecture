import 'package:equatable/equatable.dart';

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object> get props => [id];

}