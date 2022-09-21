class MovieAppConstants{
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'b349797e9db210bd95fce647cff56689';
  static const String nowPlayingMoviesEndPoint = 'movie/now_playing';
  static const String popularMoviesEndPoint = 'movie/popular';
  static const String topRatedMoviesEndPoint = 'movie/top_rated';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String movieDetailsPath(int movieId) {
    return '${baseUrl}movie/$movieId?api_key=$apiKey';
  }
  static String recommendationPath(int movieId) {
    return '${baseUrl}movie/$movieId/recommendations?api_key=$apiKey';
  }
  static String imageUrl(String path) => '$baseImageUrl$path';
}
