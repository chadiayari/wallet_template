import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class NotifcationCard extends StatelessWidget {
  final String content;
  final String tag;

  const NotifcationCard({
    Key? key,
    required this.content,
    required this.tag,
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
        color: tag == "TRANSFER"
            ? HexColor(constants.backgroundColor)
            : HexColor(constants.priaryYellow),
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
              color: Colors.white,
            ),
            child: Icon((tag == "PURCHASE")
                ? Icons.add_shopping_cart
                : ((content.contains("recieved"))
                    ? Icons.arrow_downward
                    : Icons.arrow_upward)),
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
