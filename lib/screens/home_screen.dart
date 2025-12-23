import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personalized Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, John Doe',
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(color: Color(0xFF1F2933)),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF2C7DA0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Mahasiswa',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFB9E3F2),
                    child: Icon(Icons.person, color: Color(0xFF2C7DA0)),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Tugas Yang Akan Datang Section
              Text(
                'Tugas Yang Akan Datang',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Color(0xFF1F2933)),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tugas Matematika Diskrit',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color(0xFF1F2933),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Deadline: 25 Desember 2023, 23:59',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color(0xFFFF0000), // Red for emphasis
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Kerjakan soal nomor 1-10 pada buku halaman 45.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Pengumuman Terakhir Section
              Text(
                'Pengumuman Terakhir',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Color(0xFF1F2933)),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildAnnouncementCard(
                      context,
                      'Jadwal Ujian Akhir Semester',
                      'Ujian akan dimulai pada tanggal 15 Januari 2024.',
                    ),
                    SizedBox(width: 16),
                    _buildAnnouncementCard(
                      context,
                      'Libur Natal',
                      'Kampus libur mulai 24 Desember hingga 2 Januari.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Progres / Kelas Section
              Text(
                'Progres Kelas',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Color(0xFF1F2933)),
              ),
              SizedBox(height: 16),
              _buildProgressCard(context, 'Matematika Diskrit', 0.75),
              SizedBox(height: 16),
              _buildProgressCard(context, 'Pemrograman Mobile', 0.60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
        selectedItemColor: Color(0xFF2C7DA0),
        unselectedItemColor: Color(0xFF6B7280),
      ),
    );
  }

  Widget _buildAnnouncementCard(
    BuildContext context,
    String title,
    String description,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Color(0xFF1F2933)),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Color(0xFF6B7280)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(
    BuildContext context,
    String courseName,
    double progress,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseName,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Color(0xFF1F2933)),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Color(0xFFE5E7EB),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2C7DA0)),
            ),
            SizedBox(height: 8),
            Text(
              '${(progress * 100).toInt()}% selesai',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Color(0xFF6B7280)),
            ),
          ],
        ),
      ),
    );
  }
}
