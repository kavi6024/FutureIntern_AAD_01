import 'package:flutter/material.dart';
import 'package:unit_converter/util/converter.dart';
import 'package:unit_converter/pages/conversion_page.dart'; // Import the conversion page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.5);

  final List<IconData> categoryIcons = [
    Icons.straighten,
    Icons.scale,
    Icons.thermostat,
    Icons.local_drink,
    Icons.speed,
    Icons.square_foot,
  ];

  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select a Category',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Carousel-like horizontal slider with scaling effect
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                double scale = (_currentPage - index).abs().clamp(0.0, 1.0);
                double scaleFactor = 1 - scale * 0.4;

                return Center(
                  child: Transform.scale(
                    scale: scaleFactor,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the ConversionPage with the selected category
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConversionPage(category: categories[index]),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Circle-shaped container with scaling effect
                          Container(
                            width: 100 * scaleFactor,
                            height: 100 * scaleFactor,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent,
                            ),
                            child: Icon(
                              categoryIcons[index],
                              size: 40 * scaleFactor,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 16 * scaleFactor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
