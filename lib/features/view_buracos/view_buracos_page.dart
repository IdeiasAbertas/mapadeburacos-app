import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/data/models/status_buraco_model.dart';
import 'package:mapa_de_buracos_app_flutter/features/view_buraco_info/view_buraco_info_page.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/counter_status_widget.dart';
import 'package:mapa_de_buracos_app_flutter/features/widgets/custom_text_field.dart';

class ViewBuracosPage extends StatelessWidget {
  const ViewBuracosPage({super.key});

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
                'Buracos Fechados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(height: 40, child: CustomTextField()),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(1),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.79,
                  children: const <Widget>[
                    BuracoimageDatasGridWidget(
                      index: 1,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 2,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 3,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 4,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 5,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 6,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 7,
                    ),
                    BuracoimageDatasGridWidget(
                      index: 8,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: const EdgeInsets.only(bottom: 30),
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
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CounterStatusWidget(status: StatusBuraco.abertos, count: '300'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuracoimageDatasGridWidget extends StatelessWidget {
  final int index;
  const BuracoimageDatasGridWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewBuracoInfoPage(
              index: index,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'buraco$index',
            child: Image.asset(
              ('assets/images/buraco.png'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Buraco Vila de Viana',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location-icon.svg',
                width: 8,
              ),
              const SizedBox(
                width: 5,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Luanda -',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' Ponte Partida',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/comment-icon.svg',
                color: AppTheme.krukutecaGray004,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                '123',
                style: TextStyle(fontSize: 10, color: AppTheme.krukutecaGray004),
              )
            ],
          )
        ],
      ),
    );
  }
}
