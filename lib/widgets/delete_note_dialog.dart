import 'package:flutter/material.dart';

class DeleteNoteDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteNoteDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.delete, color: Colors.red),
          SizedBox(width: 8),
          Text("Delete Note"),
        ],
      ),
      content: const Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: () {
            onDelete();
            Navigator.pop(context);
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
