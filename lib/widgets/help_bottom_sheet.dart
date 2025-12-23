import 'package:flutter/material.dart';

class HelpBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bantuan', style: Theme.of(context).textTheme.displaySmall),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bahasa', style: TextStyle(color: Color(0xFF6B7280))),
              Switch(value: true, onChanged: (value) {}),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pertanyaan Umum',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // Add expandable list items here
                  SizedBox(height: 16),
                  Text(
                    'Kontak Kami',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // Add contact info here
                ],
              ),
            ),
          ),
          OutlinedButton(onPressed: () {}, child: Text('Hubungi Dukungan')),
        ],
      ),
    );
  }
}
