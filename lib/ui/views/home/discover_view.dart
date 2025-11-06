import 'package:flutter/material.dart';

class DiscoverView extends StatefulWidget {
  final VoidCallback onSkip;
  const DiscoverView({Key? key, required this.onSkip}) : super(key: key);

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "Discover Thousands of Ethiopian Dishes",
      "subtitle":
          "Explore traditional and modern recipes from all over Ethiopia.",
      "image": "assets/food.png"
    },
    {
      "title": "Share Your Own Recipes",
      "subtitle":
          "Upload your favorite dishes and share them with the community.",
      "image": "assets/food.png"
    },
    {
      "title": "Connect With Food Lovers",
      "subtitle": "Get inspired, interact, and enjoy new flavors every day.",
      "image": "assets/food.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: _pages.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final page = _pages[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image for every slide
                  Image.asset(
                    page["image"] ?? 'assets/food.png',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    page["title"] ?? "No Title",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    page["subtitle"] ?? "",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
        // Skip button
        Positioned(
          top: 50,
          right: 25,
          child: TextButton(
            onPressed: widget.onSkip,
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ),
        // Dots indicator
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentIndex == index ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
