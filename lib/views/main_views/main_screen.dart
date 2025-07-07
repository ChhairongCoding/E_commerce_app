import 'package:e_commerce_app/controllers/drawer_controller_x.dart';
import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();

    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SlowKey Kits",
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
        () => Container(
          margin: EdgeInsets.only(top: 10),
          child: BottomNavigationBar(
            currentIndex: mainController.currentIndex.value,
            onTap: mainController.toggleSwitch,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedHome01),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedSearch02),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedFavourite),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedShoppingCart01),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedUser),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer drawerWidget(BuildContext context) {
    final DrawerControllerX drawerController = Get.find<DrawerControllerX>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 90),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chhin Chhairong',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'ProductSans',
                            ),
                      ),
                      Text(
                        "chhairong18@gmail.com",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 0,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedHome01),
              title: const Text("Home"),
              onTap: () {
                drawerController.changeIndex(0);
              },
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 1,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedSearch02),
              title: const Text("Discover"),
              onTap: () => drawerController.changeIndex(1),
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 2,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedShoppingBag02),
              title: const Text("My Order"),
              onTap: () => drawerController.changeIndex(2),
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 3,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedUser),
              title: const Text("My Profile"),
              onTap: () => drawerController.changeIndex(3),
            ),
          ),
          ListTile(title: Text("Other")),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 4,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedSetting07),
              title: const Text("Setting"),
              onTap: () => drawerController.changeIndex(4),
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 5,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedMail01),
              title: const Text("Support"),
              onTap: () => drawerController.changeIndex(5),
            ),
          ),
          Obx(
            () => ListTile(
              selected: drawerController.selectedIndex.value == 6,
              selectedColor: Colors.blue,
              leading: Icon(HugeIcons.strokeRoundedInformationCircle),
              title: const Text("Setting"),
              onTap: () => drawerController.changeIndex(6),
            ),
          ),
          Divider(),
            Padding(
            padding: const EdgeInsets.all(12),
            child: Obx(
              () => SwitchListTile(
              title: const Text("Dark Mode"),
              value: drawerController.isDarkMode.value,
              onChanged: (val) {
                drawerController.isDarkMode.value = val;
                Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
              },
              secondary: const Icon(Icons.dark_mode),
              ),
            
            ),
          ),
        ],
      ),
    );
  }
}
