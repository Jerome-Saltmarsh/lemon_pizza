
import 'dart:convert';
import 'dart:math';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode('');

  (String, {DateTime modified}) get metadata {           // Add from here...
    const title = 'My Document';
    final now = DateTime.now();

    final val = switch(Random().nextInt(3)) {
      0 => "jim",
      1 => "james",
      2 => 'sam',
      _ => 'unknown'
    };


    return (title, modified: now);
  }

  void todo(Document document) {
    final dateModified = document.metadata.modified;
    final title1 = document.metadata.$1;
    final (title, modified: modified) = document.metadata;   // Modify
    print(title);
  }// to here.
}