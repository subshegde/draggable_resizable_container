import 'package:draggable_resizable_container/draggable_resizable_container_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test to ensure that DraggableResizableContainerSub behaves correctly
  testWidgets('DraggableResizableContainerSub widget test', (WidgetTester tester) async {
    // Define some test data
    final List<Widget> testItems = [
      const Text('Item 1'),
      const Text('Item 2'),
      const Text('Item 3'),
    ];

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DraggableResizableContainerSub(
            headerText: 'Test Header',
            items: testItems,
            initialHeight: 300,
            minHeight: 100,
            containerWidthFactor: 0.8,
            mode: 'light',  // Test light mode
            onItemPressed: (index) {
              // On item press, we can just print the index
              print('Item pressed: $index');
            },
          ),
        ),
      ),
    );

    // Verify that the header is displayed correctly
    expect(find.text('Test Header'), findsOneWidget);

    // Verify that the container is of the correct height
    final containerHeight = tester.getSize(find.byType(DraggableResizableContainerSub)).height;
    expect(containerHeight, 300); // Initially set to 300

    // Verify that the items are displayed correctly
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);

    // Verify that the action button is present in each item
    expect(find.byIcon(Icons.more_horiz), findsNWidgets(3));  // Should find the icon button 3 times

    // Simulate a drag to resize the container height
    await tester.drag(find.byType(DraggableResizableContainerSub), const Offset(0, 100)); // Drag downward
    await tester.pumpAndSettle(); // Let the animation complete

    // Verify that the container height has increased after drag
    final resizedHeight = tester.getSize(find.byType(DraggableResizableContainerSub)).height;
    expect(resizedHeight, greaterThan(containerHeight)); // Height should be greater than 300

    // Simulate an item press (you could listen to print or implement other checks here)
    await tester.tap(find.byIcon(Icons.more_horiz).first);
    await tester.pump();  // Pump to trigger any changes after tap

    // Check if the callback was invoked (we cannot directly check the print, so it is for testing purposes)
    // You might need to use a mock or a different approach in real testing.
  });
}
