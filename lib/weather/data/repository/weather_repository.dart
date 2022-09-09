import 'package:clean_arch_ug/weather/data/datasource/remote_dataresource.dart';
import 'package:clean_arch_ug/weather/domain/entities/weather.dart';
import 'package:clean_arch_ug/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataResource baseRemoteDataResource;

  WeatherRepository(this.baseRemoteDataResource);
  @override
  Future<Weather> getWeatherByCityName(String cityName) async{
    return (await baseRemoteDataResource.getWeatherByCountryName(cityName))!;
  }

}