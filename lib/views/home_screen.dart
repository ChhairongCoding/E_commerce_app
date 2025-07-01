import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            Stack(
              alignment: Alignment.center, // Centers the text
              children: [
                Image.network(
                  "https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200",
                  width: double.infinity,
                  height: size.height * 0.7,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),

                Container(
                  width: double.infinity,
                  height: size.height * 0.7,
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.5),
                ),

                Text(
                  "Collection \n 1995-97's \n Season Jersey ".toUpperCase(),
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    height: 1.2,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "New Arrival".toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("All"),
                            Text("Mens"),
                            Text("Kits"),
                            Text("Tshirt"),
                            Text("Jersey"),
                          ],
                        ),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: List.generate(
                            homeController.listProduct.length,
                            (index) => CustomCardWidget(
                              data: homeController.listProduct[index],
                            ),
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
