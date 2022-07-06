import 'package:wallet_template/screens/notifications_screen.dart';
import 'package:wallet_template/screens/profile_screens/profile_screen.dart';
import 'package:wallet_template/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen>
    with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final controller = PageController();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, size.height * 0.025),
          child: BottomNavigationBar(
            backgroundColor: HexColor(constants.blue),
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? const RadiantGradientMask(
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        ),
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? const RadiantGradientMask(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        ),
                      )
                    : const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? const RadiantGradientMask(
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                      )
                    : const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: HexColor('#ffffff'),
            onTap: (index) {
              _onItemTapped(index);
              controller.animateToPage(index,
                  curve: Curves.ease,
                  duration: const Duration(
                      hours: 0, minutes: 0, seconds: 0, milliseconds: 200));
            },
          ),
        ),
        body: PageView(
            onPageChanged: (value) => {
                  _onItemTapped(value),
                },
            controller: controller,
            children: const [
              HomeScreen(),
              NotificationsScreen(fromDrawer: false),
              ProfileScreen()
            ]));
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Transform.translate(
      offset: Offset(0.0, -size.height * 0.007),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10, right: 5, left: 5),
        decoration: BoxDecoration(
          color: HexColor(constants.secondaryColor),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 7,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
