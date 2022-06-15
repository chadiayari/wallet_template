import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  final String ownedShares;
  final String sharesValue;
  final String returnPurchase;
  const ProjectWidget(
      {Key? key,
      required this.ownedShares,
      required this.sharesValue,
      required this.returnPurchase})
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
          color: Colors.white,
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
                  "Total Shares Owned",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Total Shares Value",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Spacer(),
                Text(
                  "Return on Purchase",
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
                  returnPurchase.toString(),
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
                  "Shares",
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

class ProjectImageBox extends StatelessWidget {
  final String imageName;

  const ProjectImageBox({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.3,
      height: size.width * 0.3,
      padding: EdgeInsets.only(
        top: size.width * 0.05,
        bottom: size.width * 0.05,
        right: size.width * 0.05,
        left: size.width * 0.05,
      ),
      margin: EdgeInsets.only(
        right: size.height * 0.02,
        left: size.height * 0.02,
        top: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/' + imageName),
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
