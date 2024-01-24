import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/core/general_widgets/g_widget_card_detail.dart';
import 'package:tdh_event/core/utils/app_constance.dart';
import 'package:tdh_event/core/utils/enums.dart';
import 'package:tdh_event/features/home/controllers/home_controller.dart';
import '../../../../core/assets_manager.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  static const String route = '/user_screen';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final HomeController controller = Get.find();

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future getUsers() async {
    await controller.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Users',
                style: TextStyle(
                    fontFamily: FontsAssets.alternategot1D,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 55),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: controller.requestState.value == RequestState.loading
              ? const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
                )
              : controller.users.isEmpty
                  ? const Center(
                      child: Text('No Users yet',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontsAssets.gotham,
                              fontSize: 24)),
                    )
                  : ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                bottom: index == controller.users.length - 1
                                    ? AppConstance.heightOfBottomBar(context) +
                                        10
                                    : 0),
                            child: GWidgetCardDetail(
                                userModel: controller.users[index]));
                      },
                    )),
    );
  }
}
