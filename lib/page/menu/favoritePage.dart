import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/likeController.dart';
import 'package:pas_21/widget/my_color.dart';
import 'package:pas_21/widget/soccer_card.dart';

class FavoritePage extends StatelessWidget {
  final Likecontroller likecontroller = Get.put(Likecontroller());
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    likecontroller.loadTasks();
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text(
          'Your Favorites Clubs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: pinky,
        automaticallyImplyLeading: false, 
        centerTitle: true,
      ),
      body: Obx(() {
        if (likecontroller.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: likecontroller.tasks.length,
          itemBuilder: (context, index) {
            final dataSoccer = likecontroller.tasks[index];
            return SoccerCard(
              post: dataSoccer,
              allowDeletion: true, 
            );
          },
        );
       
      }),
    );
  }
  
}
