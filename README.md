<h1 align="center">WELCOME TO GATAL.IO !!!</h1>

Gatal.io adalah salah satu platform _e-commerce_ Indonesia untuk menjual barang-barang digital, termasuk _video game indie_, _asset game_, musik, dan banyak lagi.

# Tugas 7
### Stateless widget dan stateful widget

Stateless widget adalah widget yang tidak memiliki state internal. Artinya, data atau tampilan yang ditampilkan oleh widget ini tidak akan berubah setelah widget tersebut dibuat. Stateless widget hanya dirender satu kali, dan jika ada perubahan, widget ini harus diganti (dibuat ulang) secara langsung. Sebagai contoh: label teks, ikon, atau gambar statis yang tidak akan berubah setelah ditampilkan pertama kali.

Sedangkan stateful widget adalah widget yang memiliki state internal yang dapat berubah-ubah. Dengan kata lain, Stateful widget dapat mengalami perubahan tampilan atau data tanpa harus dibuat ulang seluruhnya. Ini cocok digunakan ketika widget perlu merespons interaksi pengguna atau perubahan data secara dinamis. Sebagai contoh: tombol yang dapat diklik untuk mengubah teks, form input, atau widget yang memiliki animasi.

### Widget apa saja yang digunakan pada proyek ini

1. MaterialApp
    Fungsi: Widget ini adalah root dari aplikasi Flutter. MaterialApp menyediakan berbagai konfigurasi, seperti title, theme, dan home. Ini juga menerapkan Material Design pada aplikasi.
2. Scaffold
    Fungsi: Scaffold menyediakan struktur dasar halaman, seperti AppBar, body, floating action button, dan lain-lain. Pada proyek ini, Scaffold digunakan untuk membuat struktur halaman dengan AppBar di atas dan konten di dalam body.
3. AppBar
    Fungsi: Widget ini menampilkan header atau toolbar di bagian atas halaman. Pada proyek ini, AppBar menampilkan judul aplikasi "GATAL.IO" dengan warna latar belakang yang diambil dari tema aplikasi.
4. Padding
    Fungsi: Widget ini menambahkan jarak (padding) di sekitar widget anaknya. Dalam proyek ini, Padding digunakan untuk memberikan ruang di sekitar konten dalam body Scaffold.
5. InfoCard (Custom Widget)
    Fungsi: Ini adalah widget custom yang dibuat untuk menampilkan informasi seperti NPM, Name, dan Class. InfoCard menampilkan judul dan konten dalam bentuk kartu.
6. Card
    Fungsi: Widget Card menyediakan tampilan kotak dengan bayangan untuk membuat elemen yang terisolasi dan terlihat menonjol. Pada proyek ini, Card digunakan di dalam InfoCard untuk membuat tampilan informasi dengan bayangan.
7. ItemCard (Custom Widget)
    Fungsi: Widget custom ini dibuat untuk menampilkan item seperti "Lihat Daftar Produk", "Tambah Produk", dan "Logout" dalam bentuk kartu dengan ikon dan teks. Setiap ItemCard memiliki warna latar belakang dan ikon yang berbeda.
8. Material
    Fungsi: Material adalah widget dasar untuk aplikasi Material Design yang menyediakan elemen seperti shadow dan elevation. Pada proyek ini, Material digunakan di dalam ItemCard untuk memberikan warna latar belakang dan tampilan yang konsisten dengan Material Design.
9. ScaffoldMessenger
    Fungsi: ScaffoldMessenger digunakan untuk menampilkan pesan Snackbar dalam Scaffold. Di proyek ini, ScaffoldMessenger dipanggil dalam InkWell untuk menampilkan pesan ketika ItemCard ditekan.
10. SnackBar
    Fungsi: SnackBar adalah widget yang menampilkan pesan sementara di bagian bawah layar. Pada proyek ini, SnackBar digunakan untuk memberikan pesan ketika pengguna menekan suatu ItemCard.
11. Icon
    Fungsi: Widget Icon menampilkan ikon dari koleksi ikon bawaan Flutter (misalnya, Icons.add, Icons.logout). Pada proyek ini, Icon digunakan di dalam ItemCard untuk menampilkan ikon untuk setiap item.
12. Text
    Fungsi: Widget Text digunakan untuk menampilkan teks. Dalam proyek ini, Text digunakan untuk menampilkan judul, konten pada InfoCard, dan nama pada ItemCard.
13. SizedBox
    Fungsi: SizedBox adalah widget yang digunakan untuk menambahkan ruang atau ukuran kosong tertentu di antara widget. Di proyek ini, SizedBox digunakan untuk memberi jarak antar elemen, seperti antara judul dan isi InfoCard.

### fungsi dari `setState()`?

`setState()` memberitahukan Flutter bahwa ada bagian dari widget yang perlu di-render ulang untuk menampilkan data terbaru. Fungsi ini menerima closure (`VoidCallback`) yang berisi perubahan pada variabel state, dan setelah closure selesai, Flutter akan otomatis merender ulang UI yang terpengaruh oleh perubahan tersebut. Hanya variabel yang berada dalam State (bukan Stateless Widget) dan digunakan dalam method `build()` yang dapat dipengaruhi oleh `setState()`. Variabel-variabel ini biasanya bersifat instance variable dalam class State widget tersebut.

### Perbedaan antara `final` dan `const`

|Aspek|final|const|
| --- | --- | --- |
|Inisialisasi|Diinisialisasi satu kali saat runtime| Diinisialisasi di compile-time|
|Mutabilitas|Tidak dapat diubah setelah inisialisasi|Benar-benar immutable dan tidak pernah berubah|
|Penggunaan|Saat nilai diperoleh di runtime|Saat nilai sudah diketahui di compile-time|
|Contoh|final now = DateTime.now();|const pi = 3.14;|
|Pengaruh Memory|Variabel final berbeda untuk setiap instance|Objek const yang sama disimpan satu kali dalam memori|

### Proses membuat sebuah program Flutter hingga memunculkan snackbar

- [x] Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
1. Siapkan flutter dan dart.
2. Buat proyek baru bernama GATAL_IO_MOBILE di suatu direktori dengan menjalankan kode berikut di terminal direktori tersebut:
    ```bash
    flutter create
    ```

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
1. Buat class ItemHomePage untuk menyimpan data dari tiap tombol:
    ```dart
    class ItemHomepage {
        final String name;
        final IconData icon;
        final MaterialColor color;

        ItemHomepage(this.name, this.icon, this.color);
    }
    ```
2. Buat class ItemCard untuk menampilkan data dari ItemHomePage menjadi sebuah tombol yang memiliki ikon dan teks:
```dart
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
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

3. Buat variabel List myHomePage yang berisikan data-data buttonnya.

4. Tampilkan button di homepage dengan cara menambahkan kode berikut di dalam class myHomePage:
```dart
// Menempatkan widget berikutnya di tengah halaman.
Center(
child: Column(
    // Menyusun teks dan grid item secara vertikal.

    children: [
    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
    const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Text(
        'Welcome to GATAL.IO',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
        ),
        ),
    ),

    // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
    GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        // Agar grid menyesuaikan tinggi kontennya.
        shrinkWrap: true,

        // Menampilkan ItemCard untuk setiap item dalam list items.
        children: items.map((ItemHomepage item) {
        return ItemCard(item);
        }).toList(),
    ),
    ],
),
),
```

- [x] Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).

Hal ini sudah dilakukan dengan menambahkan atribut pada ItemHomePage yaitu objek Material color

- [x] Memunculkan Snackbar

Dari kode berikut, snackbar sudah akan muncul ketika salah satu button ditekan.

```dart
@override
  Widget build(BuildContext context) {
    return Material(
      . . .

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
```
