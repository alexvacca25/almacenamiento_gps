import 'package:almacenamiento_gps/domain/controller/controllocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaPuntos extends StatelessWidget {
  const ListaPuntos({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPuntos cp = Get.find();
    cp.consultaGral().then(
          (value) => null,
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Puntos Estrategicos'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cp.listagral?.length,
          itemBuilder: ((context, i) {
            return ListTile(
              leading: CircleAvatar(
                child: Text((i + 1).toString()),
              ),
              title: Text(cp.listagral![i]['detalle']),
              subtitle: Text(
                  "Lon:${cp.listagral![i]['lon']} Lat:${cp.listagral![i]['lat']}"),
              trailing: IconButton(
                  onPressed: () {
                    cp
                        .delPunto(cp.listagral![i]['id'])
                        .then((value) => cp.consultaGral());
                  },
                  icon: const Icon(Icons.delete)),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add');
          },
          child: const Icon(Icons.add)),
    );
  }
}
