import 'package:flutter/material.dart';

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;
  final double rating; // Rating dari instructor
  final int totalRatings; // Total orang yang merating

  const InstructorCard(
    this.imagePath,
    this.name,
    this.specialty,
    this.rating,
    this.totalRatings, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              specialty,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '$rating',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '($totalRatings ratings)',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
