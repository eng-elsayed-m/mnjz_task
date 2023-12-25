import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mnjz_task/src/features/products/presentation/bloc/bloc.dart';
import 'package:mnjz_task/src/features/products/products.dart';
import 'package:mnjz_task/src/src.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});

  initInjection();

  group('ProductListWidget', () {
    testWidgets('Renders product list', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          splitScreenMode: true,
          child: MaterialApp(
            home: BlocProvider<ProductsBloc>(
              create: (context) => sl<ProductsBloc>(),
              child: ProductsScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle(); // Wait for async operations to complete
      expect(find.text('109.95'), findsOneWidget);
    });

    testWidgets('Renders error message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProductsBloc>(
            create: (context) => sl<ProductsBloc>(),
            child: ProductsScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle(); // Wait for async operations to complete

      expect(find.text('Server Failure'), findsOneWidget);
    });
  });
}
