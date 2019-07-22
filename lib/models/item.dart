import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;
  final bool completed;

  Item({@required this.id, @required this.body, this.completed = false});

  Item copyWith({int id, String body, bool completed}) {
    return Item(id: id ?? this.id, body: body ?? this.body, completed: completed ?? this.completed);
  }

  Item.fromJson(Map json)
      : body = json['body'],
        id = json['id'],
        completed = json['completed'];

  Map toJson() => {'id': id, 'body': body, 'completed': completed};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Item &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return toJson().toString();
  }
}