import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 // Import FirebaseAuth for navigation after logout
import 'package:my_notes/pages/login.dart';
import 'package:my_notes/widgets/note_list_tile.dart' as tile_note; // Add alias
import 'package:my_notes/widgets/create_note_dialog.dart';
import 'package:my_notes/widgets/delete_note_dialog.dart';
import 'package:my_notes/widgets/note_list_tile.dart'; // Use the original import for NoteListTile
// Import your authentication file

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<tile_note.Note> notes = []; // Use the alias here for Note

  void _addNote(String title, String content) {
    setState(() {
      notes.add(tile_note.Note(
          title: title,
          content: content,
          id: '',
          uid: '',
          createdAt: null)); // Use the alias for Note
    });
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut(); // Firebase sign out
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => LoginPage()), // Navigate to login page
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed:
                _logout, // Call the logout function when the button is pressed
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteListTile(
            note: notes[index],
            onDelete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteNoteDialog(
                    onDelete: () => _deleteNote(index),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CreateNoteDialog(
                onCreate: _addNote,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
