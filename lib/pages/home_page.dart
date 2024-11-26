import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movoapp/widgets/carousel_item.dart';
import 'package:movoapp/widgets/class_card.dart';
import 'package:movoapp/widgets/instructor_card.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('EEEE, d MMMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF171616).withOpacity(0.9),
                  const Color(0xFF2C2C2E)
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome, MOVO!',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            getCurrentDate(),
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              items: const [
                CarouselItem(
                  color: Color(0xFFFF6F10), // Vibrant orange
                  title: 'Get Ready for New Era',
                  subtitle:
                      'That strategy doesn\'t need to be so rigid that it leaves no room for fun',
                ),
                CarouselItem(
                  color: Color(0xFFE63946), // Vibrant red
                  title: 'Challenge Yourself',
                  subtitle: 'Discover your hidden potential and aim higher.',
                ),
                CarouselItem(
                  color: Color(0xFF2A9D8F), // Teal green
                  title: 'Stay Consistent',
                  subtitle:
                      'Build habits that lead to success one step at a time.',
                ),
              ],
              options: CarouselOptions(
                height: 190,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                aspectRatio: 16 / 9,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Popular Classes'),
            const SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ClassCard('Flow Yoga', 'Meera Asya',
                      'lib/assets/images/classes/flowyoga.png'),
                  ClassCard('Aerial Pilates', 'Elza Herry',
                      'lib/assets/images/classes/aerialpilates.png'),
                  ClassCard('Zumba', 'Wafa Celia',
                      'lib/assets/images/classes/zumba.jpg'),
                  ClassCard('HIIT Workout', 'John Doe',
                      'lib/assets/images/classes/hiit.jpg'),
                  ClassCard('Cycling', 'Sarah Lee',
                      'lib/assets/images/classes/cycling.png'),
                  ClassCard('Boxing', 'Mike Tyson',
                      'lib/assets/images/classes/boxing.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Popular Instructors'),
            const SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  InstructorCard(
                    'lib/assets/images/instructor1.png',
                    'Sarah Johnson',
                    'Yoga Expert',
                    4.8,
                    120,
                  ),
                  InstructorCard(
                    'lib/assets/images/instructor2.png',
                    'Michael Lee',
                    'Pilates Specialist',
                    4.6,
                    85,
                  ),
                  InstructorCard(
                    'lib/assets/images/instructor3.png',
                    'Sophia Clark',
                    'Zumba Coach',
                    4.9,
                    150,
                  ),
                  InstructorCard(
                    'lib/assets/images/instructor4.png',
                    'James Brown',
                    'Strength Trainer',
                    4.7,
                    110,
                  ),
                  InstructorCard(
                    'lib/assets/images/instructor5.png',
                    'Emma White',
                    'Yoga Master',
                    4.9,
                    200,
                  ),
                  InstructorCard(
                    'lib/assets/images/instructor6.png',
                    'Oliver Stone',
                    'Fitness Coach',
                    4.5,
                    75,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Custom section header widget
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
