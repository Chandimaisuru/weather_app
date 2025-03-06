import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationServices {

  Future<String> getCityName()async{

    //get permission

    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    // get current location

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best
    );

    print(position.latitude);
    print(position.longitude);


   // convert the location to list of placemark
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  
   // extract city name

   String cityName = placemark[0].locality!;

   print(cityName);
   
   return cityName ;

  }
}