import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: Image.asset('assets/pic2.jpg'),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Họ và tên',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Cao Minh Tiến',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 15),
            const Text('Ngày sinh', style: TextStyle(fontSize: 17)),
            const Text('19/05/2001', style: TextStyle(fontSize: 17)),
            const SizedBox(height: 15),
            const Text('Quê quán', style: TextStyle(fontSize: 17)),
            const Text('Nha Trang', style: TextStyle(fontSize: 17)),
            const SizedBox(height: 15),
            const Text('Sở thích', style: TextStyle(fontSize: 17)),
            const Text('Ca nhạc', style: TextStyle(fontSize: 17))
          ],
        ),
      ),
    );
  }
}
