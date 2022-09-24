import 'package:flutter/material.dart';
import 'package:note_app/models/note_operation.dart';

import 'package:provider/provider.dart';
import '../models/note.dart';
import '../models/notes.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final String id;
  NoteCard(this.note, this.id);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<NoteOperation>(context, listen: false).removeNote(id);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 3, 15, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                note.title.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Container(
                child: Text(
                  note.description,
                  overflow: TextOverflow.fade,
                  // maxLines: 1,
                  // softWrap: false,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
