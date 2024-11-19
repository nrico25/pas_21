import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/likeController.dart';
import 'package:pas_21/controller/postController.dart';
import 'package:pas_21/model/postModel.dart';

class SoccerCardGrid extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final Likecontroller likeController = Get.put(Likecontroller());
  final List<PostModel> posts;
  bool allowDeletion = false;

  SoccerCardGrid({required this.posts, this.allowDeletion = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Column(
            children: [
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  post.strBadge,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.strTeam,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[800],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        post.strLocation,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.pink[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
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
                                  Get.snackbar('Info',
                                      '${post.strTeam} added to favorites.',
                                      backgroundColor: Colors.pink[50],
                                      colorText: Colors.pink);
                                }
                              },
                              icon: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color:
                                    isLiked ? Colors.yellow[600] : Colors.white,
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
      },
    );
  }
}
