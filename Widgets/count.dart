import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
class ShoppingCartWithBadge extends StatelessWidget {
  final int itemCount;
  
  const ShoppingCartWithBadge({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart,color: AppColors.primary),
        if (itemCount > 0) 
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 15,
                minHeight: 15,
              ),
              child: Text(
                itemCount > 9 ? '9+' : itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

