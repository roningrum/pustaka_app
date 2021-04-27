import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pustaka_app/helper/puskesmas_list.dart';

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
  Iterable markers = [];
  String _mapstyle;
  GoogleMapController mapController;
  BitmapDescriptor myIcon;

  @override
  void initState() {
    super.initState();
    getDataPuskesmas();
    rootBundle.loadString('assets/map_style.txt').then((string) => {
      _mapstyle = string
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          markers: Set.from(markers),
          initialCameraPosition: CameraPosition(
              target: const LatLng(-6.9873131, 110.4143132), zoom: 14.0),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController.setMapStyle(_mapstyle);
          }),
    );
  }

  void getDataPuskesmas() async {
    try {
      PuskesmasList puskesmasItem = PuskesmasList();
      await puskesmasItem.getPuskesmas();
      Iterable _markers =
          Iterable.generate(puskesmasItem.puskesmasList.length, (index) {
        LatLng latLng = LatLng(
            double.parse(puskesmasItem.puskesmasList[index].latitude),
            double.parse(puskesmasItem.puskesmasList[index].longitude));
        return Marker(
            markerId: MarkerId(puskesmasItem.puskesmasList[index].id_sarkes),
            position: latLng,
            infoWindow:
                InfoWindow(title: puskesmasItem.puskesmasList[index].nama));
      });
      setState(() {
        markers = _markers;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
