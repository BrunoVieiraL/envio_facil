import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jera_app/constants.dart';
import 'package:jera_app/repositories/current_location.dart';
import 'package:jera_app/repositories/directions_repository.dart';
import 'package:jera_app/widgets/custom_widget_bottom_green_button.dart';
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
  LatLng? coordenadasOrigem;
  LatLng? coordenadasDestino;
  late Position teste;

  getGeoData(String city) async {
    GeoCode geoCode = GeoCode();
    try {
      Coordinates coordinates = await geoCode.forwardGeocoding(address: city);

      return LatLng(coordinates.latitude!, coordinates.longitude!);
    } catch (e) {
      throw Exception('Error');
    }
  }

  getCurrentLocation() async {
    teste = await CurrentLocation.determinePosition();
    initalPosition = LatLng(teste.latitude, teste.longitude);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Viajante',
                style: TextStyle(
                  fontSize: 16.sp,
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
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              bottom: 27.h,
            ),
            title: Text(
              'Qual o trajeto da sua viagem?',
              style: TextStyle(
                fontSize: 20.sp,
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
          bottom: TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0.h),
                child: const Text('Rotas'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0.h),
                child: const Text('Mapa'),
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
                    padding: EdgeInsets.only(
                      top: 25.h,
                      bottom: 24.h,
                      left: 16.w,
                      right: 86.w,
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
                        left: 16.w,
                        right: 16.w,
                      ),
                      CustomWidgetDateContainer(
                        textPartida: 'Data de Chegada',
                        dataPartida: dataChegada,
                        right: 16.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 17.w,
                      right: 16.w,
                      bottom: 30.h,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
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
                    padding: EdgeInsets.only(
                      left: 17.w,
                      right: 16.w,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.done,
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
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.only(left: 60.25.w, right: 60.25.w),
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
                    padding: EdgeInsets.only(left: 94.w, right: 62.w),
                    child: Text(
                      'E aumente sua chance de match',
                      style: TextStyle(
                          fontFamily: titilliumWebRegular,
                          color: const Color(0x22222252),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  CustomWidgetBottomGreenButton(
                    buttonText: 'Avançar',
                    top: 33.h,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/boxSizePage');
                    },
                  )
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
                onCameraMove: (camera) async {
                  if (origin == null ||
                      (origin != null && destination != null)) {
                    origin = Marker(
                      markerId: const MarkerId('origin'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/route_page/ic-partida.png'),
                      position: coordenadasOrigem ?? const LatLng(0, 0),
                    );
                    destination = null;
                    _info = null;
                    setState(() {});
                  } else {
                    destination = Marker(
                      markerId: const MarkerId('destination'),
                      icon: await BitmapDescriptor.fromAssetImage(
                          const ImageConfiguration(),
                          'assets/route_page/ic-destino.png'),
                      position: coordenadasDestino ?? const LatLng(0, 0),
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
