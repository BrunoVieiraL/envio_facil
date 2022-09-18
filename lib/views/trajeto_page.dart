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
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const SizedBox(
                    height: 31,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17, right: 16, bottom: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFF353740)),
                          labelText: 'Cidade de Origem',
                          floatingLabelStyle:
                              TextStyle(color: Color(0xFF353740)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xFF353740)),
                        labelText: 'Cidade de Destino',
                        floatingLabelStyle: TextStyle(color: Color(0xFF353740)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.25, right: 60.25),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/pontoIntermediarioPage');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFF353740),
                      ),
                      label: Text(
                        'Adicionar ponto intermediário',
                        style: TextStyle(
                            color: const Color(0xFF353740),
                            fontFamily: titilliumWebBold,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 94, right: 62),
                    child: Text(
                      'E aumente sua chance de match',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: titilliumWebRegular,
                          color: const Color(0x22222252),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 33,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.green),
                        child: Text(
                          'Avançar',
                          style: TextStyle(
                            fontFamily: titilliumWebBold,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
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
