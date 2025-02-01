import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0), // Margin of Container.
        padding: const EdgeInsets.all(5.0), // Padding of Container.
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text('Note Tilte'),
              subtitle: Text('This is the note subtitle by Ahmed 2025'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ),
            Text('data : 31/01/2025'),
          ],
        ));
  }
}
