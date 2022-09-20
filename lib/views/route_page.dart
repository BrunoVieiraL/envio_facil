import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/repositories/directions_repository.dart';
import 'package:jera_app/widgets/custom_widget_date_container.dart';

import '../models/directions_model.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  DateTime? dataPartida;
  DateTime? dataChegada;
  GoogleMapController? googleMapController;
  Marker? origin;
  Marker? destination;
  LatLng initalPosition = const LatLng(-4.351485, -39.314338);
  Directions? _info;
  TextEditingController cidadeOrigem = TextEditingController();
  TextEditingController cidadeDestino = TextEditingController();
  late LatLng coordenadasOrigem;
  late LatLng coordenadasDestino;

  getGeoData(String city) async {
    GeoCode geoCode = GeoCode();
    try {
      Coordinates coordinates = await geoCode.forwardGeocoding(address: city);

      return LatLng(coordinates.latitude!, coordinates.longitude!);
    } catch (e) {
      throw Exception('Error');
    }
  }

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
          title: Column(
            children: [
              Text(
                'Viajante',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: titilliumWebRegular,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.54),
                ),
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 72, left: 16),
            child: Text(
              'Qual o trajeto da sua viagem?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: titilliumWebRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/homePage');
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: titilliumWebBold,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
          backgroundColor: const Color(0xFF353740),
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Rotas'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Mapa'),
              ),
            ],
            indicatorColor: Colors.white,
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
                        right: 16,
                      ),
                      CustomWidgetDateContainer(
                        textPartida: 'Data de Chegada',
                        dataPartida: dataChegada,
                        right: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 16, bottom: 30),
                    child: TextField(
                      controller: cidadeOrigem,
                      onSubmitted: (city) async {
                        coordenadasOrigem = await getGeoData(city);
                      },
                      decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xFF353740)),
                        labelText: 'Cidade de Origem',
                        floatingLabelStyle: TextStyle(color: Color(0xFF353740)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 16),
                    child: TextField(
                      controller: cidadeDestino,
                      onSubmitted: (city) async {
                        coordenadasDestino = await getGeoData(city);
                      },
                      decoration: const InputDecoration(
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
                        Navigator.of(context).pushNamed('/middlePointPage');
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
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 94, right: 62),
                    child: Text(
                      'E aumente sua chance de match',
                      style: TextStyle(
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/boxSizePage');
                        },
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
                  zoom: 9,
                ),
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onCameraMove: (camera) async {
                  if (origin == null ||
                      (origin != null && destination != null)) {
                    origin = Marker(
                      markerId: const MarkerId('origin'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/trajeto_page/ic-partida.png'),
                      position: coordenadasOrigem,
                    );
                    destination = null;
                    _info = null;
                    initalPosition = coordenadasOrigem;
                    setState(() {});
                  } else {
                    destination = Marker(
                      markerId: const MarkerId('destination'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/trajeto_page/ic-destino.png'),
                      position: coordenadasDestino,
                    );
                    final directions = await DirectionsRepository()
                        .getDirections(
                            origin: origin!.position,
                            destination: destination!.position);
                    _info = directions;

                    setState(() {});
                  }
                },
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
