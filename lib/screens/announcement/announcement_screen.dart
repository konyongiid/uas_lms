import 'package:flutter/material.dart';
import 'announcement_detail_screen.dart'; // Import file detail yang baru dibuat

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih sesuai gambar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Kembali ke halaman Home
        ),
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // --- ITEM 1: Workshop UI/UX (Dibuat bisa diklik) ---
            GestureDetector(
              onTap: () {
                // Berpindah ke halaman detail pengumuman
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnnouncementDetailScreen(),
                  ),
                );
              },
              child: _buildSimpleItem(
                'Pengumumam Workshop Design UIUX 2025/2026',
                'Rabu, 2 Juni 2026, 10:45',
              ),
            ),
            const Divider(height: 1, thickness: 0.5, indent: 60),

            // --- ITEM 2: Libur Musim Panas ---
            _buildSimpleItem(
              'Libur Musim Panas',
              'Senin, 1 Januari 2026, 10:25',
            ),
            const Divider(height: 1, thickness: 0.5, indent: 60),

            // --- ITEM 3: Pra UAS ---
            _buildSimpleItem(
              'Pra UAS Semeter Genap 2026/2027',
              'Minggu, 11 Januari 2026, 07:50',
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper untuk membuat item dengan Ikon Terompet (Megaphone)
  Widget _buildSimpleItem(String title, String subtitle) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon Terompet (Megaphone) sesuai permintaan
          const Icon(Icons.campaign, size: 30, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}