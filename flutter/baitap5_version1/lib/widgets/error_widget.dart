import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Có lỗi xảy ra',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
          Icon(
            Icons.error,
            size: 60,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
