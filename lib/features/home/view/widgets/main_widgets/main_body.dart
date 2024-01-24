import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../auth/models/user/user.dart';
import '../../../controllers/home_controller.dart';
import '../../pages/create_user_screen.dart';
import '../../pages/users_screen.dart';
import '../../pages/profile_screen.dart';
import 'main_widget_bottom_bar.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key, required this.user});
  final User user;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int indexChosen = 0;
  late List<Widget> screens;
  HomeController controller = Get.find();

  @override
  void initState() {
    controller.setUser(widget.user);
    screens = [
      const UsersScreen(),
      const ProfileScreen(),
    ];
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        controller.internetConnection.value = false;
      } else {
        controller.clearConnectionUsers(widget.user.token!);
        controller.internetConnection.value = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(5),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            await Get.toNamed(CreateUserScreen.route, arguments: widget.user);
          },
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[indexChosen],
          MainWidgetBottomBar(
            indexChosen: indexChosen,
            fun: (index) {
              setState(() {
                indexChosen = index;
              });
            },
          )
        ],
      ),
    );
  }
}
