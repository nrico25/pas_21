import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/likeController.dart';
import 'package:pas_21/controller/postController.dart';
import 'package:pas_21/widget/my_color.dart';
import 'package:pas_21/widget/soccer_card.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final Likecontroller likeController = Get.put(Likecontroller());

  @override
  Widget build(BuildContext context) {
    likeController.loadTasks();
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text(
          'Home Page',
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
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: postController.postList.length,
          itemBuilder: (context, index) =>
              SoccerCard(post: postController.postList[index]),
        );
      }),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: HomePage(),
  ));
}
