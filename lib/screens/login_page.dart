import 'package:catalog_app/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
        ),
      ),
      drawer: const Drawer(
        child: DrawerHeader(
          child: Text("Siddhesh"),
        ),
      ),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return buildLoginButton();
          } else {
            return buildProfileView();
          }
        }),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? '')
                  .image,
          radius: 50,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline4,
        ),
        Text(controller.googleAccount.value?.email ?? '',
            style: Get.textTheme.bodyText1),
        ActionChip(
          label: const Text("Logout"),
          onPressed: () {
            controller.logout();
          },
          avatar: Icon(Icons.logout),
        ),
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      label: const Text(
        "Sign in with Google",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      icon: Image.asset(
        'assets/google_logo.png',
        height: 26,
        width: 26,
      ),
      backgroundColor: Colors.white,
    );
  }
}
