import 'package:flutter/material.dart';
import 'package:personal_profile/profile_page.dart' as baitap_2;
import 'package:baitap3/my_home_page.dart' as baitap_3;
import 'package:baitap4/profile_page.dart' as baitap_4;
import 'package:baitap5_version1/profile_pref_set_state_page.dart' as baitap_5_ver1;

void main() {
  runApp(const AllProjects());
}

class AllProjects extends StatelessWidget {
  const AllProjects({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Phương excercises',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildNavigatorButton('Bài tập 2', const baitap_2.ProfilePage()),
            buildNavigatorButton('Bài tập 3', const baitap_3.MyHomePage()),
            buildNavigatorButton('Bài tập 4', const baitap_4.ProfilePage()),
            buildNavigatorButton('Bài tập 5 - version 1',
                const baitap_5_ver1.ProfilePreferenceSetStatePage()),
          ],
        ),
      ),
    );
  }

  Widget buildNavigatorButton(String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
