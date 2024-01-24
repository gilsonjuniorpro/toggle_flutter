import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core_eng_apps/common/app_theme.dart';
import 'package:core_eng_apps/your_path/compass_tile_with_chevron.dart'; // Adjust the path accordingly

void main() {
  testWidgets('CompassTileWithChevron renders title and chevron icon', (WidgetTester tester) async {
    const title = 'Sample Title';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompassTileWithChevron(
            title: title,
          ),
        ),
        theme: AppTheme.lightTheme, // Provide a theme for context
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('CompassTileWithChevron renders custom navIcon when provided', (WidgetTester tester) async {
    const title = 'Custom Icon Tile';
    const customIcon = Icon(Icons.home);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompassTileWithChevron(
            title: title,
            navIcon: customIcon,
          ),
        ),
        theme: AppTheme.lightTheme,
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });

  testWidgets('CompassTileWithChevron applies padding correctly', (WidgetTester tester) async {
    const title = 'Padded Title';
    const paddingContent = 16.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompassTileWithChevron(
            title: title,
            paddingContent: paddingContent,
          ),
        ),
        theme: AppTheme.lightTheme,
      ),
    );

    final titleFinder = find.text(title);
    final titleWidget = tester.widget(titleFinder) as Text;
    final titlePadding = titleWidget.padding;
    expect(titlePadding.top, paddingContent);
    expect(titlePadding.bottom, paddingContent);
  });

  testWidgets('CompassTileWithChevron calls onPress function when tapped', (WidgetTester tester) async {
    var wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompassTileWithChevron(
            title: 'Tappable Tile',
            onPress: () => wasPressed = true,
          ),
        ),
        theme: AppTheme.lightTheme,
      ),
    );

    await tester.tap(find.byType(CompassTileWithChevron));
    await tester.pump(); // Flush microtasks

    expect(wasPressed, true);
  });
}
