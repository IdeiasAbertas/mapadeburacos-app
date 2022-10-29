import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';
import 'package:mapa_de_buracos_app_flutter/features/view_buracos/view_buracos_page.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: 'Procure lugares para descobrir buracos',
        hintStyle: const TextStyle(
          fontSize: 10,
          color: AppTheme.krukutecaGray002,
        ),
        suffixIconConstraints: const BoxConstraints(minHeight: 19, minWidth: 22),
        suffixIcon: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ViewBuracosPage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(
              'assets/icons/filter-icon.svg',
            ),
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
    );
  }
}
