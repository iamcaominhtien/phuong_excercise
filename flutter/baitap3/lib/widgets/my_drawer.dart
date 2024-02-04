import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Thu Phuong',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text('thuphuong@email.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('P'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.inbox),
            title: const Text(
              'Inbox',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFbbdefa),
                borderRadius: BorderRadius.circular(30),
              ),
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              child: const Text(
                '11',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.edit_calendar_rounded),
            title: Text(
              'Draft',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.archive),
            title: Text(
              'Archive',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.send),
            title: Text(
              'Sent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text(
              'Trash',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const Spacer(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}