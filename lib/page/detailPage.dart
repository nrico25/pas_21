import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pas_21/controller/postController.dart';
import 'package:pas_21/model/postModel.dart';
import 'package:pas_21/widget/my_color.dart';

class DetailPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
     PostModel post = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.pink[80],
      appBar: AppBar(
        title: Text(post.strTeam,
        style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: pinky, 
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  post.strBadge,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              post.strTeam,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              post.strLocation,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink[300],
              ),
            ),
            
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}