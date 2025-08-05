import 'package:flutter/material.dart';

class Categories {
  final Key key;
  final String imagePath;
  final String name;
 
  Categories({
    Key? key, 
    required this.imagePath,
    required this.name,
  }) : key = key ?? ValueKey(imagePath); 
}

final List<Categories> kind = [
  Categories(
      imagePath: 'assets/images/barger1.png',
      name: 'Chicken'
  ),
  Categories(
      imagePath: 'assets/images/barger5.png',
      name: 'Omlet'
  ),
  Categories(
      imagePath: 'assets/images/barger6.png',
      name: 'Pizza'
  ),
  Categories(
      imagePath: 'assets/images/omlet3.png',
      name: 'barger'
  ),
  Categories(
     imagePath: 'assets/images/cheaps1.png',
     name: 'cheaps'
  ),
  Categories(
     imagePath: 'assets/images/barger1.png',
     name: 'cheaps'
  ),
  Categories(
     imagePath: 'assets/images/souce1.png',
     name: 'cheaps'
  ),
];