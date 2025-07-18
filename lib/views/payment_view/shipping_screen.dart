import 'package:e_commerce_app/widgets/shipping_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping"),
        actions: [TextButton(onPressed: () {}, child: Text("+ New Shipping"))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shihan Town, Nanhai District",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                        Text(
                          "No. 31, Tiekeng Industrial Zone, Guihe Road, Jitu International",
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: () => shippingBottomSheet(context),
                      icon: Icon(HugeIcons.strokeRoundedEdit01),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Text(
                  "Rong02832   0917384893",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                ),
                Text(
                  "Defualt",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
