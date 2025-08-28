import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/widgets/edit_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final user = authController.profile[0];
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          'Profile Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: CachedNetworkImageProvider(
                user['image'] ??
                    "https://cdn-icons-png.flaticon.com/512/149/149071.png",
              ),
            ),

            const SizedBox(height: 16),
            Text(
              user['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user['email'],
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            _buildSettingsSection(context),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            context,
            icon: HugeIcons.strokeRoundedUser,
            title: 'Edit Profile',
            onTap: () {
              Get.to(EditProfileWidget());
            },
          ),
          _buildSettingsTile(
            context,
            icon: HugeIcons.strokeRoundedNotification01,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildSettingsTile(
            context,
            icon: HugeIcons.strokeRoundedLock,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          _buildSettingsTile(
            context,
            icon: HugeIcons.strokeRoundedHelpCircle,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildSettingsTile(
            context,
            icon: HugeIcons.strokeRoundedInformationCircle,
            title: 'About Us',
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(icon, color: Colors.grey[800]),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            CupertinoIcons.chevron_forward,
            size: 20,
            color: Colors.grey,
          ),
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF5F5F5)),
          ),
      ],
    );
  }
}
