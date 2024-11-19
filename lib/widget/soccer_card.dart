import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/likeController.dart';
import 'package:pas_21/controller/postController.dart';
import 'package:pas_21/model/postModel.dart';
import 'package:pas_21/page/detailPage.dart';

class SoccerCard extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final Likecontroller likeController = Get.put(Likecontroller());
  final PostModel post;
  bool allowDeletion = false;

  SoccerCard({required this.post, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      color: Colors.pinkAccent.shade100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              post.strBadge,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.strTeam,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    post.strLocation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(() {
                      var isLiked =
                          likeController.getLikedById(post.idTeam!).value;
                      return IconButton(
                          onPressed: () {
                            if (isLiked) {
                              if (allowDeletion) {
                                likeController.deleteTask(post.idTeam!);
                                Get.snackbar('Info',
                                    '${post.strTeam} removed from favorites.',
                                    backgroundColor: Colors.pink[50],
                                    colorText: Colors.pink);
                              } else {
                                Get.snackbar('Error',
                                    'You can only remove favorites from Library.',
                                    backgroundColor: Colors.pink[50],
                                    colorText: Colors.pink);
                              }
                            } else {
                              likeController.addTask(post);
                              Get.toNamed('/detail', arguments: post);
                              Get.snackbar(
                                  'Info', '${post.strTeam} added to favorites.',
                                  backgroundColor: Colors.pink[50],
                                  colorText: Colors.pink);
                            }
                          },
                          icon: Icon(
                            isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: isLiked ? Colors.yellow[600] : Colors.white,
                            size: 24,
                          ));
                    }),
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
