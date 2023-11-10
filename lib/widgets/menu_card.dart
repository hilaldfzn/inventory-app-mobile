import 'package:flutter/material.dart';
import 'package:inventory_app_mobile/screens/item_form.dart';
import 'package:inventory_app_mobile/screens/item_list.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class Item {
  final String name;
  final String category;
  final int amount;
  final int power;
  final int price;
  final String description;

  Item({
    required this.name,
    required this.category,
    required this.amount,
    required this.power,
    required this.price,
    required this.description,
  });
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Show Items") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemsPage(),
                ));
          }

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Items") {
            // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemFormPage(),
              ),
            );
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
