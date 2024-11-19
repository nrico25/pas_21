import 'package:get/get.dart';
import 'package:pas_21/controller/responsive_controller.dart';
import 'package:flutter/material.dart';
import 'package:pas_21/page/menu/favoritePage.dart';
import 'package:pas_21/page/menu/tabletmenulayout/favoriteTabletPage.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({super.key});
  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsiveController.isMobile()) {
        return FavoritePage();
      } else{
        return FavoriteTabletPage();
      }
    });
  }
}