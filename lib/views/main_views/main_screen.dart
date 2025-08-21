import 'package:e_commerce_app/controllers/drawer_controllerx.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/theme/app_theme.dart';
import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  List<Widget> listIcons() => [
    Icon(HugeIcons.strokeRoundedHome01),
    Icon(HugeIcons.strokeRoundedShoppingCart01),
    Icon(HugeIcons.strokeRoundedNotification01),
    Icon(HugeIcons.strokeRoundedUser),
  ];

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();
    return Obx(
      () => Scaffold(
        appBar: mainController.currentIndex.value == 0 ? _buildAppBar() : null,

        body: _buildBody(mainController),

        bottomNavigationBar: _buildBottomNavigationBar(mainController),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.myOrder),
          icon: Icon(HugeIcons.strokeRoundedShoppingBag02),
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(HugeIcons.strokeRoundedPinLocation03, size: 14),
              SizedBox(width: 8),
              Text("Your location", style: TextStyle(fontSize: 12)),
            ],
          ),
          Text(
            "Phnom Penh",
            style: TextStyle(fontSize: 14, fontFamily: "ProductSans"),
          ),
        ],
      ),
    );
  }

  _buildBody(MainController mainController) =>
      mainController.listScreens[mainController.currentIndex.value];

  _buildBottomNavigationBar(MainController mainController) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        currentIndex: mainController.currentIndex.value,
        onTap: mainController.toggleSwitch,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          listIcons().length,
          (index) =>
              BottomNavigationBarItem(icon: listIcons()[index], label: ""),
        ),
      ),
    );
  }

  drawerWidget(BuildContext context) {
    final AppTheme appTheme = Get.put(AppTheme());

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
                value: appTheme.isDarkMode.value,
                onChanged: (val) {
                  appTheme.isDarkMode.value = val;
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
