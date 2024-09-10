


import 'package:location/location.dart';

class LocationService{
Location location =Location();

Future<void> checkAndRequestLocationServices() async {
 var isServicesEnable =await location.serviceEnabled();
 if(!isServicesEnable){
   isServicesEnable=await location.requestService();
 }
 if(!isServicesEnable){
   throw LocationServiceException;
 }

 }
Future<void>  checkAndRequestLocationPermission() async {
  var permissionStatus=await location.hasPermission();

  if(permissionStatus==PermissionStatus.deniedForever){
    throw LocationPermissionException();

  }
  if(permissionStatus==PermissionStatus.denied){
     permissionStatus=await location.requestPermission();
     if (permissionStatus!=PermissionStatus.granted){
       throw LocationPermissionException();
     }
  }


  }

void getRealTimeLocationData(void Function(LocationData)?onData)async{
  await checkAndRequestLocationServices();
  await checkAndRequestLocationPermission();
  location.onLocationChanged.listen(onData);
}

Future<LocationData>getLocation()async{
  await checkAndRequestLocationServices();
  await checkAndRequestLocationPermission();
  return await location.getLocation();

}
}

class LocationPermissionException {}
class LocationServiceException {}
