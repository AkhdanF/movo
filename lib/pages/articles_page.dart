import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Articles',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFF4E4D8),
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Articles Screen',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
