import 'package:flutter/material.dart';

class Archived_Tasks_Screen extends StatelessWidget {
  const Archived_Tasks_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            'Archived Tasks',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

        )
    );
  }
}
