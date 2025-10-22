import 'package:http/http.dart'as http;
import 'dart:convert';


class worker
{

  String location;

  //Constructor

  worker({required this.location})
  {
    location = this.location;
  }


  String ?temp;
  String ?humidity;
  String ?air_speed;
  String ?description;
  String ?main;
  String ?icon;


  //method
  Future<void> getData() async
  {
    try{
      http.Response response  =await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e");
      Map data = jsonDecode(response.body);

      print(data);
      //Getting Temp,Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

//Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;


      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];




      //Assigning Values
      temp = getTemp.toString(); //C
      humidity = getHumidity; // %
      air_speed = getAir_speed.toString(); //km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();

    }catch(e)
    {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }



  }


}
