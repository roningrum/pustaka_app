
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../const.dart';

class PuskesmasPeta extends StatefulWidget {
  static String id = "puskesmas_peta_menu";

  @override
  _PuskesmasPetaState createState() => _PuskesmasPetaState();
}

class _PuskesmasPetaState extends State<PuskesmasPeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kSurfaceColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kFontColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Peta Puskesmas',
              style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
        ),
        body: MapPuskesmas());
  }
}

class MapPuskesmas extends StatefulWidget {
  @override
  _MapPuskesmasState createState() => _MapPuskesmasState();
}

class _MapPuskesmasState extends State<MapPuskesmas> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-7.0247246,110.3470246);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          onMapCreated: _onMapCreated),
    );
  }
}
