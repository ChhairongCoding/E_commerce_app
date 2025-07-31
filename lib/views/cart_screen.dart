import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/widgets/show_checkout_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Total Products(12)")),
      body: Padding(
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

              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text("All"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => showCheckoutBottomSheet(context),
                      child: Row(
                        spacing: 10,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(children: [Text("Total:"), Text("\$183")]),
                              Row(
                                children: [
                                  Text("Discount: 15%"),
                                  Text("Subtotal: \$170"),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              showCheckoutBottomSheet(context);
                            },
                            child: Text(
                              "Check out",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              imageUrl: cartController.cartList[index]["image"],
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
                          cartController.cartList[index]["name"],
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Checkbox(value: true, onChanged: (val) {}),
                    ],
                  ),
                  Text(
                    cartController.cartList[index]["price"],
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
