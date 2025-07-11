import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final RxInt selectedIndex = 0.obs;
  final RxInt selectedCardIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Check out"),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 26,
            children: [
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "Payment",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      spacing: 16,
                      children: List.generate(3, (index) {
                        final isSelected = selectedIndex.value == index;
                        final icon = index == 0
                            ? Icons.money_rounded
                            : index == 1
                            ? Icons.credit_card
                            : Icons.more_horiz;
          
                        final label = index == 0
                            ? "Cash"
                            : index == 1
                            ? "Credit Card"
                            : "More";
          
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => selectedIndex.value = index,
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 200,
                                minHeight: 70,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : const Color(0xff6E768A),
                                  width: isSelected ? 1.5 : 0.4,
                                ),
                                color: isSelected
                                    ? Colors.blue.withOpacity(0.1)
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icon,
                                    size: 32,
                                    color: isSelected
                                        ? Colors.blue
                                        : const Color(0xff6E768A),
                                  ),
                                  Text(
                                    label,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.blue
                                          : const Color(0xff6E768A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
          
             Obx(()=> selectedIndex.value == 1 ? creditCard(context) : SizedBox.shrink(),)
            ],
          ),
        ),
      ),
    );
  }

  Column creditCard(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose your card",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Add new+",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: Color(0xffF20000)),
            ),
          ],
        ),
        const SizedBox(height: 16),
         SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2, // number of cards
              itemBuilder: (context, index) {
                final isSelected = selectedCardIndex.value == index;
                return GestureDetector(
                  onTap: () => selectedCardIndex.value = index,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(20),
                    width: isSelected ? 300 : 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://img.freepik.com/free-vector/gradient-grainy-texture_23-2148976750.jpg?semt=ais_hybrid&w=740",
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "VISA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "**** **** **** 1234",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CHHIN CHHAIRONG",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "12/27",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
