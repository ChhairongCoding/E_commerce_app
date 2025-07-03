import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCategoryCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title ;
  const CustomCategoryCardWidget({super.key, required this.imageUrl,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Color(0xFF424D57)),
            Positioned.fill(child: CustomPaint(painter: CirclePainter())),

            Positioned(
              top: 20,
              left: 20,
              child: Text(
               title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.grey.shade200),
              ),
            ),

            Positioned(
              child: CachedNetworkImage(
                imageUrl: imageUrl, 
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80;

    canvas.drawCircle(center, 150, paint);

    paint.strokeWidth = 40;
    canvas.drawCircle(center, 80, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
