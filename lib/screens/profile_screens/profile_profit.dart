import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../models/login_user.dart';
import '../../models/user.dart';
import '../../widgets/loading.dart';
import '../purchase_screen.dart';

class ProfileProfit extends StatefulWidget {
  const ProfileProfit({Key? key}) : super(key: key);
  @override
  _ProfileProfit createState() => _ProfileProfit();
}

class _ProfileProfit extends State<ProfileProfit> with WidgetsBindingObserver {
  LoggedInUser userData = LoggedInUser();
  User currentuser = User();
  bool loaded = false;

  loading() {
    Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const Load(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loaded == false
        ? const Load()
        : Column(
            children: [
              Transform.translate(
                offset: Offset(0.0, -size.width * 0.2),
                child: Container(
                  width: size.width * 0.75,
                  padding: EdgeInsets.only(
                      top: size.width * 0.05,
                      bottom: size.width * 0.05,
                      right: 12,
                      left: 12),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentuser.portfolioId!.ownedShares!.isEmpty
                                    ? "0"
                                    : currentuser.portfolioId!.ownedShares![0]
                                        .numberOfOwnedShares
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Profit pages xxxxx",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SmallIconWhiteButton(
                              title: "+ Purchase",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const PurchaseScreen()));
                              })
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Shares Value",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              Row(
                                children: [
                                  Text(
                                    currentuser
                                            .portfolioId!.ownedShares!.isEmpty
                                        ? "0"
                                        : currentuser.portfolioId!
                                            .ownedShares![0].totalSharesValue!
                                            .toStringAsFixed(3),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " AED",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-size.width * 0.33, -size.width * 0.1),
                child: const Text(
                  "My Capital",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, -size.width * 0.1),
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                      top: size.width * 0.03,
                      bottom: size.width * 0.05),
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
                  child: Column(
                    children: [
                      ExpansionTile(
                        collapsedIconColor: Colors.black,
                        iconColor: Colors.black,
                        title: const Text(
                          'Current Year',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        children: [
                          ListTile(
                            dense: true,
                            title: Row(
                              children: [
                                const Text(
                                  'Amount: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser
                                          .portfolioId!
                                          .ownedShares![0]
                                          .purchaseHistory![0]
                                          .totalPurchasePrice
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  'AED',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Spacer(),
                                const Text(
                                  'Shares number',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser.portfolioId!.ownedShares![0]
                                          .purchaseHistory![0].numberOfShares
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        collapsedIconColor: Colors.black,
                        iconColor: Colors.black,
                        title: const Text(
                          '2021',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        children: [
                          ListTile(
                            dense: true,
                            title: Row(
                              children: [
                                const Text(
                                  'Amount: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser
                                          .portfolioId!
                                          .ownedShares![0]
                                          .purchaseHistory![0]
                                          .totalPurchasePrice
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  'AED',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Spacer(),
                                const Text(
                                  'Shares number: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser.portfolioId!.ownedShares![0]
                                          .purchaseHistory![0].numberOfShares
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        collapsedIconColor: Colors.black,
                        iconColor: Colors.black,
                        title: const Text(
                          '2020',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        children: [
                          ListTile(
                            dense: true,
                            title: Row(
                              children: [
                                const Text(
                                  'Amount: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser
                                          .portfolioId!
                                          .ownedShares![0]
                                          .purchaseHistory![0]
                                          .totalPurchasePrice
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  'AED',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Spacer(),
                                const Text(
                                  'Shares number: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  currentuser.portfolioId!.ownedShares!.isEmpty
                                      ? "0"
                                      : currentuser.portfolioId!.ownedShares![0]
                                          .purchaseHistory![0].numberOfShares
                                          .toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        collapsedIconColor: Colors.black,
                        iconColor: Colors.black,
                        title: const Text(
                          '2019',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        children: [
                          ListTile(
                            dense: true,
                            title: Row(
                              children: const [
                                Text(
                                  'Amount: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '1000.00',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'AED',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  'Shares number: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '300',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: size.width * 0.03,
                            bottom: size.width * 0.03,
                            right: size.width * 0.04,
                            left: size.width * 0.04),
                        child: Row(
                          children: [
                            Text(
                              currentuser.portfolioId!.ownedShares!.isEmpty
                                  ? "Amount: 0"
                                  : "Amount: " +
                                      currentuser.portfolioId!.ownedShares![0]
                                          .totalSharesValue!
                                          .toStringAsFixed(1),
                            ),
                            const Spacer(),
                            Text(
                              currentuser.portfolioId!.ownedShares!.isEmpty
                                  ? "Shares number: 0"
                                  : "Shares number: " +
                                      currentuser.portfolioId!.ownedShares![0]
                                          .numberOfOwnedShares
                                          .toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
