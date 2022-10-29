import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';

class AddBuracoForm extends StatefulWidget {
  const AddBuracoForm({super.key});

  @override
  State<AddBuracoForm> createState() => _AddBuracoFormState();
}

class _AddBuracoFormState extends State<AddBuracoForm> {
  bool? checkBoxValue = false;
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
              Row(
                children: const [
                  AddPhotoWidget(),
                  SizedBox(
                    width: 10,
                  ),
                  AddPhotoWidget(),
                  SizedBox(
                    width: 10,
                  ),
                  AddPhotoWidget(),
                ],
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
                value: checkBoxValue,
                onChanged: (newValue) {
                  setState(() {
                    checkBoxValue = newValue;
                  });
                },
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
                    hintStyle: const TextStyle(
                      fontSize: 10,
                      color: AppTheme.krukutecaGray002,
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppTheme.krukutecaGray002),
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
                    hintStyle: const TextStyle(
                      fontSize: 10,
                      color: AppTheme.krukutecaGray002,
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

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppTheme.krukutecaGray002,
      dashPattern: const [5, 5],
      radius: const Radius.circular(50),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.image,
                color: AppTheme.krukutecaGray003,
              ),
              Text(
                'Add Foto',
                style: TextStyle(color: AppTheme.krukutecaGray002, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
