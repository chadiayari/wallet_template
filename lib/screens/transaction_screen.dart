import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants.dart' as constants;
import '../models/login_user.dart';
import '../widgets/loading.dart';
import '../widgets/transaction_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreen createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen>
    with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  bool profit = true;
  bool shares = false;

  LoggedInUser userData = LoggedInUser();
  var response;
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
    //Loader.hide();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryRed),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: loaded == false
          ? const NotificationsLoad()
          : Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: ListView(children: [
                Center(
                  child: Text(
                    "Transaction History",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: HexColor(constants.primaryRed),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
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
                      for (int i = 0; i < response.length; i++)
                        TransactionWidget(
                          date: response[i]["createdAt"],
                          id: response[i]["_id"],
                          nbShares: response[i]["numberOfShares"].toString(),
                          type: response[i]["transactionType"],
                          total: response[i]["total"].toString(),
                        ),
                    ],
                  ),
                ),
              ])),
    );
  }
}
