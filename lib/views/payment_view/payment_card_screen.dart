import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class PaymentCardScreen extends StatelessWidget {
  const PaymentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xffFEF7FF),
                borderRadius: BorderRadius.zero,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    "Set Default",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xffFEF7FF),
                borderRadius: BorderRadius.zero,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedAdd01,
                    color: Colors.black,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Add Card",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Credit Card", style: Theme.of(context).textTheme.titleLarge),
            CreditCardCustom(),
          ],
        ),
      ),
    );
  }
}

class CreditCardCustom extends StatelessWidget {
  const CreditCardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Visa Card", style: Theme.of(context).textTheme.titleMedium),
              Text(
                "0972 1234 2315 4832",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
              Text(
                "12/25",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
              Text(
                "Chhin Chhairong",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Checkbox(
            value: true,
            onChanged: (_) {},
            activeColor: Colors.black,
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
