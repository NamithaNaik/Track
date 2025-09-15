import 'package:flutter/material.dart';
import 'package:trident_tracker/trident_tracker.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TridentTracker Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('TridentTracker Demo')),
        body:
            // TridentTracker (
            //   mapType: MapType.googleMaps,
            //   // locationMarker: TridentLocationMarker.fromAsset('lib/asset/car.png'),
            //   googleMapsApiKey: 'AIzaSyAdvoSXauSXeX6JtqqEzcc_MKkLM-lPSPo',
            //   initialZoom: 15.0,
            //   routeAnimation: TridentRouteAnimation.vehicle(useRealRoads: true,
            //     startPoint: LatLng(12.8968, 74.8346),
            //     endPoint: LatLng(12.9224, 74.8310),
            //     duration: Duration(seconds: 50),
            //   ),
            //   // showCurrentLocation: true,
            //   onLocationPermissionDenied: () {
            //     // Handle permission denied
            //     print('Location permission denied');
            //   },
            // ),
            TridentTracker(
              mapType: MapType.flutterMap,
              googleMapsApiKey: 'AIzaSyAdvoSXauSXeX6JtqqEzcc_MKkLM-lPSPo',
              routeAnimation: TridentRouteAnimation(
                startPoint: LatLng(12.8968, 74.8346),
                endPoint: LatLng(12.9224, 74.8310),
                duration: Duration(seconds: 20),
                useRealRoads: true,
                routeService: RouteServiceFactory.create(),
                autoStart: true,
                polylineColor: Colors.blue,
                polylineWidth: 4.0,
                onRouteStart: () {
                  print('🛣️ Real road route started');
                },
                onProgress: (progress) {
                  print('📍 Progress: ${(progress * 100).toStringAsFixed(1)}%');
                },
              ),
            ),
      ),
    );
  }
}
