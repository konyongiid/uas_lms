import 'package:flutter/material.dart';
import '../materi_detail_sheet.dart';

class CourseCard extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;
  final bool isCompleted;

  const CourseCard({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => MateriDetailSheet(title: title),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AA9E6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                    Icon(Icons.check_circle, 
                      color: isCompleted ? Colors.green : Colors.grey[300], 
                      size: 22
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}