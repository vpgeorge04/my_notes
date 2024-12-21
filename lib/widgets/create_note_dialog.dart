import 'package:flutter/material.dart';

class CreateNoteDialog extends StatefulWidget {
  final void Function(String title, String content) onCreate;

  const CreateNoteDialog({
    super.key,
    required this.onCreate,
  });

  @override
  State<CreateNoteDialog> createState() => _CreateNoteDialogState();
}

class _CreateNoteDialogState extends State<CreateNoteDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.add, color: Colors.green),
          SizedBox(width: 8),
          Text("Create Note"),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: "Content"),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            widget.onCreate(
              _titleController.text.trim(),
              _contentController.text.trim(),
            );
            Navigator.pop(context);
          },
          child: const Text("Create"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
