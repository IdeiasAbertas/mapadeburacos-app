import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/add_photo_widget.dart';

class AddBuracoForm extends StatefulWidget {
  const AddBuracoForm({super.key});

  @override
  State<AddBuracoForm> createState() => _AddBuracoFormState();
}

class _AddBuracoFormState extends State<AddBuracoForm> {
  List<String> photosList = [];
  late LocationData _currentPosition;
  late String _address;
  Location location = Location();

  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //pop the page
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //TODO:add alert screen to user grant permission and let him know
        Navigator.pop(context, 'permissionDeniedForever');
        return;
      }
    }

    _currentPosition = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add um buraco',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Adicionar fotos',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    6,
                    (i) => AddPhotoWidget(
                      onChanged: (value) {
                        photosList.add(value);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Descrição',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Localização*',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                activeColor: AppTheme.krukutecaGreen001,
                title: const Text('Pegar minha localização atual'),
                value: true,
                onChanged: (newValue) {},
                checkColor: Colors.black,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Descrição do Bairro',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Rua dos Mangueiras do Belo Monte',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        color: AppTheme.krukutecaGray002,
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                    prefixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                    fillColor: AppTheme.krukutecaGray003,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Descrição ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' (opcional)',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal, color: AppTheme.krukutecaGray002),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Rua dos Mangueiras do Belo Monte',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        color: AppTheme.krukutecaGray002,
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                    prefixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                    fillColor: AppTheme.krukutecaGray003,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    style:
                        ButtonStyle(backgroundColor: MaterialStateProperty.all(AppTheme.krukutecaGreen001)),
                    onPressed: () {},
                    child: const Text(
                      'Salvar',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
