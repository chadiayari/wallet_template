import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class DashboardCard extends StatelessWidget {
  final String name;
  final String nbShares;
  final String icon;

  const DashboardCard({
    Key? key,
    required this.name,
    required this.nbShares,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.03, horizontal: size.width * 0.06),
      margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.width * 0.05),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: HexColor(constants.backgroundColor),
            ),
            child: Icon(
              (name == "Purchased Shares")
                  ? Icons.add_shopping_cart
                  : ((name == "Transfered Shares")
                      ? Icons.arrow_upward
                      : Icons.arrow_downward),
              size: size.width * 0.04,
            ),
          ),
          SizedBox(width: size.width * 0.05),
          Text(name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
          SizedBox(height: size.width * 0.03),
          const Spacer(),
          Text("$nbShares Shares")
        ],
      ),
    );
  }
}
