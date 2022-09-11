import 'package:clean_arch_ug/weather_module/data/datasource/remote_dataresource.dart';
import 'package:clean_arch_ug/weather_module/domain/entities/weather.dart';
import 'package:clean_arch_ug/weather_module/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseWeatherRemoteDataResource baseRemoteDataResource;

  WeatherRepository(this.baseRemoteDataResource);
  @override
  Future<Weather> getWeatherByCityName(String cityName) async{
    return (await baseRemoteDataResource.getWeatherByCountryName(cityName))!;
  }

}