import 'package:flutter/material.dart';
import 'widgets/list_items2.dart';

class DetailMateriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Konsep User Interface Design",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Deskripsi", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna...",
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                  SizedBox(height: 30),
                  
                  // Tab System
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          indicatorWeight: 3,
                          tabs: [
                            Tab(text: "Lampiran Materi"),
                            Tab(text: "Tugas dan Kuis"),
                          ],
                        ),
                        Container(
                          height: 400, // Sesuaikan tinggi sesuai kebutuhan
                          child: TabBarView(
                            children: [
                              // Tab 1: Lampiran Materi
                              ListView(
                                padding: EdgeInsets.only(top: 20),
                                children: [
                                  MaterialCard(title: "Zoom Meeting Syncronous", icon: Icons.link, isDone: true),
                                  MaterialCard(title: "Elemen-elemen Antarmuka Pengguna", icon: Icons.description, isDone: true),
                                  MaterialCard(title: "UID Guidelines and Principles", icon: Icons.description, isDone: true),
                                  MaterialCard(title: "User Profile", icon: Icons.description, isDone: true),
                                  MaterialCard(title: "Principles of UI DesignURL", icon: Icons.link, isDone: true),
                                ],
                              ),
                              // Tab 2: Tugas dan Kuis
                              ListView(
                                padding: EdgeInsets.only(top: 20),
                                children: [
                                  TaskCard(
                                    title: "Quiz Review 01",
                                    desc: "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis...",
                                    icon: Icons.quiz,
                                    isDone: true,
                                  ),
                                  TaskCard(
                                    title: "Tugas 01 - UID Android Mobile Game",
                                    desc: "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS...",
                                    icon: Icons.assignment,
                                    isDone: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}