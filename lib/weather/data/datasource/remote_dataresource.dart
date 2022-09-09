import 'dart:convert';

import 'package:clean_arch_ug/weather/core/utils/constants.dart';
import 'package:dio/dio.dart';

import '../models/weather_model.dart';

abstract class BaseRemoteDataResource{
  Future<WeatherModel?> getWeatherByCountryName(String cityName);
}

class RemoteDataResource implements BaseRemoteDataResource{
  @override
  Future<WeatherModel?> getWeatherByCountryName(String cityName) async{
      try {
        var response = await Dio().get('${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.apiKey}');
        return WeatherModel.fromJson(response.data);
      } catch (e) {
        print(e);
        return null;
      }
  }

}