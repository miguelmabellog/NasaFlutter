import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_button/custom_button.dart';

void main() {
  testWidgets('Muestra el texto correcto en el botón', (
    WidgetTester tester,
  ) async {
    // Arrange
    const buttonText = 'Presionar';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(text: buttonText, onPressed: () {}),
        ),
      ),
    );

    // Assert
    expect(find.text(buttonText), findsOneWidget);
  });

  testWidgets('Ejecuta el callback onPressed cuando se presiona', (
    WidgetTester tester,
  ) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Tap Me',
            onPressed: () => wasPressed = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tap Me'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });

  testWidgets('Botón deshabilitado no ejecuta onPressed', (
    WidgetTester tester,
  ) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Disabled',
            onPressed: null, // deshabilitado
          ),
        ),
      ),
    );

    await tester.tap(find.text('Disabled'));
    await tester.pump();

    expect(wasPressed, isFalse);
  });
}
