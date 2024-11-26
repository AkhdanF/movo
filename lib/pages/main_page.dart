import 'package:flutter/material.dart';
import 'package:movoapp/pages/articles_page.dart';
import 'package:movoapp/pages/category_page.dart';
import 'package:movoapp/pages/home_page.dart';
import 'package:movoapp/pages/profile_page.dart';
import 'package:movoapp/widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Daftar halaman
  final List<Widget> _pages = [
    const HomePage(),
    const CategoryPage(),
    const ArticlesPage(),
    ProfilePage(),
  ];

  // Fungsi untuk berpindah halaman
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
