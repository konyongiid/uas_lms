import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Variabel untuk menyimpan pilihan yang dipilih
  String? selectedOption;

  final List<Map<String, String>> options = [
    {'key': 'A', 'text': 'Jenis Kelamin'},
    {'key': 'B', 'text': 'Alamat'},
    {'key': 'C', 'text': 'Hobby'},
    {'key': 'D', 'text': 'Riwayat Pendidikan'},
    {'key': 'E', 'text': 'Umur'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Merah (Menyesuaikan desain Quiz Review)
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            color: const Color(0xFF1A4A7A), // Disamakan dengan warna tombol di halaman instruksi
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Quiz Review 1',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.timer_outlined, color: Colors.white, size: 20),
                    SizedBox(width: 5),
                    Text(
                      '15 : 00', 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                  ],
                )
              ],
            ),
          ),

          // Navigasi Nomor Soal
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: List.generate(15, (index) {
                return Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}', 
                      style: const TextStyle(fontSize: 12, color: Colors.black54)
                    ),
                  ),
                );
              }),
            ),
          ),

          // Area Pertanyaan
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Soal Nomor 1 / 15', 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                  const SizedBox(height: 60),
                  const Center(
                    child: Text(
                      'Radio button dapat digunakan untuk menentukan ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // List Jawaban
                  ...options.map((option) {
                    bool isSelected = selectedOption == option['key'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option['key'];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF1A4A7A) : const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected 
                            ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 4))]
                            : [],
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${option['key']}.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                option['text']!,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // Footer Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk ke nomor berikutnya
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Soal Selanjutnya'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}