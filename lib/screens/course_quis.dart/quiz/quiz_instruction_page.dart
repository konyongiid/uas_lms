import 'package:flutter/material.dart';
// Pastikan file tujuan bernama quiz_page.dart di folder yang sama
import 'quiz_page.dart';

class QuizInstructionPage extends StatelessWidget {
  const QuizInstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A4A7A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\n"
                    "Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Kerjakan sebelum hari Jum'at, 26 Februari 2026 jam 23:59 WIB.",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "Kuis Akan di tutup pada Jumat, 26 February 2026, 11:59 PM",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text("Batas Waktu: 15 menit"),
                        SizedBox(height: 8),
                        Text("Metode Penilaian: Nilai Tertinggi"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Riwayat Percobaan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Percobaan Yang Sudah Di Lakukan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A4A7A),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Status",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        Text(
                          "Nilai / 100.00",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        Text(
                          "Tinjau Kembali",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Selesai",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "85.0",
                          style: TextStyle(color: Colors.blue),
                        ),
                        const Text(
                          "Lihat",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Tombol Aksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Memastikan QuizPage dipanggil dengan benar
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const QuizPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A4A7A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Ambil Kuis",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Kembali Ke Kelas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}