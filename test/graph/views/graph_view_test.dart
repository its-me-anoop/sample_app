import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/graph/views/graph_view.dart';

void main() {
  group("graphView", () {
    testWidgets('graph view has a title', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GraphView(),
      ));

      expect(find.text("Graph View"), findsOneWidget);
    });
  });
}
