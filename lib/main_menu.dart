import 'package:flutter/material.dart';
import 'login_page.dart';
import 'member_list.dart';
import 'stopwatch_app.dart';
import 'site_list.dart';
import 'favorite.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});
  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  void _logout(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Main Menu"),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            _logout(context);// Tambahkan aksi yang ingin Anda lakukan saat tombol diklik
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberList()),
                );
              },
              child: const Text('Daftar Anggota'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StopwatchApp()),
                );
              },
              child: const Text('Stopwatch'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SiteList()),
                );
              },
              child: const Text('Daftar Situs'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorite(favorites: favoritesSite,)),
                );
              },
              child: const Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}