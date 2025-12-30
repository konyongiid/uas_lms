import 'package:flutter/material.dart';

// Widget untuk item Lampiran Materi
class MaterialCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isDone;

  MaterialCard({required this.title, required this.icon, this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title, style: TextStyle(fontSize: 14)),
        trailing: Icon(
          isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isDone ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}

// Widget untuk item Tugas dan Kuis
class TaskCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final bool isDone;

  TaskCard({required this.title, required this.desc, required this.icon, this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.grey[600]),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      isDone ? Icons.check_circle : Icons.check_circle_outline,
                      color: isDone ? Colors.green : Colors.grey[400],
                      size: 20,
                    ),
                  ],
                ),
                Divider(),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
