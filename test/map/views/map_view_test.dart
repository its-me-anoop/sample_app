import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/map/views/map_view.dart';

void main() {
  testWidgets('map view has a title', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MapView(),
    ));

    expect(find.text("Map View"), findsOneWidget);
  });
}
