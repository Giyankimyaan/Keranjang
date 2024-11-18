import 'dart:io';

void main() {
  const String kategoriLukisan = "Lukisan";
  const String kategoriPatung = "Patung";
  const String kategoriFosil = "Fosil";

  final produk1 = {
    'nama': 'Monalisa',
    'harga': 2500000,
    'kategori': kategoriLukisan,
    'kode': 'L_Lukisan'
  };

  final produk2 = {
    'nama': 'Colombus',
    'harga': 500000,
    'kategori': kategoriPatung,
    'kode': 'P_Patung'
  };

  final produk3 = {
    'nama': 'T-rex',
    'harga': 400000,
    'kategori': kategoriFosil,
    'kode': 'F_Fosil'
  };

  final daftarProduk = [produk1, produk2, produk3];

  print("Informasi Produk:");
  print("-------------------");
  for (var i = 0; i < daftarProduk.length; i++) {
    final produk = daftarProduk[i];
    print("${i + 1}. Nama: ${produk['nama']}");
    print("Harga: ${produk['harga']}");
    print("Kategori: ${produk['kategori']}");
    print("Kode Produk: ${produk['kode']}\n");
  }

  List<int> pilihanProduk = [];
  int totalHarga = 0;

  while (true) {
    stdout.write(
        "Masukkan nomor produk yang ingin Anda beli (0 untuk selesai): ");
    final input = stdin.readLineSync();
    if (input == null || input.isEmpty) continue;

    final pilihan = int.tryParse(input);
    if (pilihan == null || pilihan < 0 || pilihan > daftarProduk.length) {
      print("Nomor tidak valid. Coba lagi.");
      continue;
    }

    if (pilihan == 0) break;

    pilihanProduk.add(pilihan - 1);
    totalHarga += daftarProduk[pilihan - 1]['harga'] as int;
    print(
        "Produk '${daftarProduk[pilihan - 1]['nama']}' ditambahkan ke keranjang.\n");
  }

  print("Produk yang Anda pilih:");
  print("-------------------------");
  if (pilihanProduk.isEmpty) {
    print("Anda tidak memilih produk apa pun.");
  } else {
    for (var i in pilihanProduk) {
      final produk = daftarProduk[i];
      print("Nama: ${produk['nama']} - Harga: ${produk['harga']}");
    }
    print("-------------------------");
    print("Total Harga: $totalHarga");
  }
}
