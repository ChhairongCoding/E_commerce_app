class NotifycationModel {
    NotifycationModel({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.time,
         this.image,
    });

    final String? id;
    final String? title;
    final String? subtitle;
    final String? time;
    final String? image;

    factory NotifycationModel.fromJson(Map<String, dynamic> json){ 
        return NotifycationModel(
            id: json["id"],
            title: json["title"],
            subtitle: json["subtitle"],
            time: json["time"],
            image: json["image"],
        );
    }

}
