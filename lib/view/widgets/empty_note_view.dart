import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class EmptyNoteView extends StatelessWidget {
  const EmptyNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.note_alt_outlined,
          size: 70.sp,
          color: colorScheme.primary,
        ),

        SizedBox(height: 15.h),

        Text(
          'No notes yet',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          'Create your first note to get started.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}