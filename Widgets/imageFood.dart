import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
class HorizontalImageList extends StatefulWidget {
  const HorizontalImageList({super.key});

  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends State<HorizontalImageList> {
  final List<String> imageUrls = [
    'assets/images/meat3.png',
    'assets/images/cheaps1.jpg',
    'assets/images/souce1.png',
    'assets/images/omlet3.png',
    'assets/images/drinks1.png',
  ];

  final List<String> imageTitles = [
    'Beautiful best Meat cooked in 2025',
    'awesome cheaps italian',
    'Delicious meat souce 100% protein',
    'Omlet of 10 eggs in one',
    'Swalow drinks which are cold',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                Image.asset(
                                  imageUrls[index],
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        const Color.fromARGB(169, 0, 0, 0).withOpacity(0.7),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 12,
                            bottom: 40,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              
                              child: Text(
                                imageTitles[index],
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                imageUrls.length,
                                (indicatorIndex) {
                                  return Container(
                                    width: indicatorIndex == index ? 12 : 8,
                                    height: indicatorIndex == index ? 12 : 8,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: indicatorIndex == index
                                          ? AppColors.filter
                                          : Colors.white.withOpacity(0.5),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),);
         
  }
}