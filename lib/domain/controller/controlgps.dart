import 'package:get/get.dart';
import 'package:location/location.dart';

class ControlGps extends GetxController {
  final _lat = "".obs;
  final _lon = "".obs;

  String get lat => _lat.value;
  String get lon => _lon.value;

  Future<void> obtenerubicacion() async {
    final LocationData posicion;
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    posicion = await location.getLocation();
    _lon.value = posicion.longitude.toString();
    _lat.value = posicion.latitude.toString();
  }
}
