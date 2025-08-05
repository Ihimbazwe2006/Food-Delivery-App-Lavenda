class UiElement {
  final String foodName;
  final String location;
  final String imagePath;
  final String description;
  final String kind;
  final String price;

  UiElement({
    required this.foodName,
    required this.location,
    required this.imagePath,
    required this.description,
    required this.kind,
    required this.price,
  });
}
final List<UiElement> food = [
   UiElement(
    foodName: 'Classic Cheeseburger',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/chicken1.png',
    description: 'A juicy, flame-grilled beef patty topped with melted American cheese, crisp lettuce, ripe tomatoes, and tangy pickles, all hugged by a soft, toasted bun. The creamy mayo and ketchup add the perfect balance of richness and sweetness. Simple yet irresistible, this burger is a nostalgic trip to flavor town.',
    kind: 'Cheaps',
    price: '\$ 110',
  ),
  UiElement(
    foodName: 'Golden Fries',
    location: 'Kigali Rwanda LM98',
    imagePath: 'assets/images/barger1.png',
    description: 'Hand-cut potatoes fried to a perfect golden crisp, dusted with sea salt for that addictive crunch. Whether dipped in ketchup, smothered in cheese, or enjoyed plain, these fries are the ideal companion to any burger—hot, salty, and endlessly satisfying with every bite.',
    kind: 'Barger',
    price: '\$ 120',
  ),
  UiElement(
    foodName: 'Bacon Double Smash Burger',
    location: 'Kigali Rwanda Kicukiro 23',
    imagePath: 'assets/images/barger5.png',
    description: 'Two smashed beef patties seared to crispy-edged perfection, layered with smoky bacon, melted cheddar, caramelized onions, and a swipe of smoky BBQ sauce. Every bite delivers a punch of savory, umami goodness that makes this burger a carnivore’s dream come true.',
    kind: 'Barger',
    price: '\$ 160',
  ),
  UiElement(
    foodName: 'Loaded Chili Cheese Fries',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/cheaps1.png',
    description: 'A mountain of crispy fries drowned in spicy beef chili, melted cheese, diced onions, and jalapeños. This messy, indulgent dish is a flavor explosion—creamy, meaty, and slightly fiery—perfect for sharing (or not).',
    kind: 'Barger',
    price: "\$ 120",
  ),
  UiElement(
    foodName: ' Spicy Chicken Burger – Fiery & Flavorful',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/barger6.png',
    description: 'A crispy, buttermilk-marinated chicken breast coated in hot sauce, topped with cool ranch dressing, shredded lettuce, and pickles. The contrast of heat and creaminess makes this burger a bold, mouthwatering experience that keeps you reaching for more',
    kind: 'Barger',
    price: '\$ 190',
  ),
  UiElement(
    foodName: 'Fresh Delicious chicken',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/chicken2.png',
    description: 'Thin-cut sweet potato fries, lightly salted and baked (or fried) to crispy perfection. Their natural sweetness pairs wonderfully with spicy aioli or cinnamon sugar for a unique, slightly healthier alternative to regular fries',
    kind: 'meat',
    price: '\$ 160',
  ),

  UiElement(
    foodName: 'The Ultimate Cheap Eats Combo – Burger, Fries & Drink',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/drinks1.png',
    description: 'A juicy beef patty topped with sautéed mushrooms, melted Swiss cheese, and garlic aioli on a toasted brioche bun. The umami-rich mushrooms and creamy cheese create a sophisticated yet comforting flavor profile that’s hard to resis',
    kind: 'Drinks',
    price: '\$ 50',
  ),
  UiElement(
    foodName: 'Fresh 70 eggs',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/eggs1.png',
    description: 'A thick beef patty stuffed with molten cheddar or pepper jack cheese, oozing out with every bite. Paired with crispy bacon and a toasted bun, this burger is pure cheesy decadence',
    kind: 'Eggs',
    price: '\$ 100',
  ),
  UiElement(
    foodName: 'Fresh Ready eggs',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/eggs2.jpg',
    description: 'Thick-cut onions dipped in seasoned batter and deep-fried until golden and crispy. Served with ranch or spicy mayo, these rings offer a sweet, savory crunch that rivals even the best fries',
    kind: 'Eggs',
    price: '\$ 120',
  ),
  UiElement(
    foodName: 'Full Protein diet',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/meat3.png',
    description: 'Slow-cooked pulled pork smothered in tangy BBQ sauce, topped with creamy coleslaw on a soft bun. The tender meat and crunchy slaw create a perfect balance of textures and flavors',
    kind: 'Meat',
    price: '\$ 190',
  ),
  UiElement(
    foodName: 'Fresh Canadian Omlet',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/omlet3.png',
    description: 'Crispy fries tossed in garlic butter, grated Parmesan, and fresh parsley. These aromatic, cheesy fries are a gourmet twist on a fast-food classic',
    kind: 'Barger',
    price: '\$ 70',
  ),
  UiElement(
    foodName: 'Italian  Souce',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/souce1.png',
    description: 'A hearty patty made from black beans, quinoa, and spices, topped with avocado, sprouts, and chipotle mayo. Packed with protein and flavor, this burger proves meatless can be mouthwatering',
    kind: 'Meat',
    price: '\$ 130',
  ),
  UiElement(
    foodName: 'Yellow Fresh Banana',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/banana1.png',
    description: 'Crispy fries loaded with buffalo chicken bites, blue cheese crumbles, and drizzled with ranch. A fiery, tangy, and creamy dish that’s perfect for game day',
    kind: 'Fruits',
    price: '\$ 40',
  ),
  UiElement(
    foodName: 'Whole banana branch',
    location: 'Kigali Rwanda S60L',
    imagePath: 'assets/images/banana2.png',
    description: 'A beef patty topped with a fried egg, crispy hash browns, and melted cheese on a toasted English muffin. The runny yolk adds a rich, velvety finish to this hearty morning burger',
    kind: 'fruits',
    price: '\$ 110',
  ),
];