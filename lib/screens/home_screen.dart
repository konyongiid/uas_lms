import 'package:flutter/material.dart';
import 'profile/profile_screen.dart'; 
import 'announcement/announcement_screen.dart'; // Pastikan file ini sudah ada di folder tersebut
import 'course_list_screen.dart'; // File baru untuk list mata kuliah ke bawah

// Konstanta warna sesuai tema aplikasi Anda
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
    // List halaman untuk navigasi BottomNavigationBar
    final List<Widget> pages = [
      _buildHomeBody(),         // Index 0: Dashboard Utama
      const CourseListScreen(), // Index 1: List Mata Kuliah (List ke bawah)
      _buildNotificationBody(), // Index 2: Notifikasi (Berdasarkan gambar agfa.png)
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      // AppBar hanya tampil di Dashboard Utama
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
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Mata Kuliah'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
        ],
      ),
    );
  }

  // --- 1. WIDGET APPBAR HOME ---
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: primaryBlue,
      elevation: 0,
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Hallo,', style: TextStyle(color: white, fontSize: 14)),
          Text('MOH. QOIDUL GHURRI', style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: white.withOpacity(0.5)),
                ),
                child: Row(
                  children: const [
                    Text('MAHASISWA', style: TextStyle(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    CircleAvatar(radius: 12, backgroundColor: white, child: Icon(Icons.person, size: 16, color: primaryBlue)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- 2. WIDGET BODY HOME (DASHBOARD) ---
  Widget _buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(),
          _buildAnnouncementSection(), 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text('Progres Mata Kuliah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryDark)),
          ),
          // Grid tampilan ringkas di halaman depan
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
                _buildCourseGridItem('UIUX', 'DESIGN ANTARMUKA', 0.8, Colors.orange, Icons.palette),
                _buildCourseGridItem('DESIGN', 'COLOR PALLET', 0.7, Colors.cyan, Icons.grid_view_rounded),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- 3. WIDGET BODY NOTIFIKASI (SESUAI GAMBAR agfa.png) ---
  Widget _buildNotificationBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => setState(() => _currentIndex = 0)),
              const Expanded(child: Center(child: Text('Notifikasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))),
              const SizedBox(width: 48),
            ],
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
                const Text('Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text('3 Hari 9 Jam Yang Lalu', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. SECTION PENGUMUMAN (NAVIGASI KE kjsfs.png) ---
  Widget _buildAnnouncementSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Pengumuman Terakhir', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryDark)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnnouncementScreen()));
                },
                child: const Text('Lihat Semua', style: TextStyle(color: primaryBlue, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 100, width: double.infinity,
            decoration: BoxDecoration(color: primaryDark, borderRadius: BorderRadius.circular(16), image: const DecorationImage(image: NetworkImage('https://via.placeholder.com/400x120'), fit: BoxFit.cover, opacity: 0.3)),
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: const [Text('PENGUMUMAN | Workshop Design UI/UX', style: TextStyle(color: white, fontWeight: FontWeight.bold)), Text('15/01/2026', style: TextStyle(color: Colors.white70, fontSize: 12))]),
          ),
        ],
      ),
    );
  }

  // --- HELPER UNTUK GRID DI HALAMAN DEPAN ---
  Widget _buildCourseGridItem(String code, String title, double progress, Color iconBgColor, IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 35, height: 35, decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(8)), child: Icon(iconData, color: white, size: 20)),
          const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(code, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)), Text(title, style: const TextStyle(fontSize: 8, color: mediumGray), overflow: TextOverflow.ellipsis)]))
        ]),
        const Spacer(),
        LinearProgressIndicator(value: progress, backgroundColor: Colors.grey[200], valueColor: const AlwaysStoppedAnimation<Color>(primaryBlue), minHeight: 4),
        const SizedBox(height: 4),
        Align(alignment: Alignment.centerRight, child: Text('${(progress * 100).toInt()}% Selesai', style: const TextStyle(fontSize: 9, color: primaryBlue, fontWeight: FontWeight.bold))),
      ]),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      margin: const EdgeInsets.all(16), padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: primaryDark, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Tugas yang Akan Datang', style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Design Antarmuka', style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 14)),
            const Text('Tugas 01: UI Android Mobile App', style: TextStyle(color: Colors.white70, fontSize: 12)),
            const Text('Deadline: 30 Des 2025', style: TextStyle(color: Colors.white70, fontSize: 12)),
            Align(alignment: Alignment.bottomRight, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: white, foregroundColor: primaryDark), child: const Text('Lihat Detail', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))))
          ]),
        ),
      ]),
    );
  }
}