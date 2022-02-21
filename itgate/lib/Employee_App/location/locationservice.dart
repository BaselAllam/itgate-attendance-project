import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:itgate/Employee_App/location/user.dart';
import 'package:location/location.dart';
//import 'package:location_app/userlocation.dart';

class LocationService {
  UserLocation? _currentLocation;
  var location = Location();
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) async {
      if (granted != null) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        Position _currentPosition = await Geolocator.getCurrentPosition();
        _locationController.add(UserLocation(
          latitude: _currentPosition.latitude,
          longitude: _currentPosition.longitude,
        ));
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation!;
  }
}
//////////////////////////////////////
