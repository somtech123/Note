import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note.dart';

class Notes {
  List<Note> _list = [];

  List<Note> get getlist {
    return [..._list];
  }

  Note findById(String id) {
    return _list.firstWhere((element) => element.id == id);
  }
}
