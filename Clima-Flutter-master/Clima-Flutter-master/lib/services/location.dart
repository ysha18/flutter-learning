import 'package:geolocator/geolocator.dart';

class Location{

  double longitude, latitude;

  Location({this.longitude, this.latitude});

  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude =position.latitude;
    } catch(e){
      print(e);
    }
  }


}