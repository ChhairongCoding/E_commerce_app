import 'package:e_commerce_app/controllers/shop_controller.dart';
import 'package:e_commerce_app/widgets/custom_category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController shopController = Get.find<ShopController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              // search
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 0.3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Icon(HugeIcons.strokeRoundedSearch01),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Color(0xFFFEF7FF),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEF7FF),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 0.3,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        HugeIcons.strokeRoundedFilterMailCircle,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),

              // category
              // Updated Shoe Display Card
              ...List.generate(
                shopController.listCate.length,
                (index) => CustomCategoryCardWidget(
                  title: shopController.listCate[index]['name'],
                  imageUrl: shopController.listCate[index]['imageUrl'],
                ),
              ),
              // CustomCategoryCardWidget(
              //   title: "Shoes",
              //   imageUrl:
              //       "https://www.rebelsport.com.au/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dwf19506fd/hof/250430-HPLP-Football-3D-Nike-SuperflyMbappe.png",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
