import 'package:e_commerce_app/widgets/custom_card_my_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final RxInt indexed = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Order",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () => indexed(0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: indexed.value == 0
                                ? Colors.black
                                : Color(0xffFEF7FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Ongoing",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: indexed.value == 0
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => indexed(1),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: indexed.value == 1
                                ? Colors.black
                                : Color(0xffFEF7FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Completed",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: indexed.value == 1
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              CustomCardMyOrderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
