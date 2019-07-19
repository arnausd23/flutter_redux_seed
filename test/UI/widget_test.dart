import 'package:flutter/material.dart';
import 'package:flutter_redux_seed/UI/init.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Input adds item', (WidgetTester tester) async {
    await tester.pumpWidget(Init());

    expect(find.text('test'), findsNothing);
    await tester.enterText(find.byType(TextField), 'test');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.text('test'), findsOneWidget);
  });

//  testWidgets('Button removes all items', (WidgetTester tester) async {
//    await tester.pumpWidget(Init());
//
//    await tester.tap(find.byType(RaisedButton));
//    await tester.pump();
//
//    expect(find.text('test'), findsNothing);
//  });
}
