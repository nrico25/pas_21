import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_21/controller/loginController.dart';
import 'package:pas_21/controller/usernameController.dart';
import '../widget/my_text.dart';
import '../widget/my_textfield.dart';

class LoginApiPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 110),
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
                  color: Colors.pink,
                ),
              ),
            ),
          ),
            SizedBox(height: 10),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),
            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: MyText(
                                  hintText: "Nama dan password harus diisi!",
                                  fontSize: 16,
                                  colors: Colors.white,
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            await controller.login(usernameController.text,
                                passwordController.text);
                            if (controller.loginStatus.value ==
                                "Login success") {
                              Get.put(UserController())
                                  .setUsername(usernameController.text);
                              Get.snackbar(controller.loginStatus.value,
                                  controller.token.value);
                              Get.toNamed('/bottomnav');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: controller.loginStatus.value,
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isLoading.value
                        ? Colors.grey
                        : Colors.pink,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : MyText(
                          hintText: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          colors: Colors.white,
                        ),
                )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 270),
              child: MyText(
                hintText: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: Colors.black,
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account? ",
                  fontSize: 16,
                  colors: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: MyText(
                    hintText: 'Sign Up',
                    fontSize: 16,
                    colors: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tiktok, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
