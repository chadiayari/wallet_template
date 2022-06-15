import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BankWidget extends StatelessWidget {
  final String color;
  final GestureTapCallback ontap;
  final String logo;
  const BankWidget(
      {Key? key, required this.color, required this.ontap, required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.17,
      margin: EdgeInsets.fromLTRB(size.width * 0.03, 10, size.width * 0.03, 10),
      decoration: BoxDecoration(
        color: HexColor(color),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.all(size.width * 0.1),
          width: size.width * 0.25,
          height: size.width * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/' + logo),
            ),
          ),
        ),
      ),
    );
  }
}
