import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaPuntos extends StatelessWidget {
  const ListaPuntos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Puntos Estrategicos'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add');
          },
          child: const Icon(Icons.add)),
    );
  }
}
