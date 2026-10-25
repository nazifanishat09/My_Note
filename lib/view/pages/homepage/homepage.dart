import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:noteapp/controller/appData/appData.dart';
import 'package:noteapp/view/widgets/appber.dart';

import '../../../controller/note_controller/note_controller.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/app_search_field.dart';
import '../../widgets/empty_note_view.dart';
import '../../widgets/note_card.dart';
import '../add_note_screen/add_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();

    return Scaffold(
      appBar: CustomAppBer(),
      drawer: AppDrawer(),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            AppSearchField(onChanged: controller.searchNotes),

            SizedBox(height: 20.h),

            Expanded(
              child: Obx(() {
                final notes = controller.activeNotes;

                if (notes.isEmpty) {
                  return EmptyNoteView();
                }

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];

                    return Dismissible(
                      key: ValueKey(note.id),

                      direction: DismissDirection.endToStart,

                      background: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(Icons.delete_rounded, color: Colors.white),
                      ),

                      confirmDismiss: (_) async {
                        controller.moveToBin(note.id);

                        Get.snackbar(
                          'Moved to Bin',
                          'Note has been moved to Bin.',
                          snackPosition: SnackPosition.BOTTOM,
                        );

                        return false;
                      },

                      child: NoteCard(note: note),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => AddNoteScreen());
        },
        child: Icon(Icons.add_rounded, size: 30.sp),
      ),
    );
  }
}
