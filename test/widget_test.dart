import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Add Riverpod import

import 'package:core_eng_apps/common/app_theme.dart';
import 'package:core_eng_apps/common/app_sizes.dart';
import 'package:core_eng_apps/features/orders/presentation/orders_page.dart';
import 'package:core_eng_apps/features/orders/domain/order_item_model.dart';
import 'package:core_eng_apps/common/widgets/compass_order_card.dart';
// Add other necessary imports

void main() {
  testWidgets('OrdersPage renders initial structure', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: OrdersPage(),
        theme: AppTheme.lightTheme,
      ),
    );

    // Overall structure
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2)); // Header and content
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(CompassOrderCard), findsNWidgets(3));

    // Header
    expect(find.text('Orders'), findsOneWidget);
    expect(find.byType(BasketButton), findsOneWidget);
    expect(find.byType(SegmentedButton), findsOneWidget);
    expect(find.text('Active orders'), findsOneWidget);
    expect(find.text('Past orders'), findsOneWidget);

    // Initial toggle state
    expect(find.text('2024'), findsNothing); // Not visible initially
  });

  testWidgets('OrdersPage toggles between active and past orders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: OrdersPage(),
        theme: AppTheme.lightTheme,
      ),
    );

    // Tap "Past orders" segment
    await tester.tap(find.text('Past orders'));
    await tester.pump();

    expect(find.text('2024'), findsOneWidget); // Visible after toggle
  });

  // ... more tests for specific interactions and edge cases
}