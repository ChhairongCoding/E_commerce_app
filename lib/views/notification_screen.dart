import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.grey[100], body: _buildBody()));
  }

  Widget _buildBody() {
    final NotificationController notificationController =
        Get.find<NotificationController>();
    final listNotification = notificationController.notificationsItems;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.grey[100],
          elevation: 0,
          title: Text("Notification", style: TextStyle(color: Colors.black)),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = listNotification[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildNotificationCard(
                  context,
                  title: item.title.toString(),
                  subtitle: item.subtitle.toString(),
                  imageUrl: item.image,
                ),
              );
            }, childCount: listNotification.length),
          ),
        ),
      ],
    );
  }

  _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    String? imageUrl,
  }) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
