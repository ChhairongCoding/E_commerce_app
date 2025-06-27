import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 16,
              children: [
                Text(
                  "Create an account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height:16,
                ),
                Form(
                  child: Column(
                    spacing: 16,
                    children: [
                      TextFormWidget(
                        label: "Username",
                        hintText: "Your Username",
                      ),
                      TextFormWidget(
                        label: "Passowrd",
                        hintText: "Your Password",
                      ),
                      TextFormWidget(
                        label: "Confirm Passowrd",
                        hintText: "Confirm Your Username",
                        obscureText: true,
                        iconField: Icon(HugeIcons.strokeRoundedEye),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? value) {
                              value!;
                            },
                          ),
                          Text("I accept the terms and privacy policy",style: Theme.of(context).textTheme.bodySmall,)
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fixedSize: Size(MediaQuery.of(context).size.width, 56),
                          backgroundColor: Colors.lightBlue,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sora',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?  "),
                TextButton(onPressed: ()=>Get.toNamed('/login'), child: Text("Log in"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
