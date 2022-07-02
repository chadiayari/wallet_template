import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

// ignore: must_be_immutable
class NotifcationCard extends StatelessWidget {
  final String content;
  bool opened;
  NotifcationCard({
    Key? key,
    required this.content,
    required this.opened,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(right: 22, left: 22, top: 10, bottom: 10),
      padding: EdgeInsets.only(
        top: size.width * 0.025,
        bottom: size.width * 0.025,
        right: size.width * 0.04,
        left: size.width * 0.02,
      ),
      width: size.width,
      decoration: BoxDecoration(
        color: opened
            ? HexColor(constants.blue)
            : HexColor(constants.secondaryColor),
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.black54,
            ),
            child: const Icon(Icons.add_shopping_cart),
          ),
          SizedBox(width: size.width * 0.05),
          Column(
            children: [
              SizedBox(
                width: size.width * 0.65,
                child: Text(content,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
