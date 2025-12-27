import 'package:flutter/material.dart';

// Menggunakan konstanta warna yang sama dengan home_screen.dart
const Color primaryDark = Color(0xFF1A4A7A);
const Color primaryBlue = Color(0xFF4285F4);
const Color mediumGray = Color(0xFF757575);
const Color white = Colors.white;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Mata Kuliah Saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCourseListItem('UIUX', 'DESIGN ANTARMUKA', 0.8, Colors.orange, Icons.palette),
          _buildCourseListItem('DESIGN', 'COLOR PALLET', 0.7, Colors.cyan, Icons.grid_view_rounded),
          _buildCourseListItem('Kewarganegraan', 'PENDIDIKAN KEWARNEGARAAN', 0.5, Colors.red, Icons.account_balance),
          _buildCourseListItem('Sistem Operasi', 'Belajar Membaca', 0.2, Colors.blue, Icons.storage),
          _buildCourseListItem('Bahasa Inggris', 'Grammar', 0.5, Colors.blueGrey, Icons.settings_input_component),
          _buildCourseListItem('Mobile Apps', 'dart brain', 0.3, Colors.teal, Icons.business_center),
        ],
      ),
    );
  }

  Widget _buildCourseListItem(String code, String title, double progress, Color iconBgColor, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // Ikon Mata Kuliah
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(iconData, color: white, size: 28),
          ),
          const SizedBox(width: 16),
          // Info Mata Kuliah & Progres
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: mediumGray),
                ),
                const SizedBox(height: 10),
                // Progress Bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(primaryBlue),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}