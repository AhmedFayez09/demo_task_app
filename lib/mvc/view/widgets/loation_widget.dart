import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mvc/controller/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  Completer<GoogleMapController> mapController = Completer();
  final MapController getController = Get.put(MapController());

  @override
  void dispose() {
    getController.dispose(); // Dispose of the MapController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 3,
              spreadRadius: 0,
              color: Color(0XFF616161),
            ),
          ],
        ),
        child: Container(
          height: 398,
          width: 394,
          margin: const EdgeInsetsDirectional.all(10),
          child: Obx(
            () {
              getController.getCurrentLocation();
              getController.getPermissionLocation();
              var position = getController.position.value; // Access the observable position variable

              return position == null
                  ? const Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : GoogleMap(
                      mapType: MapType.terrain,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 7,
                        bearing: 0.0,
                        tilt: 0.0,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}













  // @override
  // void initState() {
  //   getUserPermission();
  //   super.initState();
  // }

  // void getUserPermission() async {
  //   // await context.read<LocationCubit>().getPermissionLocation();
  //   await getController.getPermissionLocation();
  // }