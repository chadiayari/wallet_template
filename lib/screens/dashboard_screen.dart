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

  final Map _widgetOptions = {
    0: const HomeScreen(),
    1: const NotificationsScreen(fromDrawer: false),
    2: const ProfileScreen(),
  };

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
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
          },
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: _widgetOptions[_selectedIndex],
          ),
        ));
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, -5.0),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 12, right: 5, left: 5),
        decoration: BoxDecoration(
          color: HexColor(constants.primaryColor),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
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
