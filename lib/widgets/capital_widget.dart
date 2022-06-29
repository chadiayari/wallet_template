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
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Owned Shares",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Current Share Value",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Current Share Capital",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ownedShares.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text(
                  sharesValue.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text(
                  sharesCapital.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "AED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "AED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
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
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Total RoP",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Total Rol",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Total Earning",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  totalRop.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text(
                  totalRol.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text(
                  totalEarning.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "AED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "AED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "AED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
          ],
        ));
  }
}
