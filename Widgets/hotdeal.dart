import 'package:flutter/material.dart';
import '../../../list/foods.dart';
import '../../../constants/colors.dart';
import '../../../models/food_item.dart';

class HotDeals extends StatelessWidget {
  final Function(FoodItem) onItemTap;
  
  const HotDeals({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: food.map((item) {
              return _Deals(
                item.imagePath,
                item.foodName,
                item.price,
                context,
                onItemTap,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _Deals(
    String image,
    String name,
    String money,
    BuildContext context,
    Function(FoodItem) onItemTap,
  ) {
    final foodItem = FoodItem(
      id: UniqueKey().toString(),
      name: name,
      description: 'Delicious $name with special sauce',
      price: double.parse(money.replaceAll('\$', '').trim()),
      imagePath: image,
      category: 'Popular',
    );

    return GestureDetector(
      onTap: () => onItemTap(foodItem),
      child: SizedBox(
        width: 220,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(200, 0, 0, 0),
                    spreadRadius: 1.4,
                    blurRadius: 1,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  money,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.filter,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}