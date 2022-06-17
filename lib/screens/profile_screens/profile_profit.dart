import 'package:flutter/material.dart';

class ProfileProfit extends StatefulWidget {
  const ProfileProfit({Key? key}) : super(key: key);
  @override
  State<ProfileProfit> createState() => _ProfileProfit();
}

class _ProfileProfit extends State<ProfileProfit> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white.withOpacity(0.25),
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
                          "0",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Profit pages xxxxx",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
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
                              "0",
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white.withOpacity(0.25),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              children: [
                ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: const Text(
                    'Current Year',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      dense: true,
                      title: Row(
                        children: const [
                          Text(
                            'Amount: ',
                          ),
                          Text(
                            "0",
                          ),
                          Text(
                            'AED',
                          ),
                          Spacer(),
                          Text(
                            'Shares number',
                          ),
                          Text(
                            "0",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.blue,
                  title: const Text(
                    '2021',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      dense: true,
                      title: Row(
                        children: const [
                          Text(
                            'Amount: ',
                          ),
                          Text(
                            "0",
                          ),
                          Text(
                            'AED',
                          ),
                          Spacer(),
                          Text(
                            'Shares number: ',
                          ),
                          Text(
                            "0",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: const Text(
                    '2020',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      dense: true,
                      title: Row(
                        children: const [
                          Text(
                            'Amount: ',
                          ),
                          Text(
                            "0",
                          ),
                          Text(
                            'AED',
                          ),
                          Spacer(),
                          Text(
                            'Shares number: ',
                          ),
                          Text(
                            "0",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: const Text(
                    '2019',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      dense: true,
                      title: Row(
                        children: const [
                          Text(
                            'Amount: ',
                          ),
                          Text(
                            '1000.00',
                          ),
                          Text(
                            'AED',
                          ),
                          Spacer(),
                          Text(
                            'Shares number: ',
                          ),
                          Text(
                            '300',
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
                    children: const [
                      Text(
                        "0",
                      ),
                      Spacer(),
                      Text(
                        "0",
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
