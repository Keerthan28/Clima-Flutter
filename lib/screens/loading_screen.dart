
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;
  void getLocation() async
  {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: '+location.lat.toString());
    print('longitude: '+location.lon.toString());
    this.lat = location.lat;
    this.lon = location.lon;
    Network network = Network(lat,lon);
    await network.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
