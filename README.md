## TUGAS 7

**Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**  
Widget tree pada Flutter adalah struktur hierarkis yang menggambarkan hubungan antar-widget dalam aplikasi Flutter. Setiap widget dalam Flutter dapat memiliki satu atau lebih widget anak (child widgets) dan dapat juga menjadi anak dari widget lain (parent widget). Hubungan parent-child ini memungkinkan pengaturan tata letak, gaya, dan perilaku antar widget. Misalnya, sebuah widget Column dapat menjadi parent dari beberapa widget Text atau Button, yang merupakan anak-anaknya. Parent widget bertanggung jawab untuk mengatur posisi dan ukuran anak-anaknya, sementara anak-anak dapat mewarisi properti dari parent mereka, seperti tema atau gaya.

**Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**  
Widget di main.dart
1. **MaterialApp** -> widget utama untuk aplikasi berbasis Material Design, mengatur tema, judul, dan halaman awal.
2. **MyApp** -> widget root aplikasi yang membungkus MaterialApp.
3. **MyHomePage** -> halaman utama aplikasi yang ditampilkan sebagai home pada MaterialApp.

Widget di menu.dart
1. **Scaffold** -> struktur dasar halaman yang menyediakan AppBar, body, dan layout utama.
2. **AppBar** -> bar di bagian atas aplikasi yang menampilkan judul "Footballed Co.".
3. **Padding** -> memberikan jarak di sekeliling konten halaman agar tampilan lebih rapi.
4. **Column** -> menyusun widget secara vertikal dari atas ke bawah.
5. **SizedBox** -> memberikan jarak vertikal antar widget.
6. **Center** -> memusatkan widget anak di tengah parent-nya.
7. **Text** -> menampilkan teks seperti judul atau label tombol.
8. **GridView.count** -> menyusun widget dalam bentuk grid dengan tiga kolom untuk menampilkan tiga tombol produk.
9. **ItemCard** -> widget kustom untuk menampilkan satu tombol produk yang berisi ikon, teks, warna, dan aksi.
10. **Material** -> memberikan efek Material Design seperti warna, elevation, dan border radius pada tombol produk.
11. **InkWell** -> membuat area yang dapat ditekan dan menampilkan efek sentuhan (ripple effect).
12. **Container** -> membungkus dan mengatur padding serta layout widget di dalamnya.
13. **Column (di dalam ItemCard)** -> menyusun ikon dan teks secara vertikal di dalam tombol produk.
14. **Icon** -> menampilkan ikon pada tombol produk.
15. **Padding (di dalam ItemCard)** -> memberikan jarak antara ikon dan teks pada tombol produk.

Fungsi utama widget
* **MaterialApp** -> mengatur tema aplikasi, judul, dan halaman utama.
* **Scaffold** -> menyediakan struktur dasar halaman seperti AppBar dan body.
* **AppBar** -> menampilkan judul aplikasi di bagian atas layar.
* **GridView.count** -> menampilkan tiga tombol produk dalam tata letak grid.
* **ItemCard** -> membuat tombol produk dengan ikon, teks, warna, dan aksi Snackbar sesuai kebutuhan.
* **InkWell** -> menangani aksi tap serta memberikan efek visual saat tombol ditekan.
* **Icon** dan **Text** -> menampilkan ikon dan label pada setiap tombol produk.

**Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**  
Widget MaterialApp adalah wadah utama untuk aplikasi Flutter yang memakai desain Material. Widget ini menyediakan fitur penting seperti pengaturan tema, navigasi antar halaman, dan pengaturan bahasa (lokalitas). Biasanya, MaterialApp dipakai sebagai widget utama (root) karena mengatur banyak hal dasar dalam aplikasi, termasuk tampilan visual dan perilaku standar sesuai pedoman Material Design. Dengan menjadikan MaterialApp sebagai root, developer bisa lebih mudah mengatur tampilan dan fungsi aplikasi secara keseluruhan.

**Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**  
StatelessWidget dan StatefulWidget adalah dua jenis widget utama di Flutter yang dipakai untuk membuat tampilan aplikasi.

* **StatelessWidget** -> widget yang tampilannya tidak berubah selama aplikasi jalan. Setelah dibuat, tampilannya bakal tetap sama kecuali di-rebuild oleh parent-nya. Biasanya kita pakai ini buat elemen UI yang statis, seperti teks, ikon, atau gambar.

* **StatefulWidget** -> widget yang bisa berubah seiring waktu karena punya state. Dengan widget ini, kita bisa membuat tampilan yang merespons interaksi pengguna atau perubahan data. StatefulWidget terdiri dari dua bagian, yaitu kelas StatefulWidget itu sendiri dan kelas State yang menyimpan logika dan datanya. Contohnya, kita bisa pakai ini untuk formulir input, tombol yang bisa berubah warna, atau daftar yang bisa diperbarui.

Jadi, kita pakai StatelessWidget kalau tampilannya tetap dan tidak butuh perubahan, sedangkan StatefulWidget dipakai kalau tampilan perlu berubah sesuai interaksi atau data yang berubah.

**Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**  
BuildContext adalah objek yang digunakan Flutter untuk mengetahui posisi sebuah widget di dalam widget tree. Objek ini memberikan akses ke berbagai informasi tentang lingkungan tempat widget berada, seperti tema, ukuran layar, atau widget parent-nya.

BuildContext penting karena digunakan untuk menghubungkan widget dengan struktur aplikasi secara keseluruhan. Melalui BuildContext, kita bisa memanggil widget lain yang berada di atasnya dalam hierarki, seperti menggunakan `Theme.of(context)` untuk mengambil tema, atau `Navigator.of(context)` untuk berpindah halaman.

Dalam metode build(), BuildContext digunakan sebagai parameter agar widget dapat membangun tampilan berdasarkan konteksnya di widget tree. Misalnya, ketika metode build dijalankan, Flutter akan memberikan context yang sesuai sehingga widget dapat menampilkan tampilan yang benar sesuai posisi dan lingkungannya dalam aplikasi.

**Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**  
Hot reload adalah fitur di Flutter yang memungkinkan developer melihat perubahan kode secara langsung tanpa harus menjalankan ulang seluruh aplikasi. Saat kita melakukan hot reload, Flutter hanya memperbarui bagian kode yang berubah dan mempertahankan state aplikasi saat ini. Fitur ini sangat berguna untuk mempercepat proses pengembangan, terutama ketika kita ingin menyesuaikan tampilan atau memperbaiki logika kecil tanpa kehilangan data yang sedang berjalan.

Sementara itu, hot restart juga memuat ulang aplikasi, tetapi berbeda dengan hot reload karena ia menghapus seluruh state aplikasi dan memulai ulang dari awal. Semua variabel, data, atau kondisi sementara yang tersimpan akan hilang.

## TUGAS 8

**Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?**  
`Navigator.push()` menambahkan halaman baru ke atas stack navigasi sehingga pengguna bisa kembali ke halaman sebelumnya dengan tombol back. Contohnya, saat menekan tombol "Create Product" di halaman utama, aplikasi menggunakan `Navigator.push()` agar user bisa kembali ke halaman utama setelah selesai mengisi form.

`Navigator.pushReplacement()` mengganti halaman saat ini dengan halaman baru sehingga halaman sebelumnya dihapus dari stack dan tidak bisa kembali dengan tombol back. Pada aplikasi Football Shop, ini digunakan pada navigasi drawer (misal: Home, All Products, My Products) agar saat berpindah halaman, user tidak bisa kembali ke halaman sebelumnya dengan tombol back, sehingga navigasi lebih konsisten dan tidak menumpuk banyak halaman di stack.

**Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?**  
Setiap halaman utama di aplikasi Football Shop menggunakan `Scaffold` sebagai struktur dasar, yang menyediakan slot untuk `AppBar` di bagian atas dan `Drawer` di samping kiri. Dengan cara ini, semua halaman memiliki tampilan dan navigasi yang konsisten. `AppBar` digunakan untuk menampilkan judul aplikasi atau halaman, sedangkan `Drawer` berisi menu navigasi ke halaman utama, daftar produk, produk saya, dan form tambah produk. Hierarki ini memastikan user experience yang seragam di seluruh aplikasi.

**Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.**  
* `Padding` digunakan untuk memberi jarak antar elemen agar tampilan lebih rapi dan tidak saling menempel. Contohnya, setiap field pada form tambah produk dibungkus dengan `Padding` agar mudah dibaca dan diisi.  
* `SingleChildScrollView` memungkinkan seluruh form di-scroll jika konten melebihi tinggi layar, sehingga user tetap bisa mengakses semua field meski layar kecil atau form panjang.  
* `ListView` cocok untuk menampilkan daftar data yang dinamis dan panjang, misal daftar produk atau drawer menu yang bisa di-scroll.

Contohnya, pada halaman tambah produk, `SingleChildScrollView` membungkus seluruh form sehingga user bisa scroll ke bawah untuk mengisi semua field tanpa kehilangan akses ke bagian atas form. Selain itu, `Padding` digunakan di sekitar setiap `TextFormField` untuk memberikan jarak yang nyaman.

`ListView` digunakan di drawer untuk menampilkan menu navigasi yang bisa di-scroll jika ada banyak item.

**Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?**  
Untuk memastikan identitas visual Football Shop konsisten dengan brand toko, saya melakukan penyesuaian warna tema aplikasi dengan cara berikut:

1. **Mengatur warna utama (primarySwatch) menjadi hijau** di `main.dart` menggunakan `ThemeData`:
	- `colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)`
	- AppBar, tombol, dan elemen utama menggunakan warna hijau agar sesuai dengan warna khas Football Shop
2. **Menyesuaikan warna pada komponen UI**:
	- Drawer header diberi background hijau, body drawer putih
	- Icon dan teks pada navigasi drawer dan tombol produk diatur menjadi hijau
3. **Menggunakan Theme.of(context) untuk konsistensi**:
	- Semua widget yang mendukung tema mengambil warna dari `Theme.of(context)` agar perubahan tema otomatis diterapkan ke seluruh aplikasi.