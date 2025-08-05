import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
class ImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double borderRadius;
  final double width;
  final double imageHeight;

  const ImageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.borderRadius = 12.0,
    this.width = double.infinity,
    this.imageHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        imagePath,
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: imageHeight,
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, size: 40),
        ),
      ),
    ),
    // Gradient overlay at the bottom
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80, // Adjust this to control gradient height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 10,
      left: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 241, 240, 240),
                ),
              ),
              const SizedBox(height: 3),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 173, 173, 173),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(width: 23),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(155, 151, 151, 151),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart, color: AppColors.background),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    )
  ],
)
    );
  }
}
