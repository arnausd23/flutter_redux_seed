import 'package:flutter_redux_seed/models/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Item item;
  Map sampleData;

  setUp(() {
    sampleData = {'id': 0, 'body': 'Some text'};
    item = Item(id: 0, body: 'Some text');
  });

  tearDown(() {
    item = null;
    sampleData = null;
  });

  group('Item', () {
    test('Should return the item id and body', () {
      expect(item.id, 0);
      expect(item.body, 'Some text');
    });
    test('Should return a copy', () {
      Item itemCopy = item.copyWith( body: 'Some text 2');
      expect(itemCopy.id, 0);
      expect(itemCopy.body, 'Some text 2');
    });
    test('Should create from json', () {
      Item newItem = Item.fromJson(sampleData);
      expect(newItem.id, sampleData['id']);
      expect(newItem.body, sampleData['body']);
    });
    test('Should map to json', () {
      Item newItem = Item.fromJson(sampleData);
      expect(newItem.toJson(), sampleData..addAll({'completed': null}));
    });
  });
}
