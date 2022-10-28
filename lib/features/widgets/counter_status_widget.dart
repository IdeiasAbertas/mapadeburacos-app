import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/data/models/status_buraco_model.dart';

class CounterStatusWidget extends StatelessWidget {
  final StatusBuraco status;
  final String count;
  const CounterStatusWidget({Key? key, required this.status, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          getStatusTile(status),
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppTheme.krukutecaGray004),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: getStatusColor(status),
            borderRadius: BorderRadius.circular(50.0),
          ),
        )
      ],
    );
  }
}

Color getStatusColor(StatusBuraco status) => (status == StatusBuraco.abertos)
    ? AppTheme.krukutecaRed001
    : (status == StatusBuraco.fechados)
        ? AppTheme.krukutecaGreen001
        : AppTheme.krukuteYellow001;

String getStatusTile(StatusBuraco status) => (status == StatusBuraco.abertos)
    ? 'Abertos'
    : (status == StatusBuraco.fechados)
        ? 'Fechados'
        : 'Em Andamento';
