import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/edit_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.find<PaymentController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ProfileUser(),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                            HugeIcons.strokeRoundedDeliveryBox01,
                            "Awaiting Shipment",
                            paymentController,
                            AppRoutes.myOrder,
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedDeliveredSent,
                            "Awaiting Receipt",
                            paymentController,
                            null,
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedSafeDelivery01,
                            "Arrived",
                            paymentController,
                            null,
                          ),
                          buildOrderItem(
                            HugeIcons.strokeRoundedPayByCheck,
                            "Refund",
                            paymentController,
                            null,
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
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomTextButton(
                        title: "Personal Details",
                        icon: HugeIcons.strokeRoundedUser,
                        appRoute: AppRoutes.profileSetting,
                      ),
                      CustomTextButton(
                        title: "My Order",
                        icon: HugeIcons.strokeRoundedShoppingBag02,
                        appRoute: AppRoutes.myOrder,
                      ),
                      CustomTextButton(
                        title: "My Favourite",
                        icon: HugeIcons.strokeRoundedFavourite,
                        appRoute: AppRoutes.favorite,
                      ),

                      CustomTextButton(
                        title: "Shipping Address",
                        icon: HugeIcons.strokeRoundedPinLocation01,
                        appRoute: AppRoutes.shipping,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
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

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});
  

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
   final user = authController.profile[0];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                SizedBox(
                  child: ClipOval(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 68,
                      imageUrl:
                        user['image'],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user['name'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      user['email'],
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              child: Icon(
                HugeIcons.strokeRoundedSetting07,
                color: Colors.black,
              ),
              onTap: () => Get.to(EditProfileWidget()),
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

Widget buildOrderItem(
  IconData icon,
  String label,
  PaymentController? paymentController,
  String? route,
) {
  final isAwaitingShipment = label == "Awaiting Shipment";

  return Expanded(
    child: GestureDetector(
      onTap: () => route != null ? Get.toNamed(route.toString()) : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: isAwaitingShipment
                ? Obx(
                    () => Badge(
                      isLabelVisible: paymentController!.orderList.isNotEmpty,
                      label: Text(
                        paymentController.orderList.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      child: Icon(icon, size: 25),
                    ),
                  )
                : Icon(icon, size: 25),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    ),
  );
}
