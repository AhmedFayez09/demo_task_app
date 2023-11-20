import 'dart:developer';

import 'package:flutter_application_1/location/location/helper/location_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of(context);
  Position? position;

  Future<void> getCurrentLocationInCompleteProfile() async {
    emit(GetLocationLoading());

    position = await LocationHelper.getMyCurrentLocation().whenComplete(() {
      emit(GetLocationSuccess());
      log("Success ");
    }).catchError((e) {
      log("Error in Get Location is :$e");
      emit(GetLocationError());
      return e;
    });
  }

  Future<Position> getPermissionLocation() {
    return LocationHelper().getPermissionLocation().then((value) {
      emit(GetPermissionLocationSuccess());
      return value;
    });
  }

  void checkIsLocationEnabled() {
    LocationHelper().isLocationEnabled();
  }
}
