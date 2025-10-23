import 'package:flutter/material.dart';
import 'welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final splashData = [
      {
        'image': 'assets/images/splash1.png',
        'title': 'Premium Food\nAt Your Doorstep',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy',
        'bgColor': const Color(0xFFE8FFD9),
      },
      {
        'image': 'assets/images/splash2.jpg',
        'title': 'Buy Premium\nQuality Fruits',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy',
        'bgColor': const Color(0xFFFFF5D6),
      },
      {
        'image': 'assets/images/splash3.jpg',
        'title': 'Buy Quality\nDairy Products',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy',
        'bgColor': const Color(0xFFDFF7FF),
      },
      {
        'image': 'assets/images/splash4.jpg',
        'title': 'Get Discounts\nOn All Products',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumy',
        'bgColor': const Color(0xFFFFE6E6),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  final item = splashData[index];
                  return SplashContent(
                    image: item['image'] as String,
                    title: item['title'] as String,
                    subtitle: item['subtitle'] as String,
                    buttonText:
                        index == splashData.length - 1 ? 'Get Started' : 'Next',
                    bgColor: item['bgColor'] as Color,
                    onPressed: () {
                      if (index == splashData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  );
                },
              ),
            ),

            // 🔘 Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 10 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.green
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String buttonText;
  final Color bgColor;
  final VoidCallback onPressed;

  const SplashContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🟢 Bagian background atas
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            color: bgColor,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover, // 🟢 full lebar kiri-kanan
            ),
          ),
        ),
        
        // ⚪ Bagian bawah putih melengkung
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.43,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Tombol hijau solid
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
