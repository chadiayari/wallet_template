import 'package:wallet_template/widgets/capital_widget.dart';
import 'package:flutter/material.dart';

class ProfileCapital extends StatefulWidget {
  const ProfileCapital({Key? key}) : super(key: key);
  @override
  State<ProfileCapital> createState() => _ProfileCapital();
}

class _ProfileCapital extends State<ProfileCapital>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Shares Capital Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const CapitalWidget(
              ownedShares: "0", sharesValue: "0", sharesCapital: "0"),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            "Current Profits Total",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const ProfitWidget(totalRop: "0", totalRol: "0", totalEarning: "0")
        ],
      ),
    );
  }
}
