import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty_widget/empty_widget.dart';
import '../models/note_operation.dart';
import '../models/note.dart';
import '../screen/add_screen.dart';
import '../widgets/search_bar.dart';
import '../widgets/notecard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<NoteOperation>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            child: Text(
              'Notes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SearchBar(),
          value.getnote.isEmpty
              ? EmptyWidget(
                  packageImage: PackageImage.Image_1,
                  title: 'we are sorry',
                  subTitle: 'no item added',
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: value.getnote.length,
                      itemBuilder: ((context, index) => NoteCard(
                          value.getnote.values.toList()[index],
                          value.getnote.keys.toList()[index]))),
                ),
        ],
      ),
    );
  }
}
