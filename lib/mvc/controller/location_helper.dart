import 'package:geolocator/geolocator.dart';

class LocationHelper {
  void isLocationEnabled() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
    }
  }

  Future<Position> getPermissionLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      Geolocator.requestPermission();
      // Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }

  static Future<Position?> getMyCurrentLocation() async {
    return Geolocator.getLastKnownPosition().whenComplete(() {});
  }
}
