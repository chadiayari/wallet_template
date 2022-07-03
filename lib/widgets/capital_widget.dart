import 'package:flutter/material.dart';

class CapitalWidget extends StatelessWidget {
  final String ownedShares;
  final String sharesValue;
  final String sharesCapital;
  const CapitalWidget(
      {Key? key,
      required this.ownedShares,
      required this.sharesValue,
      required this.sharesCapital})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height * 0.18,
        padding: EdgeInsets.only(
            top: size.width * 0.05,
            bottom: size.width * 0.05,
            right: 12,
            left: 12),
        margin: EdgeInsets.only(
          bottom: size.height * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Owned Shares",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Text(
                  "Current Share Value",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Text(
                  "Current Share Capital",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ownedShares.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "$sharesValue USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "$sharesCapital USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ],
        ));
  }
}

class ProfitWidget extends StatelessWidget {
  final String totalRop;
  final String totalRol;
  final String totalEarning;
  const ProfitWidget(
      {Key? key,
      required this.totalRop,
      required this.totalRol,
      required this.totalEarning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height * 0.18,
        padding: EdgeInsets.only(
            top: size.width * 0.05,
            bottom: size.width * 0.05,
            right: 12,
            left: 12),
        margin: EdgeInsets.only(
          bottom: size.height * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Total RoP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Text(
                  "Total Rol",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Text(
                  "Total Earning",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$totalRop USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "$totalRol USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "$totalEarning USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ],
        ));
  }
}
