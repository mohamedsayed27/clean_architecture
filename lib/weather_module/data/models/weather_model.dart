
import 'package:clean_arch_ug/weather_module/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.id,
    super.cityName,
    super.description,
    super.pressure,
    super.main,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        json['id'],
        json['name'],
        json['weather'][0]['description'],
        json['main']['pressure'],
        json['weather'][0]['main']);
  }

}
