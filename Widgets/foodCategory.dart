import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../SeeAllScreen.dart';
import '../../../models/food_item.dart';
import '../selectedScreen.dart';
class FoodCategoriesSection extends StatefulWidget {
  const FoodCategoriesSection({super.key});

  @override
  State<FoodCategoriesSection> createState() => _FoodCategoriesSectionState();
}

class _FoodCategoriesSectionState extends State<FoodCategoriesSection> {
  final List<String> categories = [
    'All',
    'Chicken',
    'Pizza',
    'Soup',
    'Fish',
    'Fruit',
  ];

  final Map<String, List<Map<String, dynamic>>> subItems = {
    'All': [
      {'name': 'Banana', 'price': '\$5.99', 'image': 'assets/images/banana1.png'},
      {'name': 'barger', 'price': '\$7.99', 'image': 'assets/images/barger1.png'},
      {'name': 'banana', 'price': '\$4.99', 'image': 'assets/images/banana2.png'},
      {'name': 'barger italy', 'price': '\$12.99', 'image': 'assets/images/cheaps1.png'},
      {'name': 'barger Chinese', 'price': '\$9.99', 'image': 'assets/images/barger6.png'},
      {'name': 'Cheaps salad', 'price': '\$3.99', 'image': 'assets/images/cheaps1.jpg'},
    ],
    'Chicken': [
      {'name': 'drinks', 'price': '\$8.99', 'image': 'assets/images/drinks1.png'},
      {'name': 'Grilled Chicken', 'price': '\$9.99', 'image': 'assets/images/meat3.png'},
      {'name': 'Chicken Wings', 'price': '\$7.99', 'image': 'assets/images/omlet3.png'},
      {'name': 'Chicken Nuggets', 'price': '\$5.99', 'image': 'assets/images/eggs1.png'},
      {'name': 'Chicken Sandwich', 'price': '\$6.99', 'image': 'assets/images/eggs2.jpg'},
      {'name': 'Chicken Salad', 'price': '\$7.99', 'image': 'assets/images/souce1.png'},
    ],
    'Pizza': [
      {'name': 'Margherita', 'price': '\$10.99', 'image': 'assets/images/banana1.png'},
      {'name': 'Pepperoni', 'price': '\$12.99', 'image': 'assets/images/barger1.png'},
      {'name': 'BBQ Chicken', 'price': '\$13.99', 'image': 'assets/images/banana2.png'},
      {'name': 'Veggie', 'price': '\$11.99', 'image': 'assets/images/cheaps1.png'},
      {'name': 'Hawaiian', 'price': '\$12.99', 'image': 'assets/images/barger6.png'},
      {'name': 'Meat Lovers', 'price': '\$14.99', 'image': 'assets/images/souce1.png'},
    ],
    'Soup': [
      {'name': 'Tomato Soup', 'price': '\$4.99', 'image': 'assets/images/drinks1.png'},
      {'name': 'Chicken Soup', 'price': '\$5.99', 'image': 'assets/images/meat3.png'},
      {'name': 'Vegetable Soup', 'price': '\$4.99', 'image': 'assets/images/eggs2.png'},
      {'name': 'Mushroom Soup', 'price': '\$5.99', 'image': 'assets/images/omlet3.png'},
      {'name': 'Minestrone', 'price': '\$6.99', 'image': 'assets/images/cheaps1.png'},
      {'name': 'Lentil Soup', 'price': '\$5.99', 'image': 'assets/images/banana1.png'},
    ],
    'Fish': [
      {'name': 'Tomato Soup', 'price': '\$4.99', 'image': 'assets/images/drinks1.png'},
      {'name': 'Chicken Soup', 'price': '\$5.99', 'image': 'assets/images/meat3.png'},
      {'name': 'Vegetable Soup', 'price': '\$4.99', 'image': 'assets/images/eggs2.png'},
      {'name': 'Mushroom Soup', 'price': '\$5.99', 'image': 'assets/images/omlet3.png'},
      {'name': 'Minestrone', 'price': '\$6.99', 'image': 'assets/images/cheaps1.png'},
      {'name': 'Lentil Soup', 'price': '\$5.99', 'image': 'assets/images/banana1.png'},
    ],
    'Fruit': [
      {'name': 'Margherita', 'price': '\$10.99', 'image': 'assets/images/banana1.png'},
      {'name': 'Pepperoni', 'price': '\$12.99', 'image': 'assets/images/barger1.png'},
      {'name': 'BBQ Chicken', 'price': '\$13.99', 'image': 'assets/images/banana2.png'},
      {'name': 'Veggie', 'price': '\$11.99', 'image': 'assets/images/cheaps1.png'},
      {'name': 'Hawaiian', 'price': '\$12.99', 'image': 'assets/images/barger6.png'},
      {'name': 'Meat Lovers', 'price': '\$14.99', 'image': 'assets/images/souce1.png'},
    ],
  };

  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    final double itemWidth = 100.0;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double scrollOffset = (itemWidth * index) - (screenWidth / 2) + (itemWidth / 2);
    
    _scrollController.animateTo(
      scrollOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAllScreen(
                      category: categories[selectedIndex],
                      foodItems: subItems[categories[selectedIndex]]!
                          .map((item) => FoodItem(
                                id: UniqueKey().toString(),
                                name: item['name'],
                                description: 'Delicious ${item['name']}',
                                price: double.parse(
                                    item['price'].replaceAll('\$', '').trim()),
                                imagePath: item['image'],
                                category: categories[selectedIndex],
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.filter,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.filter),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 60,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                _scrollToIndex(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? AppColors.textColor
                            : AppColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (selectedIndex == index)
                      Container(
                        height: 2,
                        width: 20,
                        color: AppColors.filter,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: subItems[categories[selectedIndex]]!.length,
          itemBuilder: (context, index) {
            final item = subItems[categories[selectedIndex]]![index];
            final foodItem = FoodItem(
              id: UniqueKey().toString(),
              name: item['name'],
              description: 'Delicious ${item['name']}',
              price: double.parse(item['price'].replaceAll('\$', '').trim()),
              imagePath: item['image'],
              category: categories[selectedIndex],
            );
            
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(foodItem: foodItem),
                  ),
                );
              },
              child: SizedBox(
                width: 220,
                height: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2),
                    Container(
                      width: 200,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(209, 0, 0, 0),
                            spreadRadius: 0.7,
                            blurRadius: 0.4,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          item['price'],
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
          },
        ),
      ),
    ],
  );
}
}