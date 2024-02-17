import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Additional_Info_Item.dart';
import 'package:weather_app/Hourly_Forecast_Item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

 Future getCurrentWeather() async{
   String cityName='London';

  final res=await http.get(
   
    Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey'));
    print(res.body);
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh))
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
            width: double.infinity,
             child: Card( 
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10) ,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('300°K',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 16,),
                        Icon(
                          Icons.cloud,
                          size: 64,
                        ),
                        SizedBox(height: 16,),
                        Text('Rain',
                        style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ),
             ),
           ),
           const SizedBox(height: 20),
         const Text('Weather Forecast',
         style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
         ),),
          const SizedBox(height: 16,),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
              
                 
                  HourlyForecastItem(
                    hval1:'09:00',
                    hval2:'301.22',
                    icon:Icons.cloud
                  ),
                  HourlyForecastItem(hval1:'12:00',
                    hval2:'300.52',
                    icon:Icons.sunny),
                  HourlyForecastItem(hval1:'15:00',
                    hval2:'302.22',
                    icon:Icons.cloud),
                  HourlyForecastItem(hval1:'18:00',
                    hval2:'300.12',
                    icon:Icons.sunny),
                  HourlyForecastItem(hval1:'21:00',
                    hval2:'304.12',
                    icon:Icons.cloud),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Text('Additional Information',
         style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
         ),),
         const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

Additional_Info_Item(
  icon: Icons.water_drop,
  data: 'Humidity',
  val:'91'
),
Additional_Info_Item(icon: Icons.air,
  data: 'Wind Speed',
  val:'7.5'),
Additional_Info_Item(icon: Icons.beach_access,
  data: 'Pressure',
  val:'1000'),
          ],
         )

        ]
        ),
      ),
      
    );
  }
}

 

