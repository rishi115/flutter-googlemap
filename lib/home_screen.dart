import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _Googleposition = const CameraPosition(
      target: LatLng(19.11926985062429, 73.00412107950969),
      zoom: 17
  );
    final List<Marker> _marker = [];
    final List<Marker> _list = const[
      Marker(markerId: MarkerId('1'),
        position: LatLng(19.11926985062429, 73.00412107950969),
        infoWindow: InfoWindow(
          title: 'Myposition'
        )
      ),
      Marker(markerId: MarkerId('1'),
          position: LatLng(21.11926985062429, 73.00412107950969),
          infoWindow: InfoWindow(
              title: 'Myposition'
          )
      )
    ];



  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        initialCameraPosition: _Googleposition,
        markers: Set.of(_marker),


      ),
    );
  }
}
