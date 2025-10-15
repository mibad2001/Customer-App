import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapWidget extends StatefulWidget {
  const OpenStreetMapWidget({super.key});

  @override
  State<OpenStreetMapWidget> createState() => _OpenStreetMapWidgetState();
}

class _OpenStreetMapWidgetState extends State<OpenStreetMapWidget> {
  MapController _controller = MapController();
  LatLng? _currentLocation;
  Future<void> _userCurrentLocation() async {
    if (_currentLocation != null) {
      _controller.move(_currentLocation!, 10);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Current Location not available")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: MapOptions(
          initialCenter: _currentLocation ?? LatLng(0, 0),
          initialZoom: 5,
          minZoom: 0,
          maxZoom: 100,

          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.doubleTapZoom,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          CurrentLocationLayer(
            // style: LocationMarkerStyle(
            //   marker: DefaultLocationMarker(
            //     child: Icon(Icons.location_pin, color: Colors.red),
            //   ),
            //   markerSize: Size(50, 50),

            //   markerDirection: MarkerDirection.heading,
            // ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _userCurrentLocation();
        },
        elevation: 0,
        backgroundColor: Colors.blue,
        child: Icon(Icons.my_location, size: 25, color: Colors.white),
      ),
    );
  }
}
