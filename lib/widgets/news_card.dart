import 'package:flutter/material.dart';
import 'package:football_news/screens/newslist_form.dart';

class MenuItem {
  final String name;
  final IconData icon;
  const MenuItem({required this.name, required this.icon});
}

class ItemCard extends StatelessWidget {
  final MenuItem item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo.shade50,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Berita") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsFormPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 48, color: Colors.indigo),
              const SizedBox(height: 12),
              Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
