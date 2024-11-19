import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/bindings/bindings.dart';
import 'package:pas_21/page/bottomnav.dart';
import 'package:pas_21/page/detailPage.dart';
import 'package:pas_21/page/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginApiPage(),
        ),
        GetPage(
          name: '/bottomnav',
          page: () => BottomNavPage(),
          binding: MyBindings()
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPage(),
          binding: MyBindings()
        )
      ],
    );
  }
}
