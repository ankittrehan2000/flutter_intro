import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;  //location name for ui
  String time; //time in location
  String flag;
  String url; //end location for the api request
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url }); //recieve this when we create a new instance of the class

  Future<void> getTime() async{  //added future to be used for an async call from other files, it says I will return void but only when the function is complete


    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      String dateTime = data['datetime'];
      //print(data['utc_offset']);
      String offSet = data['utc_offset'].substring(0,3);
      //print(dateTime);
      //print(offSet);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      //print(now);
      isDayTime = now.hour > 8 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print(e);
      time = 'Could not get time';
    }
  }


}

