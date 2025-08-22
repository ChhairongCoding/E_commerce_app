import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/drawer_controllerx.dart';
import 'package:e_commerce_app/theme/app_theme.dart';
import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final CartController cartController = Get.find<CartController>();

  List<Widget> listIcons() => [
    Icon(HugeIcons.strokeRoundedHome01),
    Obx(
      () => cartController.cartList.isNotEmpty ?  Badge(
        label: Text(
          "${cartController.cartList.length}",
          style: TextStyle(color: Colors.white),
        ),
        child: Icon(HugeIcons.strokeRoundedShoppingCart01),
      ): Icon(HugeIcons.strokeRoundedShoppingCart01),
    ),
    Icon(HugeIcons.strokeRoundedNotification01),
    Icon(HugeIcons.strokeRoundedUser),
  ];

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());
    return Obx(
      () => Scaffold(
        body: _buildBody(mainController),

        bottomNavigationBar: _buildBottomNavigationBar(mainController),
        drawer: drawerWidget(
          context,
        ), // Keep drawer but can be sliver style too
      ),
    );
  }

  Widget _buildBody(MainController mainController) =>
      mainController.listScreens[mainController.currentIndex.value];

  Widget _buildBottomNavigationBar(MainController mainController) {
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

  /// Drawer → still normal Drawer, but you can also turn it into SliverList inside CustomScrollView if needed
  Widget drawerWidget(BuildContext context) {
    final AppTheme appTheme = Get.put(AppTheme());
    final DrawerControllerX drawerController = Get.put(DrawerControllerX());

    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DrawerHeader(
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
          SliverList(
            delegate: SliverChildListDelegate([
              _drawerTile(
                drawerController,
                0,
                HugeIcons.strokeRoundedHome01,
                "Home",
              ),
              _drawerTile(
                drawerController,
                1,
                HugeIcons.strokeRoundedSearch02,
                "Discover",
              ),
              _drawerTile(
                drawerController,
                2,
                HugeIcons.strokeRoundedShoppingBag02,
                "My Order",
              ),
              _drawerTile(
                drawerController,
                3,
                HugeIcons.strokeRoundedUser,
                "My Profile",
              ),
              const ListTile(title: Text("Other")),
              _drawerTile(
                drawerController,
                4,
                HugeIcons.strokeRoundedSetting07,
                "Setting",
              ),
              _drawerTile(
                drawerController,
                5,
                HugeIcons.strokeRoundedMail01,
                "Support",
              ),
              _drawerTile(
                drawerController,
                6,
                HugeIcons.strokeRoundedInformationCircle,
                "About",
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Obx(
                  () => SwitchListTile(
                    title: const Text("Dark Mode"),
                    value: appTheme.isDarkMode.value,
                    onChanged: (val) {
                      appTheme.isDarkMode.value = val;
                      Get.changeThemeMode(
                        val ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                    secondary: const Icon(Icons.dark_mode),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile(
    DrawerControllerX drawerController,
    int index,
    IconData icon,
    String title,
  ) {
    return Obx(
      () => ListTile(
        selected: drawerController.selectedIndex.value == index,
        selectedColor: Colors.blue,
        leading: Icon(icon),
        title: Text(title),
        onTap: () => drawerController.changeIndex(index),
      ),
    );
  }
}
