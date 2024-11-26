import 'package:flutter/material.dart';
import 'package:movoapp/pages/auth_pages/signup_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "MOVO",
      "subtitle": "Get Moving, Get MOVO!",
      "description":
          "Welcome to MOVO, your ultimate fitness companion. We're here to revolutionize your wellness journey with personalized workout plans and expert guidance.",
      "icon": "🏃"
    },
    {
      "title": "Discover",
      "subtitle": "Explore new possibilities!",
      "description":
          "Browse through hundreds of workout routines, nutrition plans, and wellness tips. Find what works best for you and your lifestyle.",
      "icon": "🔍"
    },
    {
      "title": "Connect",
      "subtitle": "Find your community here.",
      "description":
          "Join a thriving community of fitness enthusiasts. Share your progress, get motivated, and inspire others on their fitness journey.",
      "icon": "🤝"
    },
    {
      "title": "Achieve",
      "subtitle": "Make your goals a reality!",
      "description":
          "Set meaningful goals, track your progress, and celebrate your victories. With MOVO, success is just a workout away.",
      "icon": "🎯"
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF6F10),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Tombol Get Started di pojok kanan atas (hanya jika bukan halaman terakhir)
              if (_currentPage < _pages.length - 1)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFFF6F10),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFFFF6F10),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        elevation: 4,
                      ),
                      child: const Text("Get Started"),
                    ),
                  ),
                ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Logo container with animated border
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFF6F10).withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  _pages[index]["icon"]!,
                                  style: const TextStyle(
                                    fontSize: 60,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            // Title with enhanced styling
                            Text(
                              _pages[index]["title"]!,
                              style: const TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Subtitle with enhanced styling
                            Text(
                              _pages[index]["subtitle"]!,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            // New description section
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                _pages[index]["description"]!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.9),
                                    height: 1.5,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Enhanced page indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Enhanced button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: _currentPage == _pages.length - 1
                        ? Colors.white
                        : const Color(0xFFFF6F10), // Teks putih jika halaman terakhir
                    backgroundColor: _currentPage == _pages.length - 1
                        ? const Color(0xFFFF6F10)
                        : Colors.black, // Oranye penuh jika halaman terakhir
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: const Color(0xFFFF6F10),
                        width: _currentPage == _pages.length - 1 ? 0 : 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 4,
                  ),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      _currentPage < _pages.length - 1 ? "Next" : "Get Started",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
