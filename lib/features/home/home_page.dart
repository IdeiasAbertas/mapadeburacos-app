import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/data/models/status_buraco_model.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/counter_status_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 300,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: AppTheme.backgroundColor,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
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
                            fontWeight: FontWeight.bold, height: 0.9, fontSize: 15, color: Colors.white),
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
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Procure lugares para descobrir buracos',
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          color: AppTheme.krukutecaGray002,
                        ),
                        suffixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: SvgPicture.asset(
                            'assets/icons/filter-icon.svg',
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                        prefixIcon: Container(
                            margin: const EdgeInsets.only(left: 15, right: 10),
                            child: SvgPicture.asset('assets/icons/search-icon.svg')),
                        fillColor: AppTheme.krukutecaGray003,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppTheme.krukutecaGreen001, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.add,
                        color: AppTheme.backgroundColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 5),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      height: 143,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.krukutecaGray003,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                text: 'Relatório ',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: ' Nesta localidade',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
