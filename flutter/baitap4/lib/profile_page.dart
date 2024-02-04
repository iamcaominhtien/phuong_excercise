import 'package:flutter/material.dart';
import 'package:personal_profile/profile.dart';
import 'package:personal_profile/profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = Profile(
        hoTen: 'Cao Minh Tien',
        imageAssest: 'assets/pic2.jpg',
        ngaySinh: DateTime(2001, 5, 19),
        queQuan: 'Nha Trang',
        soThich: 'Anime');
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: Image.asset(profile.imageAssest),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Họ và tên',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                profile.hoTen,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 15),
              const Text('Ngày sinh', style: TextStyle(fontSize: 17)),
              Text(
                '${profile.ngaySinh.day}/${profile.ngaySinh.month}/${profile.ngaySinh.year}',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 15),
              const Text('Quê quán', style: TextStyle(fontSize: 17)),
              Text(profile.queQuan, style: const TextStyle(fontSize: 17)),
              const SizedBox(height: 15),
              const Text('Sở thích', style: TextStyle(fontSize: 17)),
              Text(profile.soThich, style: const TextStyle(fontSize: 17)),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: editProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFe0e0e0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Chỉnh sửa",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editProfile() async {
    //bên này sẽ nhận cái newProfile đó
    Profile newProfile = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileEditPage(
          profileEdit: profile,
        ),
      ),
    );
    setState(() {
      profile = newProfile;
    });
  }
}
