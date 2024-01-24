import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core_eng_apps/common/app_theme.dart';
import 'package:core_eng_apps/features/orders/domain/order_item_model.dart';
import 'package:core_eng_apps/your_path/compass_order_card.dart'; // Adjust the path

void main() {
  testWidgets('CompassOrderCard renders card structure and content', (WidgetTester tester) async {
    const orderItem = OrderItemModel(
      date: '2024-01-25',
      pickupTime: '10:30 AM',
      listOfItems: ['Item 1', 'Item 2'],
      info: 'Additional info',
      message: 'Order ready for pickup!',
      buttonText: 'Access QR Code',
      isQRCodeExpired: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CompassOrderCard(orderItem: orderItem),
        ),
        theme: AppTheme.lightTheme, // Provide a theme for context
      ),
    );

    // Card structure
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget); // Inner padding
    expect(find.byType(Column), findsOneWidget);

    // Content
    expect(find.text('2024-01-25'), findsOneWidget);
    expect(find.text('10:30 AM'), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Additional info'), findsOneWidget);
    expect(find.text('Order ready for pickup!'), findsOneWidget);
    expect(find.text('Access QR Code'), findsOneWidget);
    expect(find.byIcon(Icons.help), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  // ... more tests for specific scenarios and interactions
}