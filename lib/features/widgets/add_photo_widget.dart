import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';

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