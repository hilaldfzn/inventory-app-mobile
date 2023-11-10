import 'package:flutter/material.dart';
import 'package:inventory_app_mobile/widgets/left_drawer.dart';
import 'package:inventory_app_mobile/screens/item_form.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text(
                    item.power.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category: ${item.category}"),
                  Text("Price: ${item.price} BP"),
                  Text("Amount: ${item.amount}"),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.indigo),
                onPressed: () {
                  // Ketika click icon detail, akan memunculkan data lengkap item
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(item.name),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("Category: ${item.category}"),
                              Text("Amount: ${item.amount}"),
                              Text("Power: ${item.power}"),
                              Text("Price: ${item.price} BP"),
                              Text("Description: ${item.description}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
