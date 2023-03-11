import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late String dayTime; // currently day time

  WorldTime({ required this.location, required this.flag, required this.url});


  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);

      // create  date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      print(now);

      // set time property
      if(now.hour >= 3 && now.hour < 10) {
        dayTime = 'pagi';
      } else if(now.hour >= 10 && now.hour < 15) {
        dayTime = 'siang';
      } else if(now.hour >= 15 && now.hour < 18) {
        dayTime = 'sore';
      } else {
        dayTime = 'malam';
      }
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }

}

