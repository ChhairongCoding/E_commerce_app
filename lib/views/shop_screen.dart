import 'package:e_commerce_app/controllers/shop_controller.dart';
import 'package:e_commerce_app/views/search_screen.dart';
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
                      child: GestureDetector(
                        onDoubleTap: () => Get.to(SearchScreen()),
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
              Obx(
                () => Column(
                  spacing: 16,
                  children: List.generate(shopController.listCate.length, (
                    index,
                  ) {
                    final title = shopController.listCate[index]['name'];
                    final image = shopController.listCate[index]['imageUrl'];
                    final items = shopController.listCateItem[0][title] ?? [];

                    final isExpanded =
                        shopController.selectedIndex.value == index;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCategoryCardWidget(
                          title: title,
                          imageUrl: image,
                          onTap: () {
                            if (isExpanded) {
                              shopController.selectedIndex.value = -1;
                            } else {
                              shopController.selectedIndex.value = index;
                            }
                          },
                        ),
                        if (isExpanded)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: items.length * 80,
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (_, i) => Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        items[i],
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      Icon(HugeIcons.strokeRoundedArrowRight01)
                                    ],
                                  ),
                                ),
                                separatorBuilder: (_, __) =>
                                    const Divider(thickness: 1),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
