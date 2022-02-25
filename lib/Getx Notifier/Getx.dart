
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Service/http connection.dart';

enum WeatherStatus{
  loading,
  initial,
  loaded,
  error
}



class WeatherData extends GetxController{
  WeatherStatus status = WeatherStatus.initial;
  var temp;
  var description;
  var descriptionWallpaper;
  var currently;
  var humidity;
  var wind;
  var cityName;
  var icon;
  var time;
  String city = "Daska";
  String errorMessage = "";



  Future<void> getWeatherData() async{

    status = WeatherStatus.loading;
    update();
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$city&units=imperial&appid=bc519cad7cd1d3fa4c1514d1fce33eab";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> data = await networkHelper.getData();


    this.temp = await data['main']['temp'];
    this.description = await data['weather'][0]['description'];
    this.descriptionWallpaper = await data['weather'][0]['description'].replaceAll(' ', '').toLowerCase();
    this.currently = await data['weather'][0]['main'];
    this.humidity = await data['main']['humidity'];
    this.wind = await data['wind']['speed'];
    this.cityName = await data['name'];
    this.icon = await data['weather'][0]['icon'];
    this.time = await data['timezone'];
    status = WeatherStatus.loaded;
    update();
  }



  Future<void> SearchWeatherData(city) async{
    try{
      status = WeatherStatus.loading;
      update();
      String url = "https://api.openweathermap.org/data/2.5/weather?q=$city&units=imperial&appid=bc519cad7cd1d3fa4c1514d1fce33eab";
      NetworkHelper networkHelper = NetworkHelper(url: url);
      Map<String, dynamic> data = await networkHelper.getData();


      this.temp = await data['main']['temp'];
      this.description = await data['weather'][0]['description'];
      this.descriptionWallpaper = await data['weather'][0]['description'].replaceAll(' ', '').toLowerCase();
      this.currently = await data['weather'][0]['main'];
      this.humidity = await data['main']['humidity'];
      this.wind = await data['wind']['speed'];
      this.cityName = await data['name'];
      this.icon = await data['icon'];
      this.icon = await data['weather'][0]['icon'];
      this.time = await data['timezone'];
      this.errorMessage = "";
      status = WeatherStatus.loaded;
      update();
    }

    catch(error){
      this.errorMessage = "Kindly place right city name";
      status = WeatherStatus.error;
      update();
    }



  }



}