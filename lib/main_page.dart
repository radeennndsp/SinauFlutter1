import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profil_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar halaman berdasarkan indeks yang dipilih
  static List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
    NewsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kartu Tanda Mahasiswa'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('assets/yoww.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Raden Dewa Saktia Purnama',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              title: Text('Beranda'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              title: Text('Profil Mahasiswa'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              title: Text('Berita Kampus'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              title: Text('Pengaturan'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // Warna ikon saat dipilih
        unselectedItemColor: Colors.grey, // Warna ikon sebelum dipilih
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan untuk menambah profil atau fitur lainnya
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Halaman Berita Kampus
class NewsPage extends StatelessWidget {
  final List<String> newsList = [
    'Pengumuman Semester Ganjil 2024 Dibuka',
    'Seminar Nasional Teknologi 2024',
    'Beasiswa Prestasi Diperpanjang Hingga Desember',
    'Informasi Praktik Kerja Lapangan Prodi Informatika',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.newspaper),
            title: Text(newsList[index]),
          ),
        );
      },
    );
  }
}

// Halaman Pengaturan
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pengaturan Aplikasi',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
