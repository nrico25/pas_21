import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/bottomnav_controller.dart';
import 'package:pas_21/controller/responsive_controller.dart';
import 'package:pas_21/page/menu/homePage.dart';
import 'package:pas_21/page/menu/profilePage.dart';
import 'package:pas_21/page/menu/tabletmenulayout/responsiveLayout.dart';
import 'package:pas_21/widget/my_color.dart';


class BottomNavPage extends StatelessWidget {
  final ResponsiveController responsiveController =
      Get.put(ResponsiveController());
  BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    //coneccting controller dengan UI
    final BottomNavController bottomnavController = Get.find();

    final List<Widget> menus = [
      HomePage(),
      LayoutBuilder(
        builder: (context, constraints) {
          responsiveController.updateScreenWidth(constraints.maxWidth);
          return ResponsiveLayout();
        },
      ),
      ProfilePage()
    ];

    return Obx(() {
      return Scaffold(
        body: menus[bottomnavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomnavController.selectedIndex.value,
            onTap: bottomnavController.changeMenu,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add_rounded), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.pinkAccent.shade100,
                  backgroundColor: Colors.pink,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,),
      );
    });
  }
}
