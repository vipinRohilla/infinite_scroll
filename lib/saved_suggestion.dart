import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SavedSuggestion extends StatefulWidget {
  var saved = <WordPair>{};
  
  SavedSuggestion({Key? key, required this.saved}) : super(key: key);

  @override
  State<SavedSuggestion> createState() => _SavedSuggestionState();
}

class _SavedSuggestionState extends State<SavedSuggestion> {
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final tiles = widget.saved.map(
          (pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );

        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
            : <Widget>[
              const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text("No Content")),
            )];
    return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestions'),
            elevation: 0,
          ),
          body: ListView(children: divided),
        );
  }
}