import 'package:flutter/material.dart';

class MateriDetailSheet extends StatelessWidget {
  final String title;

  const MateriDetailSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna.",
                    style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.5),
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "Lampiran Materi"),
                Tab(text: "Tugas dan Kuis"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildLampiranList(),
                  _buildEmptyTaskView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLampiranList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _itemLampiran("Zoom Meeting Syncronous", Icons.link, true),
        _itemLampiran("Pengantar User Interface Design", Icons.description, false),
        _itemLampiran("Empat Teori Dasar Antarmuka", Icons.description, false),
        _itemLampiran("20 Prinsip Desain", Icons.link, true),
      ],
    );
  }

  Widget _itemLampiran(String text, IconData icon, bool done) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
          Icon(Icons.check_circle, color: done ? Colors.green : Colors.grey[300], size: 20),
        ],
      ),
    );
  }

  Widget _buildEmptyTaskView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.assignment_turned_in_outlined, size: 80, color: Colors.grey[300]),
        const SizedBox(height: 10),
        const Text("Tidak Ada Tugas Dan Kuis Hari Ini", style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}