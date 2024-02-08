import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              strokeWidth: 15,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Loading data...',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
