import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print("getCurrentLocation(), latitude: $latitude");
      print("getCurrentLocation(), longitude: $longitude");
    } catch (e) {
      print(e);
    }
  }
}
