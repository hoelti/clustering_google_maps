import 'dart:math';

import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show LatLng, InfoWindow;

class LatLngAndGeohash {
  final LatLng location;
  final InfoWindow infoWindow;
  final String name;
  String geohash;

  LatLngAndGeohash(this.location, this.infoWindow, this.name) {
    geohash = Geohash.encode(location.latitude, location.longitude);
  }

  LatLngAndGeohash.fromMap(Map<String, dynamic> map)
      : location = LatLng(map['lat'], map['long']),
        name = map['name'],
        infoWindow = map['infoWindow'] {
    this.geohash =
        Geohash.encode(this.location.latitude, this.location.longitude);
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_${Random().nextInt(10000)}";
  }
}
