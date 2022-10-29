import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/avatar_widget.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AvatarWidget(color: AppTheme.krukutecaRed001, name: 'MQ'),
        const SizedBox(
          width: 5,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(color: AppTheme.krukutecaGray006, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Text(
            'Este buraco demorou muito para ser fechado, mas em fim!\nEste buraco demorou muito para ',
            style: TextStyle(fontSize: 10, color: AppTheme.krukutecaGray005, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}


