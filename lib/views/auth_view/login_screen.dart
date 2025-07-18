import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isCheck = false.obs;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 50,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                   spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot password?",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
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
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {
                                
                                  if (formKey.currentState!.validate()) {
                                    // handle login
                                  }
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'ProductSans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "or log in with",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: 16),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         shape: CircleBorder(),
                              //         padding: EdgeInsets.all(16),
                              //         side: BorderSide(
                              //           color: const Color(0xFFE2E0DF),
                              //           width: 2,
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //       child: Image.asset(
                              //         "assets/images/icons/facebook.png",
                              //         width:
                              //             MediaQuery.of(context).size.width *
                              //             0.1,
                              //       ),
                              //     ),
                              //     ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         shape: CircleBorder(),
                              //         padding: EdgeInsets.all(16),
                              //         side: BorderSide(
                              //           color: const Color(0xFFE2E0DF),
                              //           width: 2,
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //       child: Image.asset(
                              //         "assets/images/icons/google.png",
                              //         width:
                              //             MediaQuery.of(context).size.width *
                              //             0.1,
                              //       ),
                              //     ),
                              //     ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         shape: CircleBorder(),
                              //         padding: EdgeInsets.all(16),
                              //         side: BorderSide(
                              //           color: const Color(0xFFE2E0DF),
                              //           width: 2,
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //       child: Image.asset(
                              //         "assets/images/icons/phone-call.png",
                              //         width:
                              //             MediaQuery.of(context).size.width *
                              //             0.1,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Bottom Content
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () =>
                                  Get.toNamed(AppRoutes.signUpRoute),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'ProductSans',
                                  fontSize: 14,
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
            ),
          );
        },
      ),
    );
  }
}
