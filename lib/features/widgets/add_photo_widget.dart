import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/features/take_picture/take_picture_screen.dart';

class AddPhotoWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const AddPhotoWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<AddPhotoWidget> createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
  dynamic picturePath = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          picturePath = Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const TakePictureScreen(),
            ),
          )
              .then((value) {
            setState(() {
              picturePath = value ?? '';
            });
            widget.onChanged(value);
          });
        },
        child: picturePath.toString().isNotEmpty
            ? Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(
                        File(picturePath),
                      ),
                      fit: BoxFit.cover),
                ),
              )
            : DottedBorder(
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
              ),
      ),
    );
  }
}
