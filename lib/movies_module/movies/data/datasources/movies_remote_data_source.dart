import 'package:clean_arch_ug/movies_module/core/error/exception.dart';
import 'package:clean_arch_ug/movies_module/core/network/error_message_model.dart';
import 'package:clean_arch_ug/movies_module/core/utils/app_constants.dart';
import 'package:clean_arch_ug/movies_module/core/utils/movie_details_parameters.dart';
import 'package:clean_arch_ug/movies_module/core/utils/recommendation_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/data/models/movie_details_model.dart';
import 'package:clean_arch_ug/movies_module/movies/data/models/movies_model.dart';
import 'package:clean_arch_ug/movies_module/movies/data/models/recommendation_model.dart';
import 'package:dio/dio.dart';

abstract class BaseMoviesRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendedMovies(RecommendationParameters parameters);

}


class MoviesRemoteDatasource extends BaseMoviesRemoteDatasource {

  List<MoviesModel> nowPlayingMoviesList = [];
  List<MoviesModel> popularMoviesList = [];
  List<MoviesModel> topRatedMoviesList = [];
  List<RecommendationModel> recommendationList = [];


  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(
        '${MovieAppConstants.baseUrl}${MovieAppConstants.nowPlayingMoviesEndPoint}?api_key=${MovieAppConstants.apiKey}');

    if (response.statusCode == 200) {
      for (var element in response.data['results']) {
        nowPlayingMoviesList.add(MoviesModel.fromJson(element));
      }
      return nowPlayingMoviesList;
    } else {
      throw ServerModelException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    Response response = await Dio().get(
        '${MovieAppConstants.baseUrl}${MovieAppConstants.popularMoviesEndPoint}?api_key=${MovieAppConstants.apiKey}');

    if (response.statusCode == 200) {
      for (var element in response.data['results']) {
        popularMoviesList.add(MoviesModel.fromJson(element));
      }
      return popularMoviesList;
    } else {
      throw ServerModelException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    Response response = await Dio().get(
        '${MovieAppConstants.baseUrl}${MovieAppConstants.topRatedMoviesEndPoint}?api_key=${MovieAppConstants.apiKey}');

    if (response.statusCode == 200) {
      for (var element in response.data['results']) {
        topRatedMoviesList.add(MoviesModel.fromJson(element));
      }
      return topRatedMoviesList;
    } else {
      throw ServerModelException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(
        MovieAppConstants.movieDetailsPath(parameters.id));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerModelException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendedMovies(RecommendationParameters parameters) async{
    final response = await Dio().get(
        MovieAppConstants.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      for (var element in response.data['results']) {
        recommendationList.add(RecommendationModel.fromJson(element));
      }
      return recommendationList;
    } else {
      throw ServerModelException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
