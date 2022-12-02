import 'package:almacenamiento_gps/ui/pages/add.dart';
import 'package:almacenamiento_gps/ui/pages/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puntos GPS',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const ListaPuntos(),
      routes: {
        '/lista': (context) => const ListaPuntos(),
        '/add': (context) => const AdicionarPunto()
      },
    );
  }
}
