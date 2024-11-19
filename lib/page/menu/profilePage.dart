import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/usernameController.dart';
import 'package:pas_21/widget/my_color.dart';

class ProfilePage extends StatelessWidget {
  final UserController usercontroller = Get.put(UserController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        children: [
          Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Obx(() {
                    return Text(
                      "Hi, ${usercontroller.username.value}",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent.shade700,
                      ),
                    );
                  }),
                  SizedBox(height: 70),
                  ListTile(
                    leading: Icon(Icons.settings_outlined, color: pinky),
                    title: Text("Settings",
                        style: TextStyle(color: pinky, fontSize: 18)),
                    trailing: Icon(Icons.arrow_forward_ios, color: pinky),
                    onTap: () {},
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.notifications_none_outlined, color: pinky),
                    title: Text("Notification",
                        style: TextStyle(color: pinky, fontSize: 18)),
                    trailing: Icon(Icons.arrow_forward_ios, color: pinky),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline, color: pinky),
                    title: Text("Terms and Service",
                        style: TextStyle(color: pinky, fontSize: 18)),
                    trailing: Icon(Icons.arrow_forward_ios, color: pinky),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_outlined, color: pinky),
                    title: Text("Log Out",
                        style: TextStyle(color: pinky, fontSize: 18)),
                    trailing: Icon(Icons.arrow_forward_ios, color: pinky),
                    onTap: () {
                      Get.toNamed('/');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
