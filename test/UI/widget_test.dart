import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_redux_seed/main.dart';

void main() {
  testWidgets('Input adds item', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('test'), findsNothing);
    await tester.enterText(find.byType(TextField), 'test');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.text('test'), findsOneWidget);
  });
}
