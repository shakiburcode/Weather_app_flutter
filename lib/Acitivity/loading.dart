import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ddd/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  String city = "Indore";
  String ?temp;
  String ?hum;
  String ?air_speed;
  String ?des;
  String ?main;
  String ?icon;

  void startApp(String city) async
  {
    worker instance  = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;


    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,




      } );
    });

  }

  @override
  void initState() {
    // TODO: implement initState



    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    //Map search = ModalRoute.of(context).settings.arguments;
    final Map search = ModalRoute.of(context)!.settings.arguments as Map;


    if(search?.isNotEmpty ?? false)
    {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset("images/mlogo.png",height: 240,width: 240,),

              Text("Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
              SizedBox(height: 10,),
              Text("Made By Shakibur",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              SizedBox(height: 30,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],

    );
  }
}
