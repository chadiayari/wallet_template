import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart' as constants;

class SettingsWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback ontap;
  const SettingsWidget({Key? key, required this.title, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.width * 0.03,
        ),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                width: size.width * 0.9,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                decoration: BoxDecoration(
                  color: HexColor(constants.backgroundColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_right),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
