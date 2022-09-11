
import 'package:clean_arch_ug/weather_module/domain/entities/weather.dart';

abstract class BaseWeatherRepository{
   Future<Weather> getWeatherByCityName(String cityName);
}