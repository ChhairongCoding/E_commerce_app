import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Image.asset(
                //     'assets/images/slowkey_logo.png',
                //     width: 160,
                //   ),
                // ),
                Text(
                  "Hi, Welcome!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                Form(
                  child: Column(
                    spacing: 16,
                    children: [
                      TextFormWidget(
                        label: "Email address",
                        hintText: "Your email",
                      ),
                      TextFormWidget(
                        label: "Password",
                        hintText: "Password",
                        iconField: Icon(Icons.visibility_off_outlined),
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                              Text(
                                "Remember me",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            56,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text("Or", style: Theme.of(context).textTheme.bodySmall),
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  MediaQuery.of(context).size.width,
                                  56,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 58, 58, 58),
                                    width: 0.3,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignInside,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 30,
                              ),
                              label: Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  MediaQuery.of(context).size.width,
                                  56,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 58, 58, 58),
                                    width: 0.3,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignInside,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                HugeIcons.strokeRoundedGoogle,
                                color: Colors.blue,
                                size: 30,
                              ),
                              label: Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w500,
                                ),
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
            Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed("/signup"),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Sora',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
