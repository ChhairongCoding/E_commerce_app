import 'dart:convert';

import 'package:e_commerce_app/core/constand.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/services/local/token_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class AuthService extends GetxController {
  final TokenService _tokenService = TokenService();

  var isLoggedIn = false.obs;
  var userId = ''.obs;
  var userRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    String token = _tokenService.getToken();

    if (token.isNotEmpty) {
    

      if (!JwtDecoder.isExpired(token)) {
        isLoggedIn.value = true;
      } else {
        isLoggedIn.value = false;
        _tokenService.clearToken();
      }
    }
  }

  void logout() {
    _tokenService.clearToken();
    isLoggedIn.value = false;
  }

  void checkTokenExpiry(String token) {
    DateTime expiryDate = JwtDecoder.getExpirationDate(token);
    print("Token expires at: $expiryDate");

    bool isExpired = JwtDecoder.isExpired(token);
    print("Is token expired? $isExpired");
  }

  Future<void> login(String email, String password) async {
    Map<String, dynamic> body = {'email': email, 'password': password};
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      final url = Uri.parse('$baseUrl/');
      var res = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          'Content-Type': "application/json",
          "x-api-key": "my_super_secret_key",
        },
      );
      if (res.statusCode == 200) {
        final token = jsonDecode(res.body)['token'];
        _tokenService.setToken(token);
        Get.back();
        Get.snackbar(
          "Sign In",
          "Sign in has been successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xff012B43),
          colorText: Colors.white,
          duration: Duration(seconds: 10),
        );
      } else {
        print("Error Login ${res.statusCode}");
      }

      Get.toNamed("/");
    } catch (e) {
      Get.back();
      // ignore: avoid_print
      print(e);
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signup(String username, String email, String password) async {
    Map<String, dynamic> body = {
      'name': username,
      'email': email,
      'password': password,
    };
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      final url = Uri.parse("$baseUrl/users/register");
      final res = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          'Content-Type': "application/json",
          "x-api-key": "my_super_secret_key",
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Get.back();
        final token = jsonDecode(res.body)['token'];
        _tokenService.setToken(token);
        Get.snackbar(
          "Sign In",
          "Sign in has been successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xff012B43),
          colorText: Colors.white,
          duration: Duration(seconds: 10),
        );
        Get.toNamed(AppRoutes.otpRoute);
      } else {
        print("Error Sign Up ${res.statusCode}");
      }
    } catch (e) {
      Get.back();
      // ignore: avoid_print
      print(e);
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
