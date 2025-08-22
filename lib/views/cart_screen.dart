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
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Obx(
        () => cartController.cartList.isNotEmpty
            ? _buildBody(context)
            : _bodyNoItemSection(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      automaticallyImplyLeading: false,
      title: Obx(
        () => Text("Total Products(${cartController.cartList.length})"),
      ),
    );
  }

  _bodyNoItemSection(BuildContext context) {
    return Center(
      child: Text(
        "No Items",
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.grey),
      ),
    );
  }

  _buildBody(BuildContext context) {
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
                            Checkbox(
                              activeColor: Colors.black,
                              shape: CircleBorder(),
                              side: BorderSide(width: 1.5),
                              value: cartController.isAllSelected,
                              onChanged: (val) {
                                cartController.toggleSelectAll(val);
                              },
                            ),
                            const Text("All"),
                          ],
                        ),
                        // Right: Price summary + Button
                        GestureDetector(
                          onTap: () =>
                              showCheckoutBottomSheet(context, cartController),
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
                                    children: [
                                      Text("Discount: 0%  "),
                                      Obx(
                                        () => Text(
                                          "Subtotal: \$${cartController.totalPrice.value.toStringAsFixed(2)}",
                                        ),
                                      ),
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
                        backgroundColor:
                            cartController.selectedItems.contains(true)
                            ? Colors.black
                            : Colors.grey,
                      ),
                      onPressed: cartController.selectedItems.contains(true)
                          ? () =>
                                showCheckoutBottomSheet(context, cartController)
                          : null,
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
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: CachedNetworkImage(
                imageUrl: getImageUrl(cartController.cartList[index].images),
                width: 100,
                height: 200,
                fit: BoxFit.cover,
              ),
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
                          cartController.cartList[index].name,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Checkbox(
                        activeColor: Colors.black,
                        shape: CircleBorder(),
                        side: BorderSide(width: 1.5),
                        value: cartController.selectedItems[index],
                        onChanged: (_) {
                          cartController.toggleItemSelection(index);
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\$${(cartController.cartList[index].price).toStringAsFixed(2)}",

                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Size: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${cartController.cartList[index].selectedSize}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 4),

                              Text(
                                "Color: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurStyle: BlurStyle.inner,
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  color: cartController
                                      .cartList[index]
                                      .selectedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text("-"),
                                onTap: () {
                                  cartController.decrementQuantity(index);
                                },
                              ),

                              Flexible(
                                child: Text(
                                  "${cartController.cartList[index].quantity}",
                                ),
                              ),

                              GestureDetector(
                                child: Text("+"),
                                onTap: () =>
                                    cartController.incrementQuantity(index),
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
          ],
        ),
      ),
    );
  }
}
