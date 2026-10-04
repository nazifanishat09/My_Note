import 'package:get/get.dart';

import '../../model/note_model.dart';

class NoteController extends GetxController {
  final RxList<NoteModel> notes = <NoteModel>[].obs;

  // Search text
  final RxString searchText = ''.obs;

  // Active notes
  List<NoteModel> get activeNotes {
    final query = searchText.value.trim().toLowerCase();

    if (query.isEmpty) {
      return notes.where((note) => !note.isDeleted).toList();
    }

    return notes.where((note) {
      if (note.isDeleted) return false;

      return note.title.toLowerCase().contains(query) ||
          note.content.toLowerCase().contains(query);
    }).toList();
  }

  // Deleted notes
  List<NoteModel> get deletedNotes {
    return notes.where((note) => note.isDeleted).toList();
  }

  // Add note
  void addNote({
    required String title,
    required String content,
  }) {
    final now = DateTime.now();

    notes.add(
      NoteModel(
        id: now.microsecondsSinceEpoch.toString(),
        title: title,
        content: content,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  // Edit note
  void updateNote({
    required String id,
    required String title,
    required String content,
  }) {
    final index = notes.indexWhere((note) => note.id == id);

    if (index == -1) return;

    notes[index].title = title;
    notes[index].content = content;
    notes[index].updatedAt = DateTime.now();

    notes.refresh();
  }

  // Move note to Bin
  void moveToBin(String id) {
    final index = notes.indexWhere((note) => note.id == id);

    if (index == -1) return;

    notes[index].isDeleted = true;
    notes.refresh();
  }

  // Restore note from Bin
  void restoreNote(String id) {
    final index = notes.indexWhere((note) => note.id == id);

    if (index == -1) return;

    notes[index].isDeleted = false;
    notes.refresh();
  }

  // Permanently delete note
  void deletePermanently(String id) {
    notes.removeWhere((note) => note.id == id);
  }

  // Search
  void searchNotes(String value) {
    searchText.value = value;
  }
}