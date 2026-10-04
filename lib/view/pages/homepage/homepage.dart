import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {},

          child: Text(
            'Get Started',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}