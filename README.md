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

# **Tugas 8: Flutter *Navigation*, *Layouts*, *Forms*, and *Input Elements***
Mengimplementasikan *navigation*, *layout*, *form*, dan *form input elements* pada Flutter dan menerapkan beberapa konsep yang telah dipelajari di kelas serta menjawab beberapa pertanyaan.

## **Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**
1. `Navigator.push()`:
    * Metode ini digunakan untuk menambahkan layar baru di atas layar saat ini dalam tumpukan navigasi.
    * Layar sebelumnya akan tetap ada dalam tumpukan navigasi.
    * Berguna ketika ingin bisa kembali ke layar sebelumnya.
    ```dart
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnotherScreen()),
    );
    ```
2. `Navigator.pushReplacement()`:
    * Metode ini digunakan untuk menambahkan layar baru ke tumpukan navigasi dan menggantikan layar saat ini dengan layar baru.
    * Layar sebelumnya akan dihapus dari tumpukan navigasi.
    * Berguna ketika Anda tidak ingin pengguna dapat kembali ke layar sebelumnya dan ingin menggantinya dengan layar baru.
    ```dart
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AnotherScreen()),
    );
    ```

## **Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**
* `Container`: Digunakan untuk mengelompokkan dan mendekorasi widget lain, seperti menentukan warna latar belakang, batas, dan padding.
* `Row`: Menyusun widget dalam baris horizontal. Berguna saat ingin menampilkan beberapa widget secara berdampingan.
* `Column`: Menyusun widget dalam kolom vertikal. Cocok untuk menata widget secara vertikal.
* `ListView`: Menyusun widget dalam daftar yang dapat di-scroll. Cocok untuk menampilkan daftar item yang panjang atau dinamis.
* `GridView`: Menyusun widget dalam bentuk grid (baris dan kolom). Berguna untuk menampilkan daftar item dalam tata letak grid.
* `Stack`: Menumpuk widget satu di atas yang lain. Cocok ketika Anda ingin menempatkan widget di atas widget lain.
* `Expanded`: Digunakan untuk memperluas child widget dalam widget parent, terutama berguna dalam Row dan Column untuk memberikan proporsi.
* `Card`: Mengelompokkan informasi ke dalam kotak. Cocok untuk menampilkan informasi tertentu.
* `Wrap`: Menyusun widget dalam baris dan kolom yang dapat melibatkan baris atau kolom baru jika tidak cukup ruang. Berguna saat ingin menampilkan banyak item dalam ruang yang terbatas.
* `SizedBox`: Memberikan kotak kosong dengan lebar, tinggi, atau keduanya tertentu. Berguna untuk mengatur ruang antara atau sekitar widget.

## **Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**
1. ElevatedButton
    * Tombol yang memiliki bayangan atau elevated.
    * `child` dapat berisi widget lagi, dapat berupa text atau yang lainnya.
    * `onPressed` dapat diisi dengan fungsi ketika tombol ditekan, seperti menyimpan data.

2. TextFormField
    * Widgetnya menyediakan kolom untuk melakukan input, yang saya gunakan pada data item, seperti `name`, `category`, `amount`, `power`, `price`, dan `description`.
    * `onChanged` digunakan untuk menyimpan nilai yang diinput dalam variabel seperti salah satunya yaitu `_amount`.
    * `validator` digunakan untuk memastikan input yang tidak kosong.
    * Dapat didefinisikan kontrol (controllers) untuk mengelola status input dan menggunakan callback untuk menangani perubahan atau pengiriman formulir.

## **Bagaimana penerapan clean architecture pada aplikasi Flutter?**
1. *Domain*, berisi logika bisnis dan aturan aplikasi, dapat digunakan agar lebih mudah melakukan migrasi antar platform.
    * Entities
    * Usecases
    * Repositories

2. *App*, sebagai perantara yang berfungsi untuk menyambungkan layer lain dengan Domain.
    * View
    * Controller
    * Presenter
    * Extra

3. *Data*, data retrival yang diambil dari database.
    * Repositories
    * Models
    * Mappers
    * Extra

4. *Device*, berfungsi untuk berkomunikasi langsung dengan platform seperti Android dan IOS, serta bertanggung jawab atas fungsional native seperti contohnya GPS.
    * Devices
    * Extra

## **Implementasi Checklist Tugas 8**
1. Buat direktori baru bernama `widgets` dan di dalamnya buat file baru bernama `left_drawer.dart`, lalu tambahkan kode berikut.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventory_app_mobile/screens/menu.dart';
    import 'package:inventory_app_mobile/screens/item_form.dart';

    class LeftDrawer extends StatelessWidget {
        const LeftDrawer({super.key});

        @override
        Widget build(BuildContext context) {
            return Drawer(
                child: ListView(
                    children: [
                        const DrawerHeader(
                            // Bagian drawer header
                            ...
                        ),
                        // Bagian routing
                        ...
                    ],
                ),
            );
        }
    }
    ```

2.  Selanjutnya isi bagian drawer headernya dengan kode berikut agar terlihat rapi.
    ```dart
    const DrawerHeader(
        decoration: BoxDecoration(
            color: Colors.indigo,
        ),
        child: Column(
            children: [
                Text(
                    'Inventory App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                    "Create and manage your items from here!",
                    // Menambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                    ),
                ),
            ],
        ),
    ),
    ```

3. Lalu isi bagian routing menjadi seperti berikut untuk halaman-halaman yang sudah diimpor sebelumnya.
    ```dart
    ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        // Bagian redirection ke MyHomePage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                ));
        },
    ),
    ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Add Items'),
        // Bagian redirection ke ItemFormPage
        onTap: () {
            // Routing ke ItemFormPage di sini, setelah halaman ItemFormPage sudah dibuat.
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ItemFormPage()));
        },
    ),
    ```

4. Buka `menu.dart`, lalu tambahkan kode berikut untuk menambahkan drawer yang sudah dibuat.
    ```dart
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
            drawer: const LeftDrawer(),     // Tambahkan ini
            ...
        );
    }
    ```

5. Untuk membuat form, perlu buat file baru bernama `item_form.dart` pada folder `lib`, lalu tambahkan kode berikut. Disini terdapat import yang dibutuhkan, terdapat `_formKey`, dan terdapat variabel untuk menyimpan input.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventory_app_mobile/widgets/left_drawer.dart';
    import 'package:inventory_app_mobile/widgets/menu_card.dart';

    class ItemFormPage extends StatefulWidget {
        const ItemFormPage({super.key});

        @override
        State<ItemFormPage> createState() => _ItemFormPageState();
    }

    List<Item> items = [];

    class _ItemFormPageState extends State<ItemFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        String _category = "";
        int _amount = 0;
        int _power = 0;
        int _price = 0;
        String _description = "";

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            )
        }
    }
    ```

6. Isi bagian `Scaffold` dengan kode berikut. Disini `_formKey` ditambahkan di atribut `key` di `Form` sebagai handler form state, validasi form, dan penyimpanan form. Di sini juga terdapat widget `Column` sebagai child `SingleChildScrollView`. Lalu ada `TextFormField` yang dibungkus `Padding` sebagai child `Column` dan ada `crossAxisAlignment` untuk mengatur allignmentnya. Terdapat `onChanged` untuk menangkap perubahan dan `validator` untuk melakukan validasi `TextFormField`.
    ```dart
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Add Your Item',
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),

            // Menambahkan drawer yang sudah dibuat di sini
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Item Name",
                                labelText: "Item Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    _name = value!;
                                });
                            },
                            onSaved: (String? value) {
                                setState(() {
                                    // Menambahkan variabel yang sesuai
                                    _name = value!;
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Name cannot be empty!";
                                }
                                return null;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Category",
                                labelText: "Category",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    _category = value!;
                                });
                            },
                            onSaved: (String? value) {
                                setState(() {
                                    // Menambahkan variabel yang sesuai
                                    _category = value!;
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Category cannot be empty!";
                                }
                                return null;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Amount",
                                labelText: "Amount",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    _amount = int.parse(value!);
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Amount cannot be empty!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Amount must be a valid integer!";
                                }
                                return null;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Power",
                                labelText: "Power",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    _power = int.parse(value!);
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Power cannot be empty!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Power must be a valid integer!";
                                }
                                return null;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Price",
                                labelText: "Price",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    _price = int.parse(value!);
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Price cannot be empty!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Price must be a valid integer!";
                                }
                                return null;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Description",
                                labelText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                    // Menambahkan variabel yang sesuai
                                    _description = value!;
                                });
                            },
                            onSaved: (String? value) {
                                setState(() {
                                    // Menambahkan variabel yang sesuai
                                    _description = value!;
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Description cannot be empty!";
                                }
                                return null;
                            },
                        ),
                    ),
                    ]),    
                ),
            ),
        );
    }
    ```

7. Buatlah tombol di bagian Tombol untuk pop up sebagai child dari `Column` lalu bungkus dengan widget `Padding` dan `Allign` untuk memunculkan data pada pop up saat tombol ditekan. Di sini terdapat fungsi `showDialog()` pada bagian `onPressed()` dan ada widget `AlertDialog`, kemudian ada fungsi untuk reset form.
    ```dart
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        items.add(Item(
                            name: _name,
                            category: _category,
                            amount: _amount,
                            power: _power,
                            price: _price,
                            description: _description,
                        ));
                        showDialog(
                            context: context,
                            builder: (context) {
                                return AlertDialog(
                                    title: const Text('Item saved successfully'),
                                    content: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                // Memunculkan value-value lainnya
                                                Text('Name: $_name'),
                                                Text('Category: $_category'),
                                                Text('Amount: $_amount'),
                                                Text('Power: $_power'),
                                                Text('Price: $_price BP'),
                                                Text('Description: $_description')
                                            ],
                                        ),
                                    ),
                                    actions: [
                                        TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                                Navigator.pop(context);
                                            },
                                        ),
                                    ],
                                );
                            },
                        );
                        _formKey.currentState!.reset();
                    }
                },
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
    ),
    ```

8. Buka file `menu.dart`, lalu tambahkan kode berikut agar dapat menavigasi halaman lain.
    ```dart
    ...
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
            ),
        );
    }
    ```

9. Buat file baru di direktori `widgets` dengan nama `menu_card.dart`. Lalu pindahkan bagian `class MenuItem` dan `class MenuCard` di `menu.dart` ke `menu_card.dart`. Impor juga `material.dart` bawaan dan `item_form.dart` di `menu_card.dart`, lalu impor `menu_card.dart` di `menu.dart`.

10. Buat folder baru dengan nama `screens` di direktori `lib`, lalu pindahkan `menu.dart` dan `item_form.dart` ke sana. Gunakan IDE yang ada ekstensi Flutter dan Dart agar refactoring dilakukan secara otomatis.

## **Bonus: Membuat sebuah halaman baru, yaitu halaman daftar item dengan isi item yang dibuat dan Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Item pada halaman utama atau drawer.**
1. Buka `menu_card.dart` lalu tambahkan list dan class item untuk menyimpan item yang ditambahkan seperti kode berikut.
    ```dart
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
    ```
2. Buka `item_form.dart` tambahkan potongan kode berikut.
    ```dart
    List<Item> items = [];
    ```
3. Lakukan impor dan tambahkan kode berikut di bagian InkWellnya untuk menambahkan kondisi untuk berganti page ke halaman lihat produk, perhatikan kode berikut.
    ```dart
    import 'package:inventory_app_mobile/screens/item_form.dart';
    import 'package:inventory_app_mobile/screens/item_list.dart';
    ...
    // Navigate ke route yang sesuai (tergantung jenis tombol)
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
    ```

4. Buka file `item_form.dart` lalu tambahkan kode berikut di bagian Align `onPressed` untuk menyimpan item yang ditambahkan.
    ```dart
    ...
    onPressed: () {
        if (_formKey.currentState!.validate()) {
            items.add(Item(
                name: _name,
                category: _category,
                amount: _amount,
                power: _power,
                price: _price,
                description: _description,
            ));
            ...
        }
    } 
    ```

5. Buat file baru di direktori `screens` dengan nama `item_list.dart` sebagai page untuk melihat list item, isi dengan kode berikut.
    ```dart
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
    ```

6. Buatlah routing pada file `left_drawer.dart`, seperti kode berikut.
    ```dart
    import 'package:inventory_app_mobile/screens/item_list.dart';
    ...
    ListTile(
        leading: const Icon(Icons.checklist),
        title: const Text('Show Items'),
        // Bagian redirection ke ShopFormPage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ItemsPage(),
                ));
        },
    ),
    ...
    ```

# **Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter**
Mengintegrasikan layanan Django yang sudah dibuat pada tugas-tugas sebelumnya dengan aplikasi Flutter dan menerapkan beberapa konsep yang telah dipelajari di kelas serta menjawab beberapa pertanyaan.

## **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Ini bisa dilakukan dengan langsung mem-parsing data JSON ke dalam struktur data seperti dictionary atau array, tergantung pada struktur data JSON itu sendiri.

Namun, apakah ini lebih baik daripada membuat model terlebih dahulu? Jawabannya tergantung pada konteks dan kebutuhan aplikasi kta. Berikut adalah beberapa pertimbangan:
1. Keuntungan menggunakan model
    - Validasi data: Model dapat membantu dalam validasi data. Misalnya, jika kita tahu bahwa suatu nilai harus berupa integer dan model kita mencerminkan hal ini, maka jika data JSON berisi nilai non-integer untuk bidang ini, kesalahan akan terjadi saat parsing.
    - Ease of Use: Dengan model, kita dapat mengakses data menggunakan properti objek, yang bisa lebih intuitif dan mudah dibaca daripada mengakses nilai melalui kunci dictionary.
    - Dokumentasi dan struktur: Model memberikan struktur yang jelas untuk data kita, yang bisa sangat membantu dalam dokumentasi dan pemahaman data.
2. Keuntungan tidak menggunakan model
    - Fleksibilitas: Jika struktur data JSON sangat dinamis dan berubah-ubah, mungkin lebih mudah untuk bekerja dengan dictionary atau array daripada mencoba menyesuaikan model kita setiap kali struktur berubah.
    - Kecepatan pengembangan: Dalam beberapa kasus, mungkin lebih cepat dan lebih mudah untuk mulai bekerja dengan data tanpa menghabiskan waktu untuk mendefinisikan model terlebih dahulu.

Secara umum, jika kita bekerja dengan API atau data JSON yang memiliki struktur yang konsisten dan kita ingin memanfaatkan keuntungan dari model, maka pendekatan berbasis model mungkin lebih baik. Jika kita memerlukan fleksibilitas atau kecepatan, mungkin lebih baik bekerja langsung dengan data JSON. kita harus mempertimbangkan trade-off ini dalam konteks proyek kita sendiri.

## **Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
`CookieRequest` adalah sebuah kelas yang digunakan untuk mengelola HTTP request dan cookie yang terkait dengan request tersebut. Kelas ini memiliki beberapa method untuk melakukan operasi seperti `login`, `get`, `post`, dan `logout`.

_Instance_ `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dalam aplikasi dapat melakukan HTTP request yang terotentikasi dan semua komponen akan memiliki akses ke data pengguna yang sama. 

Misalnya, pada tugas kali ini, _Instance_ `CookieRequest` dibagikan ke semua komponen melalui `Provider` dan diakses di `ItemFormPage` dengan `context.watch<CookieRequest>()` untuk melakukan permintaan HTTP POST ke server untuk mengirimkan data buku baru ke server saat tombol "save" ditekan.

## **Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**
Berikut adalah mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada tugas kali ini.

1. Fungsi `fetchProduct` membuat permintaan HTTP GET ke URL yang ditentukan. Ini dilakukan secara asinkron menggunakan `http.get`.
    ```dart
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );
    ```

2. Respons dari server kemudian di-_decode_ menjadi bentuk JSON menggunakan `jsonDecode`.
    ```dart
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    ```

3. Data JSON kemudian di-_convert_ menjadi objek `Product` menggunakan method `formJson` yang didefinisikan dalam kelas `Product` yang kemudian objek-objek tersebut ditambahkan ke dalam `listProduct`.
    ```dart
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    ```

4. Dalam method `build`, `FutureBuilder` digunakan untuk menunggu `fetchProduct` selesai dan membangun UI berdasarkan hasilnya. Jika data masih dimuat, `CircularProgressIndicator` ditampilkan. Jika data telah dimuat, `ListView.builder` digunakan untuk membuat daftar barang.

## **Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
Berikut adalah mekanisme autentikasi pada tugas kali ini.

1. Pengguna memasukkan _username_ dan _password_ melalui dua `TextField`.

2. Aplikasi kemudian membuat permintaan HTTP POST ke _endpoint_ _login_ Django menggunakan `CookieRequest`. Data _username_ dan _password_ dikirimkan sebagai bagian dari _body request_.
    ```dart
    final response = await request.login(
        "http://127.0.0.1:8000/auth/login/",  
        {
            'username': username,
            'password': password,
        });
    ```

3. Django memproses permintaan login, memeriksa apakah _username_ dan _password_ valid, dan mengirimkan respons. Respons ini kemudian diterima oleh aplikasi Flutter dan Flutter dan diperiksa. Jika login berhasil (`request.loggedIn` adalah `true`), aplikasi navigasi ke `MyHomePage` dan menampilkan pesan selamat datang. Jika login gagal, aplikasi menampilkan pesan kesalahan.

## **Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**
- `AlertDialog` : untuk menampilkan dialog peringatan atau pesan ke pengguna.
- `TextButton` : untuk menampilkan tombol dengan teks.
- `TextField` : untuk menerima input teks dari pengguna.
- `InputDecoration` : untuk mendefinisikan penampilan dan gaya dari `TextField`.
- `SizedBox` : untuk memberikan jarak antara dua widget.
- `ElevatedButton` : untuk menampilkan tombol.
- `Navigator` : untuk mengelola stack rute dalam aplikasi.
- `MaterialPageRoute` : untuk menyediakan efek transisi saat berpindah antar halaman.
- `FloatingActionButton` : untuk menampilkan tombol aksi yang mengambang, pada tugas ini digunakan untuk tombol kembali.
- `CircularProgressIndicator` : untuk menampilkan indikator loading.
- `ListView.builder` : untuk membuat list yang efisien dengan item yang di-_build_ saat mereka diputar ke dalam tampilan.
- `GestureDetector` : untuk mendeteksi gestur, pada tugas ini digunakan untuk mendeteksi ketuka pada item `ListView`.
- `FutureBuilder` : untuk membuat widget berdasarkan hasil Future, pada tugas ini dugunakan untuk membangun `ListView` berdasarkan hasil dari `fetchProduct()`.
- `Provider` : untuk menyediakan objek yang dapat dibaca oleh widget lain yang berada di bawahnya di widget tree, pada tugas ini digunakan untuk menyediakan _instance_ `CookieRequest` ke widget lain.
- `LoginPage` : widget kustom untuk menampilkan halaman login.
- `ItemsPage` : widget kustom umtuk menampilkan halaman semua barang.
- `DetailItemPage` : widget kustom untuk menampilkan halaman detail barang.
- `ScaffoldMessenger` : untuk menampilkan `SnackBar`.

## **Implementasi Checklist Tugas 9**
### 1. Memastikan deployment proyek tugas Django sebelumnya telah berjalan dengan baik.
Melakukan _push_ ulang dengan memberikan sedikit perbedaan pada kode aplikasi untuk mengatasi masalah _blue screen_ saat membuka _web app_.

### 2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Membuat `django-app` baru bernama `authentication` dan menambahkannya ke `INSTALLED_APPS` di `settings.py` aplikasi Django.
- Menginstall `django-cors-headers` dan menambahkannya ke `INSTALLED_APPS` dan `requirements.txt`, serta menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` di `settings.py`
- Menambahkan beberapa konfigurasi berikut ke `settings.py`:
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
- Membuat _method view_ untuk login dan logout pada `authentication/views.py` 
    ```python
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```
- Membuat berkas `urls.py` pada direktori `authentication` dan menambahkan URL _routing_ terhadap _method view_ yang sudah dibuat.
    ```python
    from django.urls import path
    from authentication.views import login, logout

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
        path('logout/', logout, name='logout'),
    ]
    ```
- Menambahkan `path('auth/', include('authentication.urls')),` pada berkas `inventory_app/urls.py`

### 3. Membuat halaman login pada proyek tugas Flutter.
- Meng-_install_ _package_ Flutter untuk melakukan kontak dengan _web service Django_ dengan menjalankan perintah `flutter pub add provider` dan `flutter pub add pbp_django_auth`
- Memodifikasi _root widget_ untuk menyediakan `CookieRequest` _library_ ke semua _child widgets_ dengan menggunakan `Provider`.

    Hasil modifikasi:
    ```dart
    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return Provider(
                create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                },
                child: MaterialApp(
                    title: 'Inventory App',
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                        useMaterial3: true,
                ),
                home: LoginPage(),
            ));
        }
    }

    ```
- Membuat berkas `login.dart` pada folder `screens` dan mengisinya dengan kode berikut:
    ```dart
    import 'package:inventory_app_mobile/screens/menu.dart';
    import 'package:inventory_app_mobile/screens/register.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.indigo,
                ),
                home: const LoginPage(),
            );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo[900],
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                    onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        final response = await request.login(
                            "http://127.0.0.1:8000/auth/login/",
                            {
                            'username': username,
                            'password': password,
                            });

                        if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];

                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("$message Welcome, $uname.")));
                        } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Login failed'),
                            content: Text(response['message']),
                            actions: [
                                TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                ),
                            ],
                            ),
                        );
                        }
                    },
                    child: const Text('Login'),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                    onPressed: () {
                        // Navigate to Register Page
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                    },
                    child: const Text('Register'),
                    )
                ],
                ),
            ),
            );
        }
    }
    ``` 

- Mengubah konfigurasi `home` pada _Widget_ `MaterialApp` di berkas `main.dart` dari `home: MyHomePage()` menjadi `home: LoginPage()`.
- Mengimplementasikan fitur _logout_ dengan menambahkan kode berikut pada `menu_card.dart`
    ```dart
    class MenuCard extends StatelessWidget {
    ...
        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            ...
                // Area responsive terhadap sentuhan
                onTap: () async {
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
                else if (item.name == "Add Items") {
                    // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemFormPage(),
                    ),
                    );
                } else if (item.name == "Logout") {
                    final response = await request.logout(
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        "http://127.0.0.1:8000/auth/logout/");
                    String message = response["message"];
                    if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                    } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message"),
                    ));
                    }
                }
                },
            ...
        }
    }
    ```

### 4. Membuat model kustom sesuai dengan proyek aplikasi Django.
- Memanfaatkan [Quicktype](https://app.quicktype.io/) untuk membuat model dengan data JSON dari `http://127.0.0.1:8000/json/` direktori `lib/models` dan mengisinya dengan kode model dari [Quicktype](https://app.quicktype.io/) tadi.

### 5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- Menambahkan _package_ [`http`](https://pub.dev/packages/http) dengan menjalankan perintah `flutter pub add http`.
- Menambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` pada berkas `android/app/src/main/AndroidManifest.xml` untuk memperbolehkan akses internet pada aplikasi Flutter.
- Membuat berkas baru bernama `item_list.dart` pada direktori `lib/screens` dan mengisinya dengan kode berikut:
    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventory_app_mobile/widgets/left_drawer.dart';
    import 'package:inventory_app_mobile/models/product.dart';
    import 'package:inventory_app_mobile/screens/detail_item.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class ItemsPage extends StatefulWidget {
        const ItemsPage({super.key});

        @override
        State<StatefulWidget> createState() => _ItemsPageState();
    }

    class _ItemsPageState extends State<ItemsPage> {
        Future<List<Product>> fetchProduct() async {
            var url = Uri.parse('http://127.0.0.1:8000/json/');
            var response = await http.get(
                url,
                headers: {"Content-Type": "application/json"},
            );

            // melakukan decode response menjadi bentuk json
            var data = jsonDecode(utf8.decode(response.bodyBytes));

            // Melakukan konversi data json menjadi object Product
            List<Product> listProduct = [];
            for (var d in data) {
                if (d != null) {
                    listProduct.add(Product.fromJson(d));
                }
            }
            return listProduct;
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Items',
                style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo[900],
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                    if (!snapshot.hasData) {
                        return const Column(
                        children: [
                            Text(
                            "No items.",
                            style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                            onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                                    DetailItemPage(item: snapshot.data![index]),
                                ),
                            );
                            },
                            child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Category : ${snapshot.data![index].fields.category}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Amount : ${snapshot.data![index].fields.amount}")
                                ],
                                ),
                            ),
                            ),
                        ),
                        );
                    }
                    }
                }),
            );
        }
    }
    ```
- Menambahkan halaman `item_list.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut:
    ```dart
    ...
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Show Items'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ItemsPage()),
            );
        },
    ),
    ...
    ```

- Mengubah fungsi tombol `Lihat Item` pada halaman utama agar mengarahkan ke halaman `ItemsPage` dengan menambahkan kode berikut pada `widgets/menu_card.dart`: 
    ```dart
    ...
    else (item.name == "Show Items") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ItemsPage(),
        ));
    }
    ...
    ```

#### Melakukan integrasi _form_ Flutter dengan Layanan Django
- Membuat fungsi _view_ baru pada `main/views.py` aplikasi Django dan menambahkan _path_-nya pada `main/urls.py`: `path('create-flutter/', create_product_flutter, name='create_product_flutter'),`
    ```python
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':
            
            data = json.loads(request.body)

            new_product = InventoryItem.objects.create(
                user = request.user,
                name = data["name"],
                category = data["category"],
                amount = int(data["amount"]),
                power = int(data["power"]),
                price = int(data["price"]),
                description = data["description"]
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```

- Menghubungkan halaman `item_form.dart` dengan `CookieRequest` dengan menambahkan `final request = context.watch<CookieRequest>();` pada `_ItemFormPageState` kemudian memodifikasi perintah `onPressed: ()` menjadi seperti berikut:
    ```dart
    ...
    onPressed: () async {
        if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // DONE: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
            "http://127.0.0.1:8000/create-flutter/",
            jsonEncode(<String, String>{
                'name': _name,
                'category': _category,
                'amount': _amount.toString(),
                'power': _power.toString(),
                'price': _price.toString(),
                'description': _description,
            }));
        if (response['status'] == 'success') {
            print(response['status']);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content: Text("New item has been saved!"),
            ));
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            );
        } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content: Text("ERROR, please try again!"),
            ));
        }
        }
    },
    ...
    ```
### 6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- Membuat berkas baru bernama `detail_item.dart` pada direktori `lib/screens` dan mengisinya dengan kode berikut:
    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventory_app_mobile/models/product.dart';

    class DetailItemPage extends StatelessWidget {
    final Product item;

    DetailItemPage({required this.item});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text(
            '${item.fields.name}',
            style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo[900],
            foregroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                item.fields.name,
                style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text("Category: ${item.fields.category}"),
                const SizedBox(height: 10),
                Text("Amount : ${item.fields.amount}"),
                const SizedBox(height: 10),
                Text("Power : ${item.fields.power}"),
                const SizedBox(height: 10),
                Text("Price : ${item.fields.price}"),
                const SizedBox(height: 10),
                Text("Description : ${item.fields.description}"),
            ],
            ),
        ),
        );
    }
    }
    ```

- Mengimport halaman `DetailItemPage` ke `item_list.dart` dan melakukan modifikasi pada berkas `item_list.dart` dengan menambahkan `onTap` pada setiap _item_ buku.
    ```dart
    ...
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (_, index) => InkWell(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailItemPage(item: snapshot.data![index]),
                ),
                );
            },
            child: Card(
            ...
            ),
        ),
    );
    ...
    ```
## **BONUS**
### 1. Mengimplementasikan fitur registrasi akun pada aplikasi Flutter.
- Membuat fungsi `register` pada `authentication/views.py` dan konfigurasi URL _routing_-nya.
    ```python
    @csrf_exempt
    def register(request):
        username = request.POST.get('username')
        password = request.POST.get('password')

        if User.objects.filter(username=username).exists():
            return JsonResponse({"status": False, "message": "Username sudah digunakan."}, status=400)

        user = User.objects.create_user(username=username, password=password)
        user.save()

        return JsonResponse({"username": user.username, "status": True, "message": "Register successful!"}, status=201)
    ```
- Tambahkan routing pada `authentication/urls.py`.
    ```python
    urlpatterns = [
        ...
        path('register/', register, name='register'),
    ]
    ```
- Membuat halaman register pada berkas `register.dart` di `lib/screens` yang dapat diakses dari halaman login.
    ```dart
    import 'package:inventory_app_mobile/screens/login.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
    runApp(const RegisterApp());
    }

    class RegisterApp extends StatelessWidget {
        const RegisterApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Register',
            theme: ThemeData(
                primarySwatch: Colors.indigo,
            ),
            home: const RegisterPage(),
            );
        }
    }

    class RegisterPage extends StatefulWidget {
        const RegisterPage({super.key});

        @override
        _RegisterPageState createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();
        final TextEditingController _passwordConfirmationController =
            TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Register',
                style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo[900],
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    obscureText: true,
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                    controller: _passwordConfirmationController,
                    decoration: const InputDecoration(
                        labelText: 'Password Verification',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                    onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        String passwordConfirmation =
                            _passwordConfirmationController.text;

                        if (password != passwordConfirmation) {
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                                content: Text(
                                    "Register failed, password verification incorrect.")));
                        return;
                        }
                        final response = await request.post(
                            "http://127.0.0.1:8000/auth/register/",
                            {
                            'username': username,
                            'password': password,
                            });

                        if (response['status']) {
                        String message = response['message'];

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text("$message")));
                        } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Register failed.'),
                            content: Text(response['message']),
                            actions: [
                                TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                ),
                            ],
                            ),
                        );
                        }
                    },
                    child: const Text('Register'),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                    onPressed: () {
                        // Navigate to Login
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                    },
                    child: const Text('Login'),
                    )
                ],
                ),
            ),
            );
        }
    }
    ```

    ### 2. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
    - Memodifikasi fungsi `fetchProduct()` pada `item_list.dart` menjadi menggunakan method `get()` dari _package_ `pbp_django_auth`

    ```dart
    ...
    class _ItemsPageState extends State<ItemsPage> {
        Future<List<Product>> fetchProduct(request) async {
            var data = await request.get('http://127.0.0.1:8000/get-product/');

            // Melakukan konversi data json menjadi object Product
            List<Product> listProduct = [];
            for (var d in data) {
                if (d != null) {
                    listProduct.add(Product.fromJson(d));
                }
            }
            return listProduct;
        }

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'Items',
                    style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo[900],
                    foregroundColor: Colors.white,
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchProduct(request),
                    ...
                ),
            ...
        }
    }
    ```