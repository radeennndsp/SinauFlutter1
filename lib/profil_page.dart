import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Student> students = [
    Student(
      name: 'Raden Dewa Saktia Purnama',
      major: 'Informatika',
      id: '212221031',
      faculty: 'Matemaika dan Ilmu Komputer',
      batch: '2021',
      contact: '08777087003',
      email: 'radeennndsp@gmail.com',
      address: 'Jl. Temulawak I Desa Gentasari, Kec. Kroya, Kab. Cilacap',
      profileImage: 'assets/yoww.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Mahasiswa'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: students
                .map((student) => StudentCard(student: student))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class StudentCard extends StatefulWidget {
  final Student student;

  const StudentCard({Key? key, required this.student}) : super(key: key);

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.student.profileImage),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.student.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'NIM: ${widget.student.id}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Program Studi: ${widget.student.major}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Fakultas: ${widget.student.faculty}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Tahun Angkatan: ${widget.student.batch}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Kontak: ${widget.student.contact}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Email: ${widget.student.email}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Alamat: ${widget.student.address}',
              style: TextStyle(color: Colors.white),
            ),
            // Animasi perluasan ketika tap
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              child: isExpanded ? Column() : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final String major;
  final String id;
  final String faculty;
  final String batch;
  final String contact;
  final String email;
  final String address;
  final String profileImage;

  Student({
    required this.name,
    required this.major,
    required this.id,
    required this.faculty,
    required this.batch,
    required this.contact,
    required this.email,
    required this.address,
    required this.profileImage,
  });
}
