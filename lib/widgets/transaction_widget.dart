import 'package:flutter/material.dart';
import 'package:wallet_template/theme.dart';
import '../../../constants.dart' as constants;

class TransactionWidget extends StatelessWidget {
  final String date;
  final String id;
  final String nbShares;
  final String type;
  final String total;

  const TransactionWidget({
    Key? key,
    required this.date,
    required this.id,
    required this.nbShares,
    required this.type,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        title: Text(
          date,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18),
        ),
        children: [
          ListTile(
            dense: true,
            title: Column(children: [
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Transaction ID",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        id,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.01),
                      const Text(
                        "Number of shares",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        nbShares,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.01),
                      const Text(
                        "Total",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        total,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
            ]),
          ),
        ],
      ),
    );
  }
}
