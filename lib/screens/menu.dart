import 'package:flutter/material.dart';
import 'package:inventory_app_mobile/widgets/left_drawer.dart';
import 'package:inventory_app_mobile/widgets/menu_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<MenuItem> items = [
    MenuItem("Show Items", Icons.checklist, Colors.blue),
    MenuItem("Add Items", Icons.add_shopping_cart, Colors.green),
    MenuItem("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Inventory Management System',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome to Inventory App', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((MenuItem item) {
                  // Iterasi untuk setiap item
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
