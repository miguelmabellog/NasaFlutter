import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';

void main() {
  testWidgets('CustomText show text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: CustomText('Texto de prueba'))),
    );

    expect(find.byType(CustomText), findsOneWidget);

    expect(find.text('Texto de prueba'), findsOneWidget);
  });
}
