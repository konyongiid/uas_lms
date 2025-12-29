import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _activeTabIndex = 0;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color profileHeaderColor = Color(0xFF1A4A7A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: profileHeaderColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -45,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: _image != null
                                ? FileImage(_image!)
                                : const NetworkImage(
                                        'https://via.placeholder.com/150',
                                      )
                                      as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _getImage,
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: profileHeaderColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'MOH. QOIDUL GHURRI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem("About Me", 0),
                _buildTabItem("Kelas", 1),
                _buildTabItem("Edit Profile", 2),
              ],
            ),
          ),

          Expanded(child: _buildDynamicContent()),
        ],
      ),
    );
  }

  Widget _buildDynamicContent() {
    if (_activeTabIndex == 1) return _buildKelasContent();
    if (_activeTabIndex == 2) return _buildEditProfileContent();
    return _buildAboutMeContent();
  }

  // --- 1. KONTEN ABOUT ME + TOMBOL LOGOUT ---
  Widget _buildAboutMeContent() {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        const Text(
          "Informasi User",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        _buildInfoItem("Email address", "qoidul.ghurri@student.com"),
        _buildInfoItem("Program Studi", "D4 Teknologi Rekayasa Multimedia"),
        _buildInfoItem("Fakultas", "FIT"),
        const SizedBox(height: 20),
        const Text(
          "Aktivitas Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        _buildInfoItem("First access to site", "Monday, 7 September 2025"),
        _buildInfoItem("Last access to site", "Tuesday, 22 June 2025 (now)"),

        const SizedBox(height: 30),

        // --- TOMBOL LOG OUT ---
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // Tambahkan logika logout di sini
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Color(0xFF1A4A7A)),
            label: const Text(
              "Log Out",
              style: TextStyle(
                color: Color(0xFF1A4A7A),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF1A4A7A)),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // --- 2. KONTEN KELAS ---
  Widget _buildKelasContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      children: [
        _buildKelasItem(
          "BAHASA INGGRIS: BUSINESS AND SCIENTIFIC",
          "D4SM-41-GAB1 [ARS]",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
          "D4SM-42-03 [ADY]",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "KEWARGANEGARAAN",
          "D4SM-41-GAB1 [BBG], JUMAT 2",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "OLAH RAGA D3TT-44-02 [EYR]",
          "Pendidikan Karakter",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "PEMROGRAMAN MULTIMEDIA INTERAKTIF",
          "D4SM-43-04 [TPR]",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA",
          "D4SM-41-GAB1 [APJ]",
          "Monday, 8 February 2021",
        ),
        _buildKelasItem(
          "SISTEM OPERASI D4SM-44-02 [DDG]",
          "Infrastruktur IT",
          "Monday, 8 February 2021",
        ),
      ],
    );
  }

  // --- 3. KONTEN EDIT PROFILE ---
  Widget _buildEditProfileContent() {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        const Text(
          "Edit Informasi Profil",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 20),
        _buildEditField("Nama Lengkap", "MOH. QOIDUL GHURRI"),
        _buildEditField("Email", "qoidul.ghurri@student.com"),
        _buildEditField("Program Studi", "D4 Teknologi Rekayasa Multimedia"),
        _buildEditField("Fakultas", "FIT"),
        _buildEditField("Nomor Telepon", "+62 812 XXXX XXXX"),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profil berhasil diperbarui!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A4A7A),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Simpan Perubahan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // --- HELPER WIDGETS ---
  Widget _buildEditField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: TextEditingController(text: initialValue),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKelasItem(String title, String subtitle, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF90CAF9),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(subtitle, style: const TextStyle(fontSize: 11)),
                Text(
                  "Tanggal Mulai $date",
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isActive = _activeTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _activeTabIndex = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 40,
              color: Colors.grey[400],
            ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
