import 'dart:async';

import 'package:flacker/model/current_location.dart';
import 'package:location/location.dart';
import 'package:flacker/services/database_service.dart';

class LocationService {
  Location location = new Location();
  Database _db = new Database();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  CurrentLocation _currentLocation;

  LocationService() {

    //_connectDB();

    try {
      _enableLocation();
      _checkPermissions();
      _startLocation();

      location.requestPermission().then((granted) {
        if (_permissionGranted != null) {
          location.onLocationChanged.listen((locationData) {
            if (locationData != null) {

              var newLocation = new CurrentLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude,
                accuracy: locationData.accuracy,
                altitude: locationData.altitude,
                heading: locationData.heading,
                speed: locationData.speed,
                speedAccuracy: locationData.speedAccuracy,
                time: locationData.time,
              );

              print("location changed! "
                + " LAT " + locationData.latitude.toString()
                + " LOG " + locationData.longitude.toString()
                + " TIME: " + locationData.time.toString());

              _locationController.add(newLocation);

              // salva a localizacao no banco
              // newLocation.save();


            }
          });
        }
      });

      

    } catch (e) {
      print("EXCEPTION:" + e.toString());
    }
  }

  _connectDB() async {
    _db.openBox('posicoes');
  }

  // Function para habilitar o serviço de GPS
  _enableLocation() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        throw Exception("Unable to enable GPS!");
      }
    }
  }

  // Function para chegar se há permissão para obter posições do GPS
  _checkPermissions() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception("Sem permissão para acessar o GPS");
      }
    }
  }

  _startLocation() async {
    _locationData = await location.getLocation();
    await location.changeSettings(accuracy: LocationAccuracy.high, interval: 0, distanceFilter: 15);
  }

 StreamController<CurrentLocation> _locationController =
      StreamController<CurrentLocation>();

  Stream<CurrentLocation> get locationStream => _locationController.stream;
}
