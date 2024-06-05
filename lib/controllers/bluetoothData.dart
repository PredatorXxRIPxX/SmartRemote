import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothData with ChangeNotifier {
  late BluetoothConnection connection;
  String temperature = "15.0";
  String humidity = "50.0";
  String pompe1 = "20";
  String pompe2 = "18";
  String pompe3 = "20.0";
  String pompe4 = "18.0";
  String pompe5 = "12.0";
  String cps = "15.0";
  String capteur_water = "50.0";
  String extracteur = "0";

  int pompe1switch = 0;
  int pompe2switch = 0;
  int pompe3switch = 0;
  int pompe4switch = 0;
  int pompe5switch = 0;
  int extracteurswitch = 0;

  void sendCommand(String key, int value) {
    if (connection.isConnected) {
      connection.output.add(utf8.encode('$key:$value\n'));
      connection.output.allSent.then((value) {
        print('Data sent');
      });
    }
  }

  void changeSwitchValue(String key,int value){
    if(key == 'pompe1'){
      pompe1switch = value;
    }
    if(key == 'pompe2'){
      pompe2switch = value;
    }
    if(key == 'pompe3'){
      pompe3switch = value;
    }
    if(key == 'pompe4'){
      pompe4switch = value;
    }
    if(key == 'pompe5'){
      pompe5switch = value;
    }
    if(key == 'extracteur'){
      extracteurswitch = value;
    }
    sendCommand(key, value);
    notifyListeners();
  }

  get  pompe1switchFun => pompe1switch;
  get  pompe2switchFun => pompe2switch;
  get  pompe3switchFun => pompe3switch;
  get  pompe4switchFun => pompe4switch;
  get  pompe5switchFun => pompe5switch;
  get  extracteurswitchFun => extracteurswitch;


  String get _extracteur => extracteur;
  String get _pompe1 => pompe1;
  String get _pompe2 => pompe2;
  String get _temperature => temperature;
  String get _humidity => humidity;
  String get _pompe3 => pompe3;
  String get _pompe4 => pompe4;
  String get _pompe5 => pompe5;
  String get _cps => cps;
  String get _capteur_water => capteur_water;

  void updateData(String key, String value) {
    if (key == 'temperature') {
      temperature = value;
    }
    if (key == 'pompe1') {
      pompe1 = value;
    }
    if (key == 'pompe2') {
      pompe2 = value;
    }
    if (key == 'extracteur') {
      extracteur = value;
    }
    if (key == 'humidite') {
      humidity = value;
    }
    if (key == 'pompe3') {
      pompe3 = value;
    }
    if (key == 'pompe4') {
      pompe4 = value;
    }
    if (key == 'pompe5') {
      pompe5 = value;
    }
    if (key == 'cps') {
      cps = value;
    }
    if (key == 'capteur_water') {
      capteur_water = value;
    }
    notifyListeners();
  }

  void listinigData() async {
    if (connection.isConnected) {
      connection.input!.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        String trame = ascii.decode(data);
        List<String> trameList = trame.split('|');
        for (String line in trameList) {
          line = line.trim();
          print("line:$line");
          if (line.contains(":")) {
            List<String> keyValues = line.split(':');
            if (keyValues.length == 2) {
              String key = keyValues[0].trim();
              String value = keyValues[1].trim();
              print('key: $key, value: $value');
              updateData(key, value);
            }
          }
        }
      }).onDone(() {
        print('Disconnected by remote request');
        connection.finish();
        notifyListeners();
      });
    }
  }
}
