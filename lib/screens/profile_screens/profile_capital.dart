import 'package:wallet_template/widgets/capital_widget.dart';
import 'package:flutter/material.dart';

import '../../models/login_user.dart';
import '../../models/user.dart';
import '../../widgets/loading.dart';

class ProfileCapital extends StatefulWidget {
  const ProfileCapital({Key? key}) : super(key: key);
  @override
  _ProfileCapital createState() => _ProfileCapital();
}

class _ProfileCapital extends State<ProfileCapital>
    with WidgetsBindingObserver {
  LoggedInUser userData = LoggedInUser();
  User currentuser = User();
  bool loaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loaded == false
        ? const Load()
        : Transform.translate(
            offset: Offset(0.0, -size.width * 0.2),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shares Capital Summary",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CapitalWidget(
                    ownedShares: currentuser.portfolioId!.ownedShares!.isEmpty
                        ? "0"
                        : currentuser
                            .portfolioId!.ownedShares![0].numberOfOwnedShares
                            .toString(),
                    sharesValue: currentuser.portfolioId!.ownedShares!.isEmpty
                        ? "0"
                        : currentuser.portfolioId!.ownedShares![0].shareValue
                            .toString(),
                    sharesCapital: currentuser.portfolioId!.ownedShares!.isEmpty
                        ? "0"
                        : currentuser
                            .portfolioId!.ownedShares![0].totalSharesValue!
                            .toStringAsFixed(3),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Current Profits Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ProfitWidget(
                      totalRop: currentuser.portfolioId!.ownedShares!.isEmpty
                          ? "0"
                          : currentuser
                              .portfolioId!.ownedShares![0].returnOnInvestment
                              .toString(),
                      totalRol: "0",
                      totalEarning: "0")
                ],
              ),
            ),
          );
  }
}
