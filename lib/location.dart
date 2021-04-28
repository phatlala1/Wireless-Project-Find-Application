import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class location extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<location> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
            }),
        title: Text("Bangkok"),

      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),

        ],
      ),
    );
  }


  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(13.7563,100.5018), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(13.7563,100.5018), zoom: zoomVal)));
  }






  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(13.7563,100.5018), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          restaurantMarker,restaurant2Marker,restaurant3Marker,restaurant4Marker,restaurant5Marker
        },
      ),
    );
  }

}

Marker restaurantMarker = Marker(
  markerId: MarkerId('A.Mallika Authentic Thai Food'),
  position: LatLng(13.7553994,100.5140591),
  infoWindow: InfoWindow(title: 'A.Mallika Authentic Thai Food'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker restaurant2Marker = Marker(
  markerId: MarkerId('J.Fai Michelin star restaurant'),
  position: LatLng(13.7725365,100.5064683),
  infoWindow: InfoWindow(title: 'J.Fai Michelin star restaurant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker restaurant3Marker = Marker(
  markerId: MarkerId('Je Ngor Kitchen'),
  position: LatLng(13.7607369,100.5132824),
  infoWindow: InfoWindow(title: 'Je Ngor Kitchen'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker restaurant4Marker = Marker(
  markerId: MarkerId('obaroitownintown'),
  position: LatLng(13.7718065,100.5357504),
  infoWindow: InfoWindow(title: 'obaroitownintown'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker restaurant5Marker = Marker(
  markerId: MarkerId('Plearn Restaurant'),
  position: LatLng(13.8074245,100.5347214),
  infoWindow: InfoWindow(title: 'Plearn Restaurant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

