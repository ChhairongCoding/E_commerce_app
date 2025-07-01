import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GettingStartScreen extends StatelessWidget {
  const GettingStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0D5EA6),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo/SlowKey_kits_512.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 0, bottom: 40, left: 20, right: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Fall in Love with \n our best Services in Slowkey!",
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Welcome to our SlowKey buil pc and selling accessories, where every accessories is a good quality for you.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'ProductSans',
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    fixedSize: Size(MediaQuery.of(context).size.width, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Create an acount",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProductSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () => Get.toNamed(AppRoutes.signUpRoute),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style:Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.loginRoute),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'ProductSans',
                        ),
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
