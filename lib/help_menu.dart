import 'package:flutter/material.dart';
import 'login_page.dart';

class HelpMenu extends StatefulWidget {
  const HelpMenu({super.key});
  @override
  HelpMenuState createState() => HelpMenuState();
}

class HelpMenuState extends State<HelpMenu> {
  void _logout(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Help Center'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            _logout(context);// Tambahkan aksi yang ingin Anda lakukan saat tombol diklik
          },
        ),
      ),
      body: ListView(
        children: const [
          ExpansionTile(
            title: Text('Help Center TUGAS 4 TPM'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Bantuan bagi pengguna untuk dapat mengetahui cara kerja aplikasi dalam mengakses daftar anggota, stopwatch, daftar situs, dan fitur favorite.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara menggunakan daftar anggota?'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pada halaman Daftar Anggota, pengguna hanya dapat melihat daftar anggota dari kelompok pembuat aplikasi ini dalam sebuah tabel yang berisikan nama lengkap dan NIM.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara menggunakan stopwatch?'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pada halaman Stopwatch, pengguna dapat mengukur waktu dengan menekan tombol Start dan Stop pada layar. Pengguna juga dapat mereset waktu dengan menekan tombol Reset.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara menggunakan daftar situs?'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pada halaman Daftar Situs, pengguna dapat melihat daftar situs e-commerce yang terdaftar dalam aplikasi ini. Pengguna dapat menandai situs sebagai favorit dengan menekan tombol favorite/love pada sisi bawah setiap item pada daftar situs.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara menggunakan fitur favorite?'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Setelah menandai situs sebagai favorite pada halaman Daftar Situs, pengguna dapat melihat daftar situs yang telah ditandai sebagai favorit pada halaman Favorite dengan menekan tombol favorite/love pada sisi kanan app bar di halaman Daftar Situs.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara logout dari aplikasi?'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pengguna dapat logout dari aplikasi dengan menekan tombol logout yang ada pada halaman Main Menu ataupun Help Center',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}