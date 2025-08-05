import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'dart:async';
class AutoScrollBanner extends StatefulWidget {
  const AutoScrollBanner({super.key});

  @override
  _AutoScrollBannerState createState() => _AutoScrollBannerState();
}

class _AutoScrollBannerState extends State<AutoScrollBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  
  final List<String> banners = [
    'assets/images/bannerfinish1.png',
    'assets/images/bannerfinish2.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _pageController.addListener(_updatePage);
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 700),
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
              itemCount: banners.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(banners[index]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(41, 0, 0, 0),
                        blurRadius: 8,
                        offset: Offset(1, 4),)
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(banners.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _currentPage == index ? 13 : 5,
                height: 5,
                margin: EdgeInsets.symmetric(horizontal: 4),
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