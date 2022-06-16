import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:wallet_template/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../widgets/loading.dart';

class NotificationsScreen extends StatefulWidget {
  final bool fromDrawer;
  const NotificationsScreen({Key? key, required this.fromDrawer})
      : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen>
    with WidgetsBindingObserver {
  bool loaded = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController sharesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const NavDrawer(),
        extendBodyBehindAppBar: false,
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
            color: HexColor(constants.primaryColor), //change your color here
          ),
          title: Text(
            'Notifications',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color: HexColor(constants.primaryColor)),
          ),
        ),
        body: loaded == false
            ? const NotificationsLoad()
            : ListView(
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
                      const NotifcationCard(
                          content: "some content", tag: "some tag"),

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
                      const NotifcationCard(
                          content: "some content", tag: "some tag"),
                    ],
                  ),
                ],
              ));
  }
}
