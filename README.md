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

# Tugas 8
### Penggunaan `const` pada Flutter
Di Flutter, kata kunci `const` digunakan untuk mendefinisikan widget atau nilai konstan yang tidak akan berubah selama runtime. Penggunaan `const` memungkinkan Flutter untuk mengenali objek sebagai "konstan" sejak awal, yang berarti hanya perlu diinisialisasi satu kali dan dapat digunakan kembali tanpa perlu di-render ulang. Hal ini sangat efisien dalam hal memori dan performa, karena Flutter tidak perlu membuat ulang objek `const` yang sama berkali-kali ketika membangun ulang tampilan.

Menggunakan `const` dapat menghemat memori aplikasi karena Flutter akan menggunakan satu instance dari objek `const` di seluruh aplikasi jika properti dan nilai objek tersebut sama. Ini terutama berguna pada widget yang bersifat statis atau tidak dipengaruhi oleh variabel dinamis, seperti ikon atau label teks yang tidak berubah. Penggunaan `const` juga memudahkan proses debug dan meningkatkan performa, karena Flutter dapat melewati proses rebuild pada widget statis.

Namun, `const` sebaiknya tidak digunakan pada widget atau objek yang nilai atau tampilannya berubah-ubah selama runtime, seperti elemen yang bergantung pada data atau state yang dinamis. Contohnya, widget yang dipengaruhi oleh hasil input pengguna atau variabel yang bisa berubah seiring waktu tidak cocok menggunakan `const` karena membutuhkan rebuild saat ada perubahan.

### Penggunaan `Column` dan `Row` pada Flutter
Di Flutter, `Column` dan `Row` adalah widget yang digunakan untuk mengatur tata letak (layout) widget anaknya. Keduanya memiliki fungsi dasar yang sama, yaitu menata widget anak, tetapi `Column` menata widget secara vertikal, sedangkan `Row` menata widget secara horizontal. Penggunaan `Column` dan `Row` sangat penting untuk membangun antarmuka pengguna yang responsif dan rapi.

Contoh penggunaan `Column` dan `Row` pada kode GATAL.IO yaitu:
```dart
...
    // Kode ini akan menampilkan card yang disusun secara horizontal.
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            InfoCard(title: 'NPM', content: npm),
            InfoCard(title: 'Name', content: name),
            InfoCard(title: 'Class', content: className),
        ],
    ),
...
    // Menyusun ikon dan teks di tengah kartu secara vertikal.
    Column(
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
```

### Elemen Input pada Halaman Form
Pada tugas ini saya hanya menggunakan `TextFormField` untuk elemen inputnya. Elemen input ini digunakan untuk menerima teks dari pengguna. Di halaman form saya, TextFormField digunakan untuk berbagai tujuan, seperti memasukkan nama game, jumlah (amount), deskripsi, dan harga (price).

Selain elemen tersebut terdapat beberapa elemen lain, seperti:
1. Checkbox

    Checkbox adalah elemen input yang memungkinkan pengguna untuk memilih opsi biner (ya atau tidak).
2. Radio Button

    Radio button memungkinkan pengguna memilih satu opsi dari beberapa pilihan yang disediakan.
3. Switch

    Switch adalah elemen input untuk pilihan biner, mirip dengan checkbox tetapi dalam bentuk sakelar yang lebih modern.
4. Slider

    Slider memungkinkan pengguna memilih nilai dalam rentang tertentu dengan menggeser tombol.
5. Dropdown Button

    Dropdown button memungkinkan pengguna memilih satu opsi dari daftar opsi yang bisa dibuka-tutup.

### Tema pada Aplikasi GATAL.IO
Pada aplikasi GATAL.IO saya mengimplementasikan tema terutama pada warna-warna yang ada pada aplikasi tersebut. Di sini saya mengubah warna primary untuk aplikasi ini menjadi hijau dengan cara menambahkan kode berikut di file `main.dart`. Kode berikut akan otomatis menyimpan warna hijau sebagai warna primary dari aplikasi ini.
```dart
...
colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: Colors.green[400]),
...
```

### Navigasi Halaman pada Flutter
Untuk melakukan navigasi atau perpindahan halaman pada aplikasi ini saya menerapkan Navigator pada button-button yang ada untuk memindahkan halamannya. Terdapat dua jenis Navigator yang saya gunakan, yaitu Navigator.pushReplacement yang benar-benar mengganti halaman current sekarang dan Navigator.push yang mengganti halaman current, tetapi masih menyimpan halaman sebelumnya dan bisa kembali dengan menekan button arrow yang terletak di kiri atas aplikasi. Contoh kodenya adalah:
```dart
...
Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => MyHomePage(),
));
...
Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => GameEntryFormPage(),
));
...
```

# Tugas 9

### Model untuk Melakukan Pengambilan ataupun Pengiriman Data JSON
Membuat model untuk pengambilan dan pengiriman data JSON sangat penting karena model memberikan struktur yang jelas untuk data yang diharapkan, memastikan konsistensi dan validasi data. Dengan model, data JSON dapat diubah menjadi objek yang lebih mudah dikelola dan dimanipulasi, serta memudahkan pengembang mengakses atribut data tanpa khawatir terjadi kesalahan. Jika tidak menggunakan model, pengolahan data JSON cenderung raw atau langsung, yang membuat kode sulit dibaca, rentan terhadap error seperti `KeyError` atau `NullPointerException`, dan kurang terjamin terhadap perubahan struktur data dari API. Selain itu, tidak adanya model dapat menyulitkan proses debugging dan pengembangan aplikasi yang lebih kompleks. Oleh karena itu, model berperan penting dalam menjaga keamanan, efisiensi, dan skalabilitas pengelolaan data JSON.

### Fungsi dari Library _http_
Library `http` pada Dart adalah pustaka yang digunakan untuk melakukan komunikasi HTTP, seperti mengirim permintaan `GET`, `POST`, `PUT`, atau `DELETE` ke server dan menerima respons dari API. Library ini memungkinkan aplikasi Dart atau Flutter untuk mengakses dan mengelola data dari server dengan menambahkan header, body, dan mendukung respons dalam format JSON, string, atau binary. Pada tugas ini, library ini digunakan untuk menghubungkan flutter ke projek Django yang saya sudah buat, baik itu untuk mengambil produk, menambahkan produk, ataupun autentikasi.

### Mekanisme Pengiriman Data
Pengiriman data dimulai dari input data pengguna pada formulir yang telah disediakan di aplikasi Flutter. Pengguna memasukkan data seperti nama, deskripsi, genre, dan harga game ke dalam field yang disertai validasi untuk memastikan data yang dimasukkan sesuai dengan format yang diharapkan. Setelah semua data valid, tombol "Save" akan mengirimkan data tersebut dalam format JSON ke endpoint server Django menggunakan metode `postJson`. Server Django menerima data, memprosesnya, dan menyimpannya ke basis data. Setelah penyimpanan berhasil, server mengirimkan respons berupa status yang menunjukkan keberhasilan atau kegagalan. Aplikasi Flutter kemudian memproses respons tersebut; jika berhasil, data akan ditampilkan pada halaman daftar item melalui metode `FutureBuilder` yang memuat data dari server menggunakan metode HTTP `GET`. Proses ini memastikan bahwa data yang dimasukkan pengguna dapat tersimpan dengan baik dan langsung ditampilkan kembali di aplikasi secara dinamis.

### Mekanisme Autentikasi dari Login, Register, hingga Logout
Mekanisme autentikasi dimulai dari proses **registrasi**, di mana pengguna memasukkan username, password, dan konfirmasi password pada Flutter. Data tersebut dikirim ke endpoint `/auth/register/` Django melalui metode POST menggunakan `CookieRequest`. Django memvalidasi kesesuaian password dan ketersediaan username, kemudian membuat akun baru jika valid, lalu mengembalikan respons keberhasilan. Untuk **login**, pengguna memasukkan username dan password pada Flutter, yang kemudian dikirim ke endpoint `/auth/login/`. Django memverifikasi kredensial dengan fungsi `authenticate()`. Jika valid dan akun aktif, sesi pengguna dibuat dengan `auth_login()`, dan respons login sukses dikirim kembali ke Flutter. Jika gagal, Django mengembalikan pesan kesalahan. Pada Flutter, respons login sukses diarahkan ke halaman utama aplikasi, menampilkan menu pengguna. Proses **logout** dilakukan dengan memanggil endpoint `/auth/logout/`. Django memproses logout dengan `auth_logout()` untuk menghapus sesi pengguna, mengembalikan respons keberhasilan ke Flutter, dan pengguna diarahkan keluar dari aplikasi.

### Proses Implementasi Fitur Registrasi hingga Melakukan Filter pada Tampilan Produk Game

- [x] Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
1. Buat app baru pada Django dengan nama authentication yang berguna untuk autentikasi user.
2. Buat function pada app tersebut yang berguna untuk register dengan membuat kode berikut di views.py:
    ```python
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
    ```
3. Buat halaman [register](https://github.com/viscasa/gatal.io-mobile/blob/main/lib/screens/register.dart) pada app flutter.

- [x] Buat function pada proyek Django yang berguna untuk login dengan membuat kode berikut di views.py:
    ```python
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
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
    ```
2. Buat halaman [login](https://github.com/viscasa/gatal.io-mobile/blob/main/lib/screens/login.dart) pada app flutter.

- [x]  Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Dengan menjalankan 2 step sebelumnya, flutter sudah terintegrasikan dengan proyek Django yang saya buat sebelumnya.

- [x] Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Buat file baru pada direktori lib/models dengan nama product.dart yang akan digunakan sebagaim kode modelnya.
2. Buka endpoint JSON yang telah dibuat pada proyek Django
3. Salinlah data JSON dan buka situs web [Quicktype](http://app.quicktype.io/).
4. Ambil kode yang telah dibuat pada Quicktype dan taruh di file yang sudah kita buat sbelumnya.
5. Models untuk Flutter telah terbuat.

- [x]  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. Buat sebuah file dart baru bernama list_product.dart pada direktori lib/screens/
2. Isi filenya dengan [kode berikut](https://github.com/viscasa/gatal.io-mobile/blob/main/lib/screens/list_product.dart)
3. Flutter akan menampilkan nama produk-produk yang sudah Anda buat sebelumnya.

- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
1. Buat sebuah file dart baru bernama detail_product.dart pada direktori lib/screens/
2. Isi filenya dengan [kode berikut](https://github.com/viscasa/gatal.io-mobile/blob/main/lib/screens/detail_product.dart)
3. Flutter akan menampilak detail produk setelah Anda menekan salah satu produk di daftar produk.

- [x]  Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
1. Kode pada list_product.dart sudah terfilter dengan pengguna yang login karena kode berikut akan meminta Cookie ke web pada proyek Django yang di mana pada proyek Django sudah diimplementasikan filter product untuk usernya.
    ```dart
    class _ProductPageState extends State<ProductPage> {
    Future<List<Product>> fetchMood(CookieRequest request) async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.get('http://127.0.0.1:8000/json/');
        
        // Melakukan decode response menjadi bentuk json
        var data = response;
        
        // Melakukan konversi data json menjadi object Product
        List<Product> listMood = [];
        for (var d in data) {
        if (d != null) {
            listMood.add(Product.fromJson(d));
        }
        }
        return listMood;
    }
    ...
    }
    ```