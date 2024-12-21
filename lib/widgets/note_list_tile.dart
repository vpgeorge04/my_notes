import 'package:flutter/material.dart';

class Note {
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content, required String id, required String uid, required createdAt,
  });

  String? get id => null;

  copyWith({required String id}) {}
}

class NoteListTile extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;

  const NoteListTile({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.note),
      title: Text(note.title),
      subtitle: Text(note.content),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
