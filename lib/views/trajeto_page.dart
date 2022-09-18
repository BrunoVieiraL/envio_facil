import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/repositories/directions_repository.dart';
import 'package:jera_app/widgets/custom_widget_date_container.dart';

import '../models/directions_model.dart';

class TrajetoPage extends StatefulWidget {
  const TrajetoPage({super.key});

  @override
  State<TrajetoPage> createState() => _TrajetoPageState();
}

class _TrajetoPageState extends State<TrajetoPage> {
  DateTime? dataPartida;
  DateTime? dataChegada;
  GoogleMapController? googleMapController;
  Marker? origin;
  Marker? destination;
  LatLng initalPosition = const LatLng(-4.351485, -39.314338);
  Directions? _info;

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF353740),
          bottom: const TabBar(
            tabs: [
              Text('Rotas'),
              Text('Mapa'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: const Color(0xFFFAFAFA),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 16,
                      right: 86,
                      bottom: 24,
                    ),
                    child: Text(
                      'Selecione a Data e a Rota da sua viagem',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: titilliumWebBold,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.2,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomWidgetDateContainer(
                          textPartida: 'Data de Partida',
                          dataPartida: dataPartida,
                          left: 16,
                          right: 16),
                      CustomWidgetDateContainer(
                          textPartida: 'Data de Chegada',
                          dataPartida: dataChegada,
                          right: 16),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: initalPosition,
                  zoom: 8,
                ),
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (controller) => googleMapController = controller,
                markers: {
                  if (origin != null) origin!,
                  if (destination != null) destination!
                },
                polylines: {
                  if (_info != null)
                    Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Colors.green,
                      width: 3,
                      points: _info!.polylinePoints
                          .map((e) => LatLng(e.latitude, e.longitude))
                          .toList(),
                    ),
                },
                onTap: (LatLng latlong) async {
                  if (origin == null ||
                      (origin != null && destination != null)) {
                    origin = Marker(
                      markerId: const MarkerId('origin'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/trajeto_page/ic-partida.png'),
                      position: initalPosition,
                    );
                    destination = null;
                    _info = null;
                    setState(() {});
                  } else {
                    destination = Marker(
                      markerId: const MarkerId('destination'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/trajeto_page/ic-destino.png'),
                      position: latlong,
                    );
                    final directions = await DirectionsRepository()
                        .getDirections(
                            origin: origin!.position,
                            destination: destination!.position);
                    _info = directions;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
