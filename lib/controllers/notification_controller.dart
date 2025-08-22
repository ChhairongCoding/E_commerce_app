import 'package:e_commerce_app/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotifycationModel> notificationsItems = [
    NotifycationModel(
      id: "1",
      title: "Good morning! Get 20% Voucher",
      subtitle: "Summer sale up to 20% off. Limited voucher. Get now!😜",
      time: "2days",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvq0s6SlSp3BRdXMPaOFSEL1IYdJW02klXA&s",
    ),
    NotifycationModel(
      id: "2",
      title: "Special offer just for you",
      subtitle: "New Autumn Collection 30% off",
      time: "7days",

    ),
    // New notifications
    NotifycationModel(
      id: "3",
      title: "Flash Deal Alert ⚡",
      subtitle: "Only 3 hours left for exclusive discounts. Don’t miss out!",
      time: "5h",
      // image:
      //     "https://img.freepik.com/free-vector/flash-sale-banner-template_1017-31244.jpg",
    ),
    NotifycationModel(
      id: "4",
      title: "Your Order is on the Way 🚚",
      subtitle: "Track your package now and get real-time updates.",
      time: "1day",
      image:
          "https://img.freepik.com/free-vector/delivery-service-concept_23-2148490510.jpg",
    ),
    NotifycationModel(
      id: "5",
      title: "Weekend Special 🎉",
      subtitle: "Extra 15% off on electronics this weekend only!",
      time: "3days",
      image:
          "https://img.freepik.com/free-vector/weekend-sale-discount-banner_23-2148588077.jpg",
    ),
  ];
}
