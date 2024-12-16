import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitch_designs_task/core/api_service/dio_service.dart';
import 'package:mitch_designs_task/core/observer/bloc_observer.dart';
import 'package:mitch_designs_task/core/service_locator/locator.dart'
    as locator;
import 'package:mitch_designs_task/features/products/presentation/ui_screen/view_products.dart';

void main() async {
  DioFinalHelper.init();
  await locator.init();
  Bloc.observer = MItchBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewProducts(),
    );
  }
}
