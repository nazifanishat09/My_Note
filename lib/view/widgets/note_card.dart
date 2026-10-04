import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../controller/note_controller/note_controller.dart';
import '../../model/note_model.dart';
import '../pages/edit_note_screen/edit_note_screen.dart';



class NoteCard extends StatelessWidget {
  final NoteModel note;
  final bool isBin;

  const NoteCard({
    super.key,
    required this.note,
    this.isBin = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.find<NoteController>();

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: GestureDetector(
        // Bin-এর note long press
        onLongPress: isBin
            ? () {
          _showBinOptions(context, controller);
        }
            : null,

        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),

          // Normal note tap করলে Edit
          onTap: isBin
              ? null
              : () {
            Get.to(
                  () => EditNoteScreen(note: note),
            );
          },

          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title.isEmpty ? 'Untitled Note' : note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  note.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  _formatDate(note.updatedAt),
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBinOptions(
      BuildContext context,
      NoteController controller,
      ) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.restore_rounded),
                title: const Text('Restore'),
                onTap: () {
                  controller.restoreNote(note.id);
                  Get.back();
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
                title: const Text('Delete'),
                onTap: () {
                  Get.back();

                  _confirmPermanentDelete(
                    context,
                    controller,
                  );
                },
              ),

              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  void _confirmPermanentDelete(
      BuildContext context,
      NoteController controller,
      ) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Note?'),
        content: const Text(
          'This note will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.deletePermanently(note.id);
              Get.back();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}