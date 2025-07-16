import 'package:flutter/material.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shipping Information")),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16),
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
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                        ),
                        Text(
                          "No. 31, Tiekeng Industrial Zone, Guihe Road, Jitu International",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                   Flexible(
                    child: Text("Edit")
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
