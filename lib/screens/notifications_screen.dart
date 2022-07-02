import 'dart:ui';

import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:wallet_template/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class NotificationsScreen extends StatefulWidget {
  final bool fromDrawer;
  const NotificationsScreen({Key? key, required this.fromDrawer})
      : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen>
    with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  List<bool> opened = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    notificationPopup(notificationContent) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                content: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: HexColor(constants.blue)),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  //padding: const EdgeInsets.all(15),
                  height: size.height * 0.17,
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: size.width * 0.9,
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                            color: HexColor(constants.blue),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28)),
                          ),
                          child: const Center(
                            child: Text(
                              "Notification",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      const Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Text(
                          notificationContent,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
        endDrawer: const NavDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: !widget.fromDrawer ? 0 : 56.0,
          leading: widget.fromDrawer
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : Container(),
          centerTitle: false,
          iconTheme: IconThemeData(
            color: HexColor(constants.secondaryColor), //change your color here
          ),
          title: Text(
            'Notifications',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
                color: HexColor(constants.secondaryColor)),
          ),
        ),
        body: Container(
          decoration: constants.backgroundGradientStyle,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //new notifications
                  Container(
                    padding: const EdgeInsets.all(22),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "New",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  for (int i = 0; i <= 4; i++)
                    !opened[i]
                        ? GestureDetector(
                            onTap: () {
                              notificationPopup("Notification Content $i");
                              setState(() {
                                opened[i] = true;
                              });
                            },
                            child: NotifcationCard(
                              content: "Notification Content $i",
                              opened: opened[i],
                            ),
                          )
                        : Container(),

                  //earlier notifications
                  Container(
                    padding: const EdgeInsets.all(22),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Earlier",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  for (int i = 0; i <= 4; i++)
                    opened[i]
                        ? GestureDetector(
                            onTap: () {
                              notificationPopup("zzzzz");
                              setState(() {
                                opened[i] = true;
                              });
                            },
                            child: NotifcationCard(
                              content: "Notification Content $i",
                              opened: opened[i],
                            ),
                          )
                        : Container(),
                ],
              ),
            ],
          ),
        ));
  }
}
