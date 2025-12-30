import 'package:flutter/material.dart';
// Import file sesuai dengan struktur folder Anda
import 'course_quis.dart/detail_materi_page2.dart';
import 'course_quis.dart/materi_detail_sheet.dart';

const Color primaryRed = Color(0xFF1A4A7A);
const Color secondaryBlue = Color(0xFF5AA9E6);
const Color backgroundGray = Color(0xFFF0F0F0);
const Color white = Colors.white;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundGray,
        body: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 0,
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(color: primaryRed),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Text(
                          'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(text: "Materi"),
                        Tab(text: "Tugas Dan Kuis"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Konten Tab View
            Expanded(
              child: TabBarView(
                children: [
                  // --- TAB 1: MATERI ---
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // KARTU 1: Membuka MateriDetailSheet
                      _buildMeetingCard(
                        'Pertemuan 1',
                        '01 - Pengantar User Interface Design',
                        '3 URLs, 2 Files, 2 Interactive Content',
                        false,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const MateriDetailSheet(
                              title: '01 - Pengantar User Interface Design',
                            ),
                          );
                        },
                      ),

                      // KARTU 2: Membuka DetailMateriPage2
                      _buildMeetingCard(
                        'Pertemuan 2',
                        '02 - Konsep User Interface Design',
                        '2 URLs, 1 File',
                        false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMateriPage(),
                            ),
                          );
                        },
                      ),

                      // Kartu lainnya tetap tampil di dalam ListView yang sama
                      _buildMeetingCard(
                        'Pertemuan 3',
                        '03 - Interaksi pada UI',
                        '3 URLs, 2 Files',
                        true,
                      ),
                      _buildMeetingCard(
                        'Pertemuan 4',
                        '04 - Ethnographic Observation',
                        '3 URLs, 2 Files',
                        true,
                      ),
                      _buildMeetingCard(
                        'Pertemuan 5',
                        '05 - UID Testing',
                        '3 URLs, 2 Files',
                        true,
                      ),
                      _buildMeetingCard(
                        'Pertemuan 6',
                        '06 - Assessment 1',
                        '3 URLs, 2 Files',
                        true,
                      ),
                    ],
                  ),

                  // --- TAB 2: TUGAS DAN KUIS ---
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildAssignmentCard(
                        'Quiz',
                        'Quiz Review D1',
                        '10 Feb 2026',
                        Icons.quiz_outlined,
                        true,
                      ),
                      _buildAssignmentCard(
                        'Tugas',
                        'Tugas 01 - UID Android',
                        '26 Feb 2026',
                        Icons.edit_note,
                        false,
                      ),
                      _buildAssignmentCard(
                        'Pertemuan 3',
                        'Kuis - Assessment 2',
                        '28 Feb 2026',
                        Icons.quiz_outlined,
                        true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget kartu Materi (DITAMBAHKAN GestureDetector & onTap)
  Widget _buildMeetingCard(
    String label,
    String title,
    String subtitle,
    bool isCompleted, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: secondaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? Colors.green : Colors.grey[300],
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              subtitle,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  // Widget kartu Tugas
  Widget _buildAssignmentCard(
    String tag,
    String title,
    String deadline,
    IconData icon,
    bool isDone,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: secondaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(color: white, fontSize: 10),
                ),
              ),
              Icon(
                Icons.check_circle,
                color: isDone ? Colors.green : Colors.grey[300],
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Tenggat Waktu : $deadline',
            style: TextStyle(fontSize: 11, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
