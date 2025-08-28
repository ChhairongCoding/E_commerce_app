import 'package:e_commerce_app/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotifycationModel> notificationsItems = [
     NotifycationModel(
      id: "4",
      title: "Always on the Offense 🚨",
      subtitle: "Scary Good Pack",
      time: "1day",
      image: "https://res.cloudinary.com/dtc2q8arn/image/upload/f_webp,q_90,w_500/v1752507897/banners%20for%20july/em-za-MENS-PROMO-BLOCK_j9vhur.jpg",
    ),
    NotifycationModel(
      id: "5",
      title: "Special offer just for you 🎉",
      subtitle: "New Autumn Collection 30% off",
      time: "3days",
      image:
          "https://res.cloudinary.com/dtc2q8arn/image/upload/f_webp,q_90,w_1000/v1753113230/CALLING%20OUT%20ALL%20FOOTBALL%20FANS/em-za-football-tc1-d_dlayod.jpg",
    ),
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
      title: "Your Order is on the Way 🚚",
      subtitle: "Track your package now and get real-time updates.",

      time: "5h",
      // image:
      //     "",
    ),
  ];
}
