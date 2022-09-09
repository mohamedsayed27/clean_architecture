import 'package:clean_arch_ug/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository{
   Future<Weather> getWeatherByCityName(String cityName);
}