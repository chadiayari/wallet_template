import 'package:flutter/material.dart';
import 'package:wallet_template/theme.dart';
import '../../constants.dart' as constants;

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
        Container(
          width: size.width * 0.9,
          padding: EdgeInsets.only(
              top: size.width * 0.05,
              bottom: size.width * 0.05,
              right: 12,
              left: 12),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(15),
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
                        "Owned Shares",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            " USD",
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
        Padding(
          padding:
              EdgeInsets.only(left: size.width * 0.05, top: size.height * 0.03),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "My Capital",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.width * 0.03,
              bottom: size.width * 0.05),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: HexColor(constants.blue),
                textColor: HexColor(constants.blue),
                title: const Text(
                  'Current Year',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
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
                          'USD',
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
                iconColor: HexColor(constants.blue),
                textColor: HexColor(constants.blue),
                title: const Text(
                  '2021',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
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
                          'USD',
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
                iconColor: HexColor(constants.blue),
                textColor: HexColor(constants.blue),
                title: const Text(
                  '2020',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
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
                          'USD',
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
            ],
          ),
        ),
      ],
    );
  }
}
