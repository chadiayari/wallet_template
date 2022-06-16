import 'package:wallet_template/screens/profile_screens/project_screen.dart';
import 'package:wallet_template/widgets/project_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/loading.dart';

class ProfileProjects extends StatefulWidget {
  const ProfileProjects({Key? key}) : super(key: key);
  @override
  State<ProfileProjects> createState() => _ProfileProjects();
}

class _ProfileProjects extends State<ProfileProjects>
    with WidgetsBindingObserver {
  bool loaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loaded == false
        ? const Load()
        : Transform.translate(
            offset: Offset(0.0, -size.width * 0.2),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My projects",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: const Text(
                      "Hoot",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProjectScreen()));
                    },
                    child: const ProjectWidget(
                      ownedShares: "0",
                      sharesValue: "0",
                      returnPurchase: "0",
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
