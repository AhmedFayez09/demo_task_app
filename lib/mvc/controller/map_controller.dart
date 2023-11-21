import 'package:flutter_application_1/mvc/controller/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
Rx<Position?> position = Rx<Position?>(null);
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentLocation();
    getPermissionLocation();
  }
  void getCurrentLocation() async {
    position.value = await LocationHelper.getMyCurrentLocation();
    update();
  }





  Future<Position> getPermissionLocation() {
    return LocationHelper().getPermissionLocation().then((value) {
      update();
      return value;
    });
  }

  void checkIsLocationEnabled() {
    LocationHelper().isLocationEnabled();
  }
}
