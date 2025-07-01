import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const CustomCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          data['image'],
          width: size.width * 0.43,
          height: size.height * 0.25,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: size.width * 0.43,
          child: Text(
            data['name'],
            style: Theme.of(context).textTheme.titleSmall,
            softWrap: true,
            overflow: TextOverflow.visible,
            maxLines: 2,
          ),
        ),
        Text(
          data['Price'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
