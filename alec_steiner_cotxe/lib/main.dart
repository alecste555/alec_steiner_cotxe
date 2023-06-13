import 'package:flutter/material.dart';
import 'gasto_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GastoController controller = GastoController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GastoListPage(controller: controller),
    );
  }
}