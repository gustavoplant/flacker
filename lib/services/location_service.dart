import 'dart:async';

import 'package:flacker/model/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  // Keep track of current Location
  CurrentLocation _currentLocation;
  Location location = Location();
  // Continuously emit location updates
  StreamController<CurrentLocation> _locationController =
      StreamController<CurrentLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted != null) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(CurrentLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
              accuracy: locationData.accuracy,
              altitude: locationData.altitude,
              heading: locationData.heading,
              speed: locationData.speed,
              speedAccuracy: locationData.speedAccuracy,
              time: locationData.time,
            ));
            print("location changed! "
              + " LAT " + locationData.latitude.toString()
              + " LOG " + locationData.longitude.toString()
              + " TIME: " + locationData.time.toString());
          }
        });
      }
    });
  }

  Stream<CurrentLocation> get locationStream => _locationController.stream;

  Future<CurrentLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = CurrentLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
        accuracy: userLocation.accuracy,
        altitude: userLocation.altitude,
        heading: userLocation.heading,
        speed: userLocation.speed,
        speedAccuracy: userLocation.speedAccuracy,
        time: userLocation.time,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}
