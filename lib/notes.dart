import 'package:flutter/material.dart';

class Note extends ChangeNotifier {
  String text = "";
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> notes = ['Note 1', 'Note 2', 'Note 3'];

  void _addNewNote() {
    setState(() {
      notes.add('New Note');
    });
  }

  void _viewOrEditNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailPage(
          note: notes[index],
          index: index,
          onSave: _updateNote,
        ),
      ),
    );
  }

  void _updateNote(String newNote, int index) {
    setState(() {
      notes[index] = newNote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Notes'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: _addNewNote,
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(Icons.add, size: 32),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _viewOrEditNote(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(notes[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NoteDetailPage extends StatefulWidget {
  final String note;
  final int index;
  final Function(String, int) onSave;

  const NoteDetailPage(
      {super.key,
      required this.note,
      required this.index,
      required this.onSave});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              widget.onSave(_controller.text, widget.index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Enter note content...',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
