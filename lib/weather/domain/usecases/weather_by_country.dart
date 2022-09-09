import 'package:clean_arch_ug/weather/domain/entities/weather.dart';
import 'package:clean_arch_ug/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCountryName{
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCountryName(this.baseWeatherRepository);

  Future<Weather> execute(String name)async{
    return await baseWeatherRepository.getWeatherByCityName(name);
  }
}