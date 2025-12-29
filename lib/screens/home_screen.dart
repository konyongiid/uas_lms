import 'package:flutter/material.dart';
import 'profile/profile_screen.dart';
import 'announcement/announcement_screen.dart';
import 'course_list_screen.dart';

// Konstanta warna
const Color primaryDark = Color(0xFF1A4A7A);
const Color primaryBlue = Color(0xFF4285F4);
const Color mediumGray = Color(0xFF757575);
const Color white = Colors.white;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List halaman untuk navigasi
    final List<Widget> pages = [
      _buildHomeBody(),
      const CourseListScreen(),
      _buildNotificationBody(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      // Perbaikan: AppBar tetap muncul atau menyesuaikan dengan konteks tab
      appBar: _currentIndex == 0 ? _buildAppBar() : null,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryDark,
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: primaryBlue,
      elevation: 0,
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Hallo,', style: TextStyle(color: white, fontSize: 14)),
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
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
          ),
        ),
      ],
    );
  }

  Widget _buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(),
          _buildAnnouncementSection(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Progres Mata Kuliah',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryDark,
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
                // PERBAIKAN: Nama fungsi diubah dari _buildCourseListItem menjadi _buildCourseGridItem
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
                  'PENDIDIKAN KEWARNEGARAAN',
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
                  'Grammar',
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
    );
  }

  Widget _buildAnnouncementSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pengumuman Terakhir',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnnouncementScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Ink(
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
                      'PENGUMUMAN | Workshop Design UI/UX',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '15/01/2026',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationBody() {
    return Column(
      children: [
        // Memberikan SafeArea agar tidak tertutup notch pada beberapa HP
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => setState(() => _currentIndex = 0),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Notifikasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => _buildNotificationItem(),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.assignment_turned_in_outlined, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Anda telah mengirimkan pengajuan tugas untuk Laporan Akhir...',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  '3 Hari 9 Jam Yang Lalu',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi ini dipanggil di GridView
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
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(iconData, color: white, size: 20),
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
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 8, color: mediumGray),
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
                      foregroundColor: primaryDark,
                    ),
                    child: const Text(
                      'Lihat Detail',
                      style: TextStyle(
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
}
