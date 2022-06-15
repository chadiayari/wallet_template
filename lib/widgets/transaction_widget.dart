import 'package:flutter/material.dart';

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

    return ExpansionTile(
      collapsedIconColor: Colors.black,
      iconColor: Colors.black,
      title: Text(
        date,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      children: [
        ListTile(
          dense: true,
          title: Column(children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Transaction ID"),
                    Text(id),
                    SizedBox(height: size.height * 0.01),
                    const Text("Number of shares"),
                    Text(nbShares),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Type"),
                    Text(type),
                    SizedBox(height: size.height * 0.01),
                    const Text("Total"),
                    Text(total),
                  ],
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
