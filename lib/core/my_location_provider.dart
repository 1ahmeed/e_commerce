

import 'package:location/location.dart';
class MyLocationProvider{
  Location locationManager =  Location();

  Future<bool> isServiceEnabled()async{
    //func to check gps enable or not
   var serviceEnabled= await locationManager.serviceEnabled();
   return serviceEnabled;

  }

  Future<bool> requestService()async{
    //func to request to open service and return true or false
    var serviceEnabled=await locationManager.requestService();
    return serviceEnabled;
  }

  Future<bool> isPermissionGranted()async{
    //func to request to open service and return true or false
    var permissionStatus=await locationManager.hasPermission();
    return permissionStatus== PermissionStatus.granted;
    // if(permissionStatus== PermissionStatus.granted) {
    //   return true;
    // }else {
    //   return false;
    // }
  }

  Future<bool> requestPermission()async{
    var permissionStatus=await locationManager.requestPermission();
    return permissionStatus==PermissionStatus.granted;
  }

  Future<LocationData?> getLocation()async{
    bool isServiceEnabled= await requestPermission();
    bool isPermissionGranted= await requestService();
    if(!isServiceEnabled || !isPermissionGranted){
      return null;
    }
    return locationManager.getLocation();
  }

  Stream<LocationData> trackUserLocation(){
    return locationManager.onLocationChanged;
  }
}
