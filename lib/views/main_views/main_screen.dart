import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("SlowKey Kits", style: Theme .of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: Icon(HugeIcons.strokeRoundedNotification02, size: 26),
            onPressed: () {},
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(HugeIcons.strokeRoundedMenu05, size: 26),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      body: Obx(
        () => mainController.listScreens[mainController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: mainController.currentIndex.value,
          onTap: mainController.toggleSwitch,
          selectedItemColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(HugeIcons.strokeRoundedHome01),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(HugeIcons.strokeRoundedFavourite),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
