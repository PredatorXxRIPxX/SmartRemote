import 'dart:ffi';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';  
import 'dart:typed_data';

late BluetoothConnection connection;





void listinigData()async{
  if(connection.isConnected){
    connection.input!.listen((Uint8List data) {
      print('Data incoming: ${ascii.decode(data)}');
      String trame = ascii.decode(data);
      if(trame.contains('temperature')){
        
        temperature = trame.split(':')[1];
        
      }
      if(trame.contains('humidity')){
        humidity = trame.split(':')[1];
      }
      if(trame.contains('pompe3')){
        pompe3 = trame.split(':')[1];
      }
      if(trame.contains('pompe4')){
        pompe4 = trame.split(':')[1];
      }
      if(trame.contains('pompe5')){
        pompe5 = trame.split(':')[1];
      }
      if(trame.contains('cps')){
        cps = trame.split(':')[1];
      }
      if(trame.contains('capteur_water')){
        capteur_water = trame.split(':')[1];
      }
    }).onDone(() {
      print('Disconnected by remote request');
      connection.finish();
    });
  }
}


String temperature = "15.0";
String humidity = "50.0";
String pompe3 = "20.0";
String pompe4 = "18.0";
String pompe5 = "12.0";
String cps = "15.0";
String capteur_water = "50.0";
