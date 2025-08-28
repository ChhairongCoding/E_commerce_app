import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    final user = authController.profile[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
            
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            Stack(
              children: [
                 CircleAvatar(
                  radius: 70,
                  backgroundImage: CachedNetworkImageProvider(
                    user['image'] ??
                        "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                  ) ,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.white),
                    ),
                    child: IconButton(
                      icon: const Icon(HugeIcons.strokeRoundedEdit03, color: Colors.white, size: 20),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildTextField(
              label: 'Full Name',
              initialValue: user['name'],
              icon: HugeIcons.strokeRoundedUser,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: user['email'],
              initialValue: 'john.doe@example.com',
              icon: HugeIcons.strokeRoundedMail01,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Phone Number',
              initialValue: user['phone'],
              icon: HugeIcons.strokeRoundedPhoneOff01,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Location',
              initialValue: user['address'],
              icon: HugeIcons.strokeRoundedLocation01,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}