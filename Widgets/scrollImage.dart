import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'dart:async';

class AutoScrollBanner extends StatefulWidget {
  const AutoScrollBanner({super.key});

  @override
  _AutoScrollBannerState createState() => _AutoScrollBannerState();
}

class _AutoScrollBannerState extends State<AutoScrollBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  Timer? _timer;
  
  final List<Widget> bannerCards = [
    ImageCard(
      imagePath: 'assets/images/category1.jpg',
      title: 'Summer Collection',
      description: 'Discover our new summer\ncollection with fresh styles',
      borderRadius: 16.0,
      width: 300,
    ),
    ImageCard(
      imagePath: 'assets/images/cheaps1.jpg',
      title: 'Winter Specials',
      description: 'Warm up with our winter\nspecial offers and discounts',
      borderRadius: 16.0,
      width: 300,
    ),
    ImageCard(
      imagePath: 'assets/images/souce1.png',
      title: 'Spring Arrivals',
      description: 'Fresh new arrivals for\nthe spring season',
      borderRadius: 16.0,
      width: 300,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _pageController.addListener(_updatePage);
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < bannerCards.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  void _updatePage() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.removeListener(_updatePage);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, 
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: bannerCards.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                    }
                    return Center(
                      child: SizedBox(
                        height: Curves.easeOut.transform(value) * 220,
                        width: Curves.easeOut.transform(value) * 300,
                        child: child,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: bannerCards[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(bannerCards.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 13 : 5,
                height: 5,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentPage == index 
                      ? AppColors.textColor
                      : Colors.grey.withOpacity(0.5),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
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
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 241, 240, 240),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 173, 173, 173),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(width: 47),
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
      ),
    );
  }
}