import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/data/models/status_buraco_model.dart';
import 'package:mapa_de_buracos_app_flutter/features/add_buraco_form/add_buraco_form.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/counter_status_widget.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-8.999384, 13.272335);

  Set<Marker> markers = {};

  late BitmapDescriptor markerIcon;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(248, 248)), 'assets/icons/fechado-icon.png')
        .then((onValue) {
      markerIcon = onValue;
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    mapController.setMapStyle(await rootBundle.loadString('assets/map/nigth-theme.json'));
    
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(-8.998291, 13.270590),
        icon: markerIcon,
        infoWindow: const InfoWindow(
          title: 'Buraco do Kilamba',
          snippet: 'Buraco aberto na via principal do Kilamba',
        ),
      ));
      markers.add(Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(-9.013333, 13.223593),
        icon: markerIcon,
        infoWindow: const InfoWindow(
          title: 'Buraco na Estr. Lar Patriota',
          snippet: 'Buraco fechado na via do Patriota',
        ),
      ));
      markers.add(Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(-8.898582, 13.364073),
        icon: markerIcon,
        infoWindow: const InfoWindow(
          title: 'Buraco na estrada de Catete',
          snippet: 'Buraco fechado na estrada de Catete',
        ),
      ));

      markers.add(Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(-9.025211, 13.405553),
        icon: markerIcon,
        infoWindow: const InfoWindow(
          title: 'Buraco na estrada do Zango',
          snippet: 'Buraco fechado na estrada do Zango II',
        ),
      ));

      markers.add(Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(-8.952324, 13.152532),
        icon: markerIcon,
        infoWindow: const InfoWindow(
          title: 'Buraco na estrada nacional 100',
          snippet: 'Buraco fechado frente ao KFC do Benfica.',
        ),
      ));
    });
  }

  Future<void> _goToTheLake() async {
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(const CameraPosition(target: LatLng(-8.952324, 13.152532))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: AppTheme.backgroundColor,
            ),
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 10,
              ),
              markers: markers,
              zoomControlsEnabled: false,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                color: AppTheme.backgroundColor,
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: Container(
                        margin: const EdgeInsets.only(top: 20, left: 15),
                        child: const Text(
                          'LOGO\nHERE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, height: 0.9, fontSize: 14, color: Colors.white),
                        ),
                      ),
                      actions: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, right: 15),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 65,
                      padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
                      child: const CustomTextField(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final result = Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => const AddBuracoForm(),
                          ),
                        )
                            .then((value) {
                          if (value.toString() == 'permissionDeniedForever') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Localização obrigatória'),
                                  content: const Text(
                                      "Para adicionar um buraco, o utilizador deve ativar a permissão de acesso à localização nas configurações da app ou desinstalar e voltar a instalar a app."),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok')),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: AppTheme.krukutecaGreen001, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          color: AppTheme.backgroundColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 5),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      height: 133,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.krukutecaGray003,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Relatório ',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                              ),
                              TextSpan(
                                text: ' Nesta localidade',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              CounterStatusWidget(status: StatusBuraco.abertos, count: '300'),
                              CounterStatusWidget(status: StatusBuraco.fechados, count: '100'),
                              CounterStatusWidget(status: StatusBuraco.emAndamento, count: '150'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
