import 'package:flutter_redux_seed/domain/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Item item;

  setUp(() {
    item = Item(id: 0, body: 'Some text');
  });

  tearDown(() {
    item = null;
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
      Item newItem = Item.fromJson({'id': 0, 'body': 'Some text'});
      expect(newItem.id, 0);
      expect(newItem.body, 'Some text');
    });
    test('Should map to json', () {
      Item newItem = Item.fromJson({'id': 0, 'body': 'Some text'});
      expect(newItem.toJson(), {'id': 0, 'body': 'Some text', 'completed': null});
    });
  });
}
