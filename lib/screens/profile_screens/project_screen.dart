import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:wallet_template/widgets/project_widget.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants.dart' as constants;
import '../purchase_more_funds.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreen();
}

class _ProjectScreen extends State<ProjectScreen> with WidgetsBindingObserver {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController sharesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: HexColor(constants.primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: HexColor(constants.primaryColor),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: HexColor("#F5F5F5")),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.15,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150)),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            width: size.width * 0.3,
                            height: size.width * 0.3,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/hoot.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "aaa",
                                style: TextStyle(
                                    color: HexColor("#172B61"),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                              Text(
                                "{2021-Now}",
                                style: TextStyle(
                                    color: HexColor("#172B61"),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  const Spacer(),
                  IconRedButton(
                      iconName: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      title: "Purchase Shares",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PurchaseMoreScreen()));
                      }),
                  const Spacer(),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                  padding: EdgeInsets.only(left: size.width * 0.03),
                  child: const Text(
                    "Shares Value",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
              Container(
                  padding: EdgeInsets.only(left: size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("1 Share = 10 AED"),
                      SizedBox(height: size.height * 0.01),
                      const Text(
                          "The value of the share is determined by the Board  meeting at the end of each year."),
                    ],
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.03, right: size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Share history",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: const Text(
                  "Your other Projects",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Row(children: const [
                ProjectImageBox(imageName: "newday.png"),
                ProjectImageBox(imageName: "wecare.png")
              ])
            ],
          ),
        ],
      ),
    );
  }
}
