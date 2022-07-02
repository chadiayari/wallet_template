import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants.dart' as constants;
import '../constants.dart';
import '../widgets/transaction_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen>
    with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  bool profit = true;
  bool shares = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Transaction History",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: HexColor(constants.secondaryColor),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: HexColor(constants.secondaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: backgroundGradientStyle,
        child: ListView(children: [
          SizedBox(height: size.height * 0.04),
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
              children: const [
                TransactionWidget(
                  date: "22 July 2022",
                  id: "01",
                  nbShares: "22",
                  type: "Purchase",
                  total: "22",
                ),
                TransactionWidget(
                  date: "22 September 2022",
                  id: "02",
                  nbShares: "2",
                  type: "Transfer",
                  total: "20",
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
