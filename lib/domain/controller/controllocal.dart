import 'package:almacenamiento_gps/data/services/peticionesdb.dart';
import 'package:get/get.dart';

class ControlPuntos extends GetxController {
  final Rxn<List<Map<String, dynamic>>> _listaPuntos =
      Rxn<List<Map<String, dynamic>>>();

  List<Map<String, dynamic>>? get listagral => _listaPuntos.value;

  Future<void> consultaGral() async {
    _listaPuntos.value = await PeticionesDB.listar();
  }

  Future<void> addPuntos(detalle, lon, lat) async {
    await PeticionesDB.adicionar(detalle, lon, lat)
        .then((value) => Get.showSnackbar(const GetSnackBar(
              title: 'Adicionar Punto',
              message: 'Punto Agregado',
              duration: Duration(seconds: 4),
            )))
        .catchError((e) => Get.showSnackbar(GetSnackBar(
              title: 'Adicionar Punto',
              message: e.toString(),
              duration: const Duration(seconds: 4),
            )));
  }

  Future<void> delPunto(id) async {
    await PeticionesDB.eliminar(id)
        .then((value) => Get.showSnackbar(const GetSnackBar(
              message: 'Punto Eliminado',
              duration: Duration(seconds: 4),
            )))
        .catchError((e) => null);
  }
}
