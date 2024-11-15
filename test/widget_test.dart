import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab6_quizzle/main.dart';

void main() {
  testWidgets('Quiz functionality test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( QuizzlerApp());

    // Verify that the first question is displayed.
    expect(find.text('Some cats are actually allergic to humans'), findsOneWidget);
    expect(find.text('You can lead a cow down stairs but not up stairs.'), findsNothing);

    // Tap the 'True' button and trigger a frame.
    await tester.tap(find.text('True'));
    await tester.pump();

    // Verify that the next question is displayed.
    expect(find.text('You can lead a cow down stairs but not up stairs.'), findsOneWidget);
    expect(find.text('Some cats are actually allergic to humans'), findsNothing);

    // Tap the 'False' button and trigger a frame.
    await tester.tap(find.text('False'));
    await tester.pump();

    // Verify that the next question is displayed again (if you have more questions).
    // Thay đổi câu hỏi tiếp theo nếu bạn có thêm câu hỏi trong danh sách.
    // expect(find.text('Next question text'), findsOneWidget);
  });
}