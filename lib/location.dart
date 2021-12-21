import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package: workmanager/workmanager.dart';


class Location {
  
  Future<void> main() async {
      Widgets FlutterBinding.ensureInitialized ();
 // 1. TO DO: Crea el controlador de notificaciones e inicializa el pluggin
      NotificationController notificationController =Get.put(NotificationController());
      await notificationController.initialize();
 // 2. TO D0:
// Crea el canal para notificaciones
      notificationController.createChannel(
           id: 'user-location',
           name: 'User Location',
       description: 'Mi ubicación...');
 // 4. TO DO:
 // Inicializa el Workmanager con el metodo creado y registra la tarea periodica
 await Workmanager ().initialize(updatePositionInBackground);
 await Workmanager ().registerPeriodicTask ("1", "locationPeriodicTask");
 runApp (const App());
}
// 3. TO DO:
// Crea un metodo que cree una tarea, obtenga la ubicación
// y la muestre en una notificación
void updatePosition InBackground () async {
 final manager = LocationManager ();
 final _manager = NotificationManager ();
 Workmanager ().executeTask ( (task, inputData) async {
  await _manager.initialize();
  final _channel _manager.createChannel (
    id: 'user-location',
    name: 'User Location',
    description: 'Mi ubicación ');
  final position = await manager.getCurrentLocation ();
  _manager.showNotification (
    channel: channel,
    title: 'Tu ubicación e: ',
    body: 'Latitud ${position.latitude} - Longitud ${position.longitude} ');
  return Future.value(true);
 });
 }
}
