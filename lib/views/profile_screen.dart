import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFEF7FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey, width: 0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 16,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 68,
                                  imageUrl:
                                      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a84ab47d-4349-4943-ae58-dd3b4826c6ba/d5uxc1h-1ea4bf58-9207-4e1e-a370-6bba45b1d13f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4NGFiNDdkLTQzNDktNDk0My1hZTU4LWRkM2I0ODI2YzZiYVwvZDV1eGMxaC0xZWE0YmY1OC05MjA3LTRlMWUtYTM3MC02YmJhNDViMWQxM2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ttGhrLFDUjQgzpWxkE1xTqsJff-FTIPe94zJlCd3O1s",
                                ),
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
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFEF7FF),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Order",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // ensures vertical alignment
                        children: [
                          buildOrderItem(
                            HugeIcons.strokeRoundedPayment01,
                            "Pending Payment",
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedDeliveryBox01,
                            "Awaiting Shipment",
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedDeliveredSent,
                            "Awaiting Receipt",
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedPayByCheck,
                            "Refund",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffFEF7FF),
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      CustomTextButton(
                        title: "Personal Details",
                        icon: HugeIcons.strokeRoundedUser,
                        appRoute: AppRoutes.shipping,
                      ),
                      CustomTextButton(
                        title: "My Order",
                        icon: HugeIcons.strokeRoundedShoppingBag02,
                        appRoute: AppRoutes.shipping,
                      ),
                      CustomTextButton(
                        title: "My Favourite",
                        icon: HugeIcons.strokeRoundedFavourite,
                        appRoute: AppRoutes.shipping,
                      ),

                      CustomTextButton(
                        title: "Shipping Address",
                        icon: HugeIcons.strokeRoundedPinLocation01,
                        appRoute: AppRoutes.shipping,
                      ),

                      CustomTextButton(
                        title: "My Card",
                        icon: HugeIcons.strokeRoundedCreditCard,
                        appRoute: AppRoutes.paymentCard,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffFEF7FF),
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      CustomTextButton(
                        title: "FAQs",
                        icon: HugeIcons.strokeRoundedAlertCircle,
                        appRoute: AppRoutes.theme,
                      ),
                      CustomTextButton(
                        title: "Privacy Policy",
                        icon: HugeIcons.strokeRoundedPolicy,
                        appRoute: AppRoutes.theme,
                      ),
                      CustomTextButton(
                        title: "Change Theme",
                        icon: HugeIcons.strokeRoundedMoon,
                        appRoute: AppRoutes.theme,
                      ),
                      CustomTextButton(
                        title: "Delete Account",
                        icon: HugeIcons.strokeRoundedDelete02,
                        appRoute: AppRoutes.theme,
                      ),
                      CustomTextButton(
                        title: "Log out",
                        icon: HugeIcons.strokeRoundedLogoutCircle01,
                        appRoute: AppRoutes.shipping,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
      height: 56,
      child: TextButton(
        onPressed: () => Get.toNamed(appRoute),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          alignment: Alignment.centerLeft,
          foregroundColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          overlayColor: WidgetStateProperty.all(Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: Colors.black, size: 25),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildOrderItem(IconData icon, String label) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(alignment: Alignment.center, child: Icon(icon, size: 25)),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    ),
  );
}
