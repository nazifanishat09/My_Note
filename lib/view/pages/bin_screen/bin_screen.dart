import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../controller/note_controller/note_controller.dart';
import '../../widgets/note_card.dart';


class BinScreen extends StatelessWidget {
  BinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.find<NoteController>();

    return Scaffold(
      appBar: AppBar(
        title:  Text('Bin'),
      ),
      body: Obx(() {
        final deletedNotes = controller.deletedNotes;

        if (deletedNotes.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete_outline_rounded,
                  size: 70.sp,
                  color: colorScheme.primary,
                ),
                SizedBox(height: 15.h),
                Text(
                  'Bin is Empty',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Deleted notes will appear here.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: deletedNotes.length,
          itemBuilder: (context, index) {
            return NoteCard(
              note: deletedNotes[index],
              isBin: true,
            );
          },
        );
      }),
    );
  }
}