import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/widgets/show_checkout_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController cartController = Get.put(CartController());
  String getImageUrl(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images.first;
    } else if (images is String) {
      return images;
    } else {
      return 'https://via.placeholder.com/150';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("Total Products(${cartController.cartList.length})"),
        ),
      ),
      body: bodySection(context),
    );
  }

  bodySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: List.generate(
                    cartController.cartList.length,
                    (index) => cartCard(context, index),
                  ),
                ),
              ),
            ),

            if (cartController.cartList.isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text("All"),
                          ],
                        ),
                        // Right: Price summary + Button
                        GestureDetector(
                          onTap: () => showCheckoutBottomSheet(context),
                          child: Wrap(
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Total: "),
                                      Obx(
                                        () => Text(
                                          "\$${cartController.totalPrice.value.toStringAsFixed(2)}",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Discount: 15%  "),
                                      Text("Subtotal: \$170"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () => showCheckoutBottomSheet(context),
                      child: Text(
                        "Check out",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  SizedBox cartCard(BuildContext context, int index) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Slidable(
        key: ValueKey("cart_card_key_${UniqueKey()}"),

        endActionPane: ActionPane(
          motion: ScrollMotion(),
          extentRatio: 0.20,
          children: [
            SlidableAction(
              onPressed: (context) {
                // Handle delete action here
                cartController.removeCart(index);
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: getImageUrl(cartController.cartList[index]["images"]),

              width: 100,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cartController.cartList[index]["name"] ?? "No Item",
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Checkbox(value: true, onChanged: (val) {}),
                    ],
                  ),
                  Text(
                    "\$${(cartController.cartList[index]["price"] ?? 0.0).toStringAsFixed(2)}",

                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Size: ", style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 4),
                          Text("L", style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 4),
                          Text("Color: ", style: TextStyle(color: Colors.grey)),
                          Text("Black", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("-"), Text("1"), Text("+")],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
