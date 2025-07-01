import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RxBool isCheck = false.obs;
    final SignupController signupController = Get.find<SignupController>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create \n your account",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 16),
                        Form(
                          key: formKey,
                          child: Column(
                            spacing: 16,
                            children: [
                              TextFormWidget(
                                controller: userNameController,
                                label: "Username",
                                hintText: "Your Username",
                              ),
                              TextFormWidget(
                                controller: emailController,
                                label: "Email",
                                hintText: "Your Email",
                              ),
                              Obx(
                                () => TextFormWidget(
                                  controller: passwordController,
                                  label: "Password",
                                  hintText: "Password",
                                  obscureText:
                                      signupController.isObsecurePw.value,
                                  suffixIcon:
                                      signupController.isObsecurePw.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  onSuffixTap: () {
                                    signupController.isObsecurePw.value =
                                        !signupController.isObsecurePw.value;
                                  },
                                ),
                              ),

                              Obx(
                                () => TextFormWidget(
                                  controller: cfPasswordController,
                                  label: "Confirm Password",
                                  hintText: "Confirm Password",
                                  obscureText:
                                      signupController.isObsecure.value,
                                  suffixIcon: signupController.isObsecure.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  onSuffixTap: () {
                                    signupController.isObsecure.value =
                                        !signupController.isObsecure.value;
                                  },
                                ),
                              ),

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
                                    "I accept the terms and privacy policy",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width,
                                    56,
                                  ),
                                  backgroundColor: Colors.lightBlue,
                                ),
                                child: Text(
                                  'Create account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ProductSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    String name = userNameController.text;
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    String cfPassword =
                                        cfPasswordController.text;
                                    if (password == cfPassword) {
                                      signupController.signup(
                                        name,
                                        email,
                                        password,
                                      );
                                    }
                                    return;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.loginRoute),
                          child: Text(
                            "Log in",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ),
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
