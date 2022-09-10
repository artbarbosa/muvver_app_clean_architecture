import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  late GoogleMapController controller;

  List<LatLng> latlngSegment1 = [];

  static const LatLng _lat1 = LatLng(
    -20.488762367638255,
    -54.62925399810734,
  );
  static const LatLng _lat2 = LatLng(
    -22.238124018456762,
    -54.8091072511234,
  );

  final LatLng _lastMapPosition = _lat2;

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId('start'),
      position: LatLng(
        -20.488762367638255,
        -54.62925399810734,
      ),
    ),
    const Marker(
      markerId: MarkerId('end'),
      position: LatLng(
        -22.238124018456762,
        -54.8091072511234,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    //line segment 1
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            scrollGesturesEnabled: true,
            polylines: _polyline,
            trafficEnabled: true,
            markers: markers,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _lastMapPosition,
              zoom: 7,
            ),
            mapType: MapType.normal,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: const Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: const Color(0xff222222),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/package_size');
                    },
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'Avançar',
                        style: TextStylesConst.titilliumWeb16BoldWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
      ));

      _polyline.add(Polyline(
        polylineId: const PolylineId('line1'),
        visible: true,
        points: latlngSegment1,
        width: 2,
        color: Colors.green,
      ));
    });
  }
}
