import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/likeController.dart';
import 'package:pas_21/widget/soccer_gridCard.dart';

class FavoriteTabletPage extends StatelessWidget {
  final Likecontroller likecontroller = Get.put(Likecontroller());
  FavoriteTabletPage({super.key});
  @override
  Widget build(BuildContext context) {
    likecontroller.loadTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Zalora'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Obx(() {
        if (likecontroller.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.pinkAccent.shade400)),
          );
        }
        return SoccerCardGrid(
          posts: likecontroller.tasks,
          allowDeletion: true,
        );
      }),
    );
  }
}
