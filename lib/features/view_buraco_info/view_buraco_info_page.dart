import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';

class ViewBuracoInfoPage extends StatelessWidget {
  final int index;
  const ViewBuracoInfoPage({super.key, required this.index});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const AvatarWidget(color: AppTheme.krukutecaGreen001, name: 'AD'),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'System Adm',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '3 ‘ Aug ‘ 2022 - 14h',
                              style: TextStyle(
                                  fontSize: 9, color: AppTheme.krukutecaGray005, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: 'buraco$index',
                      child: Container(
                        height: 190,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/buraco.png'), fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Buraco Vila de Viana - Bairro HotDog',
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
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Comentários',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white, fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                            const CommentWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              height: 90,
              decoration: const BoxDecoration(
                color: AppTheme.krukutecaGray003,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        color: AppTheme.krukutecaGray005,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Adicione o seu comentário aqui.',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 10,
                                color: AppTheme.krukutecaGray002,
                              )),
                              suffixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
                              suffixIcon: Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: SvgPicture.asset(
                                  'assets/icons/send-icon.svg',
                                ),
                              ),
                              fillColor: AppTheme.krukutecaGray006,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class AvatarWidget extends StatelessWidget {
  final String name;
  final Color color;
  const AvatarWidget({Key? key, required this.name, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
