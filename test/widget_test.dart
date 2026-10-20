import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/main.dart';

void main() {
  testWidgets('displays the heritage place information page', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const HeritagePlaceApp());
    await tester.pumpAndSettle();

    expect(find.text('Taj Mahal'), findsNWidgets(2));
    expect(find.textContaining('ivory-white marble mausoleum'), findsOneWidget);
    expect(find.text('4.8 / 5'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNWidgets(starCount));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
