import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: List.generate(10, (index) => cartCard(context)),
                ),
              ),
            ),

            detailTotal(context),
          ],
        ),
      ),
    );
  }

  Padding detailTotal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Price",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              Text("\$219", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              Text("Freeship", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
              Text("\$219", style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            onPressed: () {},
            child: Text(
              "Proceed to checkout",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox cartCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.wixstatic.com/media/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png",
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
                        "Title",
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Checkbox(value: true, onChanged: (val) {}),
                  ],
                ),
                Text("\$80.00",style: Theme.of(context).textTheme.titleMedium,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Size: ",style: TextStyle(color: Colors.grey),),
                        SizedBox(width: 4),
                        Text("L",style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 4),
                        Text("Color: ",style: TextStyle(color: Colors.grey)),
                        Text("Black",style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("-"),
                          Text("1"),
                          Text("+")
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
