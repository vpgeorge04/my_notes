import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  final TextEditingController contentController = TextEditingController();

  NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Note Content',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                // Handle saving the note
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
