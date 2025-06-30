import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    RxBool isCheck = false.obs;
    final SignupController signupController = Get.find<SignupController>();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an account",
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
                        label: "Email", hintText: "Your Email"),
                      Obx(
                        () => TextFormWidget(
                          controller: passwordController,
                          label: "Password",
                          hintText: "Password",
                          obscureText: signupController.isObsecurePw.value,
                          suffixIcon: signupController.isObsecurePw.value
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
                          obscureText: signupController.isObsecure.value,
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
                            style: Theme.of(context).textTheme.bodySmall,
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
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            Get.toNamed(AppRoutes.otpRoute);
                          }
                        },
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
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.loginRoute),
                  child: Text("Log in"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
