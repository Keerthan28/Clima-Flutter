import 'dart:convert';

import 'package:http/http.dart' as http;
class Network{
  double longitude;
  double latitude;
  Network(this.latitude,this.longitude);
  Future getData() async
  {
    http.Response data= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a299adc51926f094012310a44b7f28d8');
    if(data.statusCode==200)
    {
      var temperature = jsonDecode(data.body)['main']['temp'];
      var id = jsonDecode(data.body)['weather'][0]['id'];
      var city = jsonDecode(data.body)['name'];
      print(temperature);
      print(id);
      print(city);
    }
    else print(data.statusCode);
  }
}