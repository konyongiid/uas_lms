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
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title, style: const TextStyle(fontSize: 14)),
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
  final VoidCallback? onTap; // Parameter untuk fungsi klik

  TaskCard({
    required this.title, 
    required this.desc, 
    required this.icon, 
    this.isDone = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // Menggunakan InkWell agar ada feedback saat ditekan
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: Colors.grey[600]),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        isDone ? Icons.check_circle : Icons.check_circle_outline,
                        color: isDone ? Colors.green : Colors.grey[400],
                        size: 20,
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
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