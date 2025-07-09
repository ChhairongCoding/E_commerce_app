import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/widgets/show_checkout_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
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
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            //check out
                          },
                          child: Text("Check-Out"),
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
                Text("\$80.00", style: Theme.of(context).textTheme.titleMedium),
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
    );
  }
}