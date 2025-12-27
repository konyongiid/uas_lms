import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Pengumuman
            const Text(
              'Workshop Design UI/UX 2025/2026',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A4A7A),
              ),
            ),
            const SizedBox(height: 12),
            
            // Info Penulis & Tanggal
            Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, size: 20, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Text(
                  'By Admin CeLOE - Rabu, 2 Juni 2026, 10:45',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Gambar Poster (Menggunakan Placeholder yang menyerupai layout gambar khdf.png)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFE3F2FD),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://via.placeholder.com/600x350/E3F2FD/1A4A7A?text=Poster+Workshop+UI/UX+2025/2026',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Judul Isi
            const Center(
              child: Text(
                'Workshop Design UI/UX',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Konten Teks
            const Text(
              'Diinformasikan kepada seluruh mahasiswa, kami dari tim CeLOE akan mengadakan Workshop Design UI/UX pada tanggal 12 Juni 2026. Kegiatan ini bertujuan untuk meningkatkan skill desain antarmuka dan pengalaman pengguna dalam pengembangan aplikasi mobile.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5, fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Text(
              'Workshop ini akan dilaksanakan secara hybrid. Bagi peserta yang ingin hadir secara luring, diharapkan berkumpul di Lab Desain pada pukul 08:00 WIB.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5, fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Text(
              'Demikian informasi ini kami sampaikan, pendaftaran dapat diakses melalui portal mahasiwa masing-masing.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5, fontSize: 14),
            ),
            const SizedBox(height: 25),
            
            const Text(
              'Hormat Kami,\nCeLOE Telkom University',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}