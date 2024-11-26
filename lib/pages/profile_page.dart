import 'package:flutter/material.dart';
import 'package:movoapp/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171616),
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage(
                      'lib/assets/images/profile_avatar.png'), // Ganti dengan path gambar avatar Anda
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFFFF6F10), // Warna aksen oranye
                  width: 4.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Nama dan Deskripsi
            const Text(
              'John Doe', // Ganti dengan nama pengguna
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Fitness Enthusiast',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Statistik Pengguna
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Classes', '12'),
                _buildStatCard('Workouts', '8'),
                _buildStatCard('Achievements', '5'),
              ],
            ),
            const SizedBox(height: 24),
            // Subscription Type
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: const Color(0xFFFF6F10),
                  width: 1.5,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscription Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Free Member',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // List Settings
            _buildSettingsOption(
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                // Navigasi ke halaman edit profil
              },
            ),
            _buildSettingsOption(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // Navigasi ke halaman ubah password
              },
            ),
            _buildSettingsOption(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Navigasi ke pengaturan notifikasi
              },
            ),
            _buildSettingsOption(
              icon: Icons.language,
              title: 'Language Preferences',
              onTap: () {
                // Navigasi ke pengaturan bahasa
              },
            ),
            _buildSettingsOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {
                // Navigasi ke halaman bantuan
              },
            ),
            _buildSettingsOption(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () async {
                await AuthService().signout(context: context);
              },
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF171616),
    );
  }

  // Widget untuk menampilkan kartu statistik
  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Widget untuk menampilkan opsi pengaturan
  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
