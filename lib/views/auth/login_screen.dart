import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isCheck = false.obs;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final LoginController loginController = Get.find<LoginController>();

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
                  key: formKey,
                  child: Column(
                    spacing: 16,
                    children: [
                      TextFormWidget(
                        controller: emailController,
                        label: "Email address",
                        hintText: "Your email",
                      ),
                      Obx(
                        () => TextFormWidget(
                          controller: passwordController,
                          label: "Password",
                          hintText: "Password",
                          obscureText: loginController.isObsecure.value,
                          suffixIcon: loginController.isObsecure.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixTap: () {
                            loginController.isObsecure.value =
                                !loginController.isObsecure.value;
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: isCheck.value,
                                  onChanged: (bool? value) {
                                    isCheck.value = value ?? false;
                                  },
                                ),
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
                        onPressed: () {
                           if(formKey.currentState!.validate()){
                            
                          }
                        },
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
                            child: ElevatedButton(
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
                              child: Image.asset(
                                "assets/images/icons/facebook.png",
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                          ),

                          Expanded(
                            child: ElevatedButton(
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
                              child: Image.asset(
                                "assets/images/icons/google.png",
                                width: MediaQuery.of(context).size.width * 0.1,
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
                      onPressed: () => Get.toNamed(AppRoutes.signUpRoute),
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
