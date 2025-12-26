import 'package:flutter/material.dart';

// Konstanta warna berdasarkan desain terbaru
const Color primaryDark = Color(0xFF1A4A7A); // Biru Tua untuk Navigasi & Footer
const Color primaryBlue = Color(0xFF4285F4); // Biru Terang untuk Aksen Progress
const Color mediumGray = Color(0xFF757575);
const Color white = Colors.white;

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      // --- HEADER (APPBAR) SESUAI GAMBAR BARU ---
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hallo,',
              style: TextStyle(
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'MOH. QOIDUL GHURRI',
              style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: white.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'MAHASISWA',
                      style: TextStyle(
                        color: white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: white,
                      child: Icon(Icons.person, size: 16, color: primaryBlue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            _buildAnnouncementSection(),

            // --- SECTION PROGRES MATA KULIAH (GRID 6 ITEM) ---
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Text(
                'Progres Mata Kuliah', // Penulisan sesuai gambar referensi
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(26, 74, 122, 1),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildCourseGridItem(
                    'UIUX',
                    'DESIGN ANTARMUKA',
                    0.8,
                    Colors.orange,
                    Icons.palette,
                  ),
                  _buildCourseGridItem(
                    'DESIGN',
                    'COLOR PALLET',
                    0.7,
                    Colors.cyan,
                    Icons.grid_view_rounded,
                  ),
                  _buildCourseGridItem(
                    'Kewarganegraan',
                    'PENDIDIKAN KEWARENGNAINAN',
                    0.5,
                    Colors.red,
                    Icons.account_balance,
                  ),
                  _buildCourseGridItem(
                    'Sistem Operasi',
                    'Belajar Membaca',
                    0.2,
                    Colors.blue,
                    Icons.storage,
                  ),
                  _buildCourseGridItem(
                    'Bahasa Inggris',
                    'Grammer',
                    0.5,
                    Colors.blueGrey,
                    Icons.settings_input_component,
                  ),
                  _buildCourseGridItem(
                    'Mobile Apps',
                    'dart brain',
                    0.3,
                    Colors.teal,
                    Icons.business_center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            primaryBlue, // Menggunakan merah agar matching dengan header
        selectedItemColor: white,
        unselectedItemColor: white.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Mata Kuliah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }

  // WIDGET CARD MATA KULIAH
  Widget _buildCourseGridItem(
    String code,
    String title,
    double progress,
    Color iconBgColor,
    IconData iconData,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(iconData, color: white, size: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 8, color: mediumGray),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(primaryBlue),
            minHeight: 4,
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${(progress * 100).toInt()}% Selesai',
              style: const TextStyle(
                fontSize: 9,
                color: primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tugas yang Akan Datang',
            style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Design Antarmuka',
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Text(
                  'Tugas 01: UI Android Mobile App',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const Text(
                  'Deadline: 30 Des 2025',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      minimumSize: const Size(80, 30),
                    ),
                    child: const Text(
                      'Lihat Detail',
                      style: TextStyle(
                        color: primaryDark,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Pengumuman Terakhir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryDark,
                ),
              ),
              Text(
                'Lihat Semua',
                style: TextStyle(color: primaryBlue, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/400x120'),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'PENGUMUMAN | Workshop Desin UI/UX',
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '15/01/2026',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
