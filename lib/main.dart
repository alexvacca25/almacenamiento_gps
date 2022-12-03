import 'package:almacenamiento_gps/domain/controller/controlgps.dart';
import 'package:almacenamiento_gps/domain/controller/controllocal.dart';
import 'package:almacenamiento_gps/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlGps());
  Get.put(ControlPuntos());
  runApp(const App());
}
