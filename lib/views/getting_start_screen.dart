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
          // Text("image"),
          
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset('assets/images/slowkey_logo_getting.png',),
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
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Welcome to our SlowKey buil pc and selling accessories, where every accessories is a good quality for you.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Sora',
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
                      fontFamily: 'Sora',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => Get.toNamed('/signup'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Sora',
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/login'),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
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
