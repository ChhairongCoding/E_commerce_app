import 'package:e_commerce_app/controllers/checkout_controller.dart';
import 'package:e_commerce_app/widgets/custom_card_my_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final RxInt selectedTab = 0
      .obs; // 0 = Pending, 1 = Delivered, 2 = Cancelled (default: Pending)

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.find<CheckoutController>();

    final tabs = ["Pending", "Delivered", "Cancelled"];

    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 100,
              floating: false,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: const Text('My Orders'),
              bottom: PreferredSize(

                preferredSize: const Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      tabs.length,
                      (index) => GestureDetector(
                        onTap: () => selectedTab.value = index,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: selectedTab.value == index
                                ? Colors.black87
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: selectedTab.value == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            

            // Order List
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomCardMyOrderWidget(
                          controller: controller,
                          index: index,
                        ),
                      );
                    },
                  childCount: controller.orderList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
