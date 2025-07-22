import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 16, // ⬅️ your original spacing
                  children: [
                    SizedBox(
                      child: ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: 68,
                          imageUrl:
                              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a84ab47d-4349-4943-ae58-dd3b4826c6ba/d5uxc1h-1ea4bf58-9207-4e1e-a370-6bba45b1d13f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4NGFiNDdkLTQzNDktNDk0My1hZTU4LWRkM2I0ODI2YzZiYVwvZDV1eGMxaC0xZWE0YmY1OC05MjA3LTRlMWUtYTM3MC02YmJhNDViMWQxM2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ttGhrLFDUjQgzpWxkE1xTqsJff-FTIPe94zJlCd3O1s",
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chhairong Chhin",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "chhairongchhin@gmail.com",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
            ),
            SizedBox(height: 20),

            /// ✅ This part is modified to center the container
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextButton(
                        title: "Address",
                        icon: Icons.location_pin,
                        appRoute: AppRoutes.shipping,
                      ),
                      Divider(),
                      CustomTextButton(
                        title: "Payment method",
                        icon: Icons.wallet,
                        appRoute: AppRoutes.shipping,
                      ),

                      Divider(),
                      CustomTextButton(
                        title: "Voucher",
                        icon: Icons.discount_rounded,
                        appRoute: AppRoutes.shipping,
                      ),

                      Divider(),
                      CustomTextButton(
                        title: "My Wishlist",
                        icon: Icons.favorite,
                        appRoute: AppRoutes.shipping,
                      ),

                      Divider(),

                      CustomTextButton(
                        title: "Change Theme",
                        icon: Icons.sunny,
                        appRoute: AppRoutes.theme,
                      ),

                      Divider(),
                      CustomTextButton(
                        title: "Log out",
                        icon: Icons.logout,
                        appRoute: AppRoutes.shipping,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.icon,
    required this.appRoute,
  });

  final String title;
  final IconData icon;
  final String appRoute;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56, // ✅ Set fixed height for full clickable area
      child: TextButton(
        onPressed: () => Get.toNamed(appRoute),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          alignment: Alignment.centerLeft,
          foregroundColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          overlayColor: WidgetStateProperty.all(
            Colors.grey.shade200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(title, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
