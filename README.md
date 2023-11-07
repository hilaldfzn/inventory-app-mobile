# Inventory App Mobile
**Nama    : Muhammad Hilal Darul Fauzan**<br>
**NPM     : 2206830542**<br>
**Kelas   : PBP C**<br>

# **Tugas 7: Elemen Dasar Flutter**
Mengimplementasikan aplikasi yang telah dikembangkan menggunakan Flutter dan menerapkan beberapa konsep yang telah dipelajari di kelas serta menjawab beberapa pertanyaan.

## **Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
* Stateless Widget<br>
`Stateless Widget` adalah suatu widget yang tidak mempunyai *state* atau kondisinya tidak bisa berubah-ubah sepanjang program berjalan atau bisa dibilang sebagai entitas yang statis. Widget ini cocok digunakan untuk membuat bagian antarmuka yang tidak berubah-ubah jika dikenakan berbagai macam interaksi kepadanya. Karena widget ini tidak akan berubah-ubah, maka pembuatannya hanya dilakukan sekali saja ketika diperlukan.

* Stateful Widget<br>
Berbeda dengan `Stateless Widget`, `Stateful Widget` adalah suatu widget yang mempunyai *state* atau kondisi yang dapat berubah-ubah atau merupakan entitas yang dinamis. Widget ini cocok digunakan untuk membuat bagian antarmuka yang perlu berubah ketika dikenakan interaksi kepadanya, seperti button yang berubah warna ketika diklik, dan lain sebagainya. Karena widget ini akan berubah-ubah, maka Flutter akan membuat widget tersebut berkali-kali sesuai dengan perubahan yang terjadi kepada widget tersebut untuk memperlihatkan perubahan yang terjadi. Pengelolaan `Stateful Widget` juga sedikit berbeda dengan `Stateless Widget`, yaitu diperlukannya kelas tambahan yang disebut kelas `State` yang berfungsi untuk mengelola *state* dari suatu widget.

## **Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing**
* `MaterialApp`: 
    Widget kenyamanan yang membungkus sejumlah widget yang umumnya diperlukan untuk Material Design applications
* `ThemeData`:
    Widget untuk memanipulasi tema seluruh aplikasi yang dibuat.
* `ColorScheme`:
    Widget yang berisi satu set 30 warna berdasarkan spesifikasi Material yang dapat digunakan untuk mengonfigurasi properti warna sebagian besar komponen.
* `Scaffold`:
    Widget berupa kelas dalam flutter yang menyediakan banyak widget atau bisa dikatakan API seperti Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, dll. Scaffold akan memperluas atau menempati seluruh layar perangkat. Ini akan menempati ruang yang tersedia.
* `AppBar`:
    Widget yang biasanya merupakan komponen paling atas dari aplikasi (atau terkadang paling bawah), berisi toolbar dan beberapa tombol aksi umum lainnya.
* `Text`:
    Text widget menampilkan serangkaian teks dengan single-style. String dapat dipecah menjadi beberapa baris atau mungkin semuanya ditampilkan pada baris yang sama, tergantung pada batasan tata letak. Argumen gaya bersifat opsional.
* `Padding`:
    Widget yang menambahkan lapisan atau ruang kosong di sekitar widget atau sekelompok widget.
* `Column`:
    Widget yang digunakan untuk membuat tata letak vertikal.
* `GridView.count`:
    Widget yang membuat tata letak dengan jumlah tile tetap pada sumbu silang
* `Material`:
    Widget yang berfungsi untuk menyediakan desain visual Material Design pada widget lain.
* `InkWell`:
    Widget berupa area persegi panjang widget Material yang merespons peristiwa sentuhan dengan menampilkan percikan yang terpotong.
* `Container`:
    Kelas widget yang memungkinkan untuk menyesuaikan widget turunannya.
* `Icon`:
    Widget yang berfungsi untuk menampilkan beragam ikon dengan aneka model dan ukuran.
* `SnackBar`:
    Widget berupa pesan ringan dengan tindakan opsional yang ditampilkan secara singkat di bagian bawah layar.

## **Implementasi Checklist Tugas 7**
1. Pergi ke direktori di mana aplikasi ini ingin dibuat, lalu buka *command prompt* pada direktori tersebut.
2. Buat proyek Flutter baru dengan nama `inventory_app_mobile` dengan menggunakan command berikut.
   ```
   flutter create inventory_app_mobile
   cd inventory_app_mobile
   ```
3. Buat file baru dengan nama `menu.dart` pada folder `lib`, lalu tambahkan baris import berikut.
   ```dart
   import 'package:flutter/material.dart';
   ```
4. Pindahkan kode pada file `main.dart` pada bagian *class* `MyHomePage` dan `_MyHomePage` ke file `menu.dart`.
5. Tambahkan baris import berikut ke file `main.dart` agar class `MyHomePage` tetap bisa digunakan di file `main.dart`.
   ```dart
   import 'package:inventory_app_mobile/menu.dart';
   ```
6. Mengubah sifat widget `MyHomePage` menjadi *stateless* dengan mengubah kode pada class `MyHomePage` menjadi seperti berikut.
   ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            )
        }
    }
   ```
7. Mengubah baris kode `MyHomePage(title: 'Flutter Demo Home Page')` pada file `main.dart` menjadi `MyHomePage()`.
8. Membuat class `Item`.
   ```dart
   class Item {
    final String name;
    final IconData icon;

    Item(this.name, this.icon);
   }
   ```
9. Tambahkan baris kode berikut untuk menambahkan item-item yang akan dibuat di bawah *constructor* pada class `MyHomePage`.
    ```dart
    final List<Item> items = [
      Item("Lihat Produk", Icons.checklist),
      Item("Tambah Produk", Icons.add_shopping_cart),
      Item("Logout", Icons.logout),
    ];
    ```
10. Tambahkan kode berikut di dalam `Widget build` pada class `MyHomePage`.
    ```dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Inventory Management System',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Main Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((Item item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    ```
11. Buat *stateless widget* `ItemCard` untuk menampilkan card.
    ```dart
    class ItemCard extends StatelessWidget {
        final Item item;

        const ItemCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
                color: Colors.indigo,
                child: InkWell(
                    // Area responsive terhadap sentuhan
                    onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Kamu telah menekan tombol ${item.name}!")));
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
    ```
12. Menghapus class `_MyHomePage` karena widget `MyHomePage` sudah berubah menjadi *stateless* sehingga class `_MyHomePage` tidak dibutuhkan.

## **Bonus (Mengimplementasikan warna-warna berbeda untuk setiap tombol `Lihat Item`, `Tambah Item`, dan `Logout`)**
1. Tambahkan atribut baru pada class `Item` untuk menyimpan warna tiap Item.
   ```dart
    class Item {
        final String name;
        final IconData icon;
        final Color color;
        Item(this.name, this.icon, this.color);
    }
   ```
2. Tambahkan argumen warna yang diinginkan pada setiap item di variabel `items`.
   ```dart
    final List<Item> items = [
        Item("Lihat Item", Icons.checklist, Colors.blue),
        Item("Tambah Item", Icons.add_shopping_cart, Colors.green),
        Item("Logout", Icons.logout, Colors.red),
    ];
   ```
3. Mengubah baris kode pada `Widget build` di class `ItemCard` pada bagian `color: Colors.indigo,` menjadi `color: item.color,`.
   ```dart
    class ItemCard extends StatelessWidget {
        ...
        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                ...
            )
        }

    }
   ```