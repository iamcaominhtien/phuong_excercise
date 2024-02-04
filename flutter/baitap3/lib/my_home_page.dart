import 'package:baitap3/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import 'calendar_page.dart';
import 'contacts_page.dart';
import 'inbox_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bai tap 3',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            )
          ],
          iconTheme: const IconThemeData(
            color: Colors.white
          ),
          backgroundColor: Colors.blue,
        ),
        drawer: const MyDrawer(),
        body: whatPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          //Khi bấm vào item nào, index tương ứng sẽ được truyền vào đây
          setState(() {
            currentIndex = index;
          });

          //vậy làm sao để cập nhật cái trang. Rất đơn giản, dựa vào cái current index là xong.
          //Có thể sử dụng if-else để làm vụ này.
        },
        items: const [
          //Theo thứ tự từ trên xuống, index lần lượt là:

          //index: 0
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),

          //index: 1
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: "Contacts"),

          //index: 2
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
        ],
      ),
    );
  }

  //giờ mình sẽ tạo một hàm để quyết định xem nên hiển thị page nào
  //khi currentIndex được cập nhật 😁😁😁.
  //Lưu ý là hàm này trả về một cái Widget nha
  Widget whatPage() {
    switch (currentIndex) {
      case 0:
        return const InboxPage();
      case 1:
        return const ContactsPage();
      default:
        return const CalendarPage();
    }
  }
}
