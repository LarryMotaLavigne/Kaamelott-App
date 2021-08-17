import 'dart:convert';

import 'package:K/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loader {
  static final getData = [
    {
      'character': 'Arthur - Le Roi Burgonde',
      'episode': 'Livre II, 03 - Le Dialogue de Paix',
      'file': 'interprete.mp3',
      'title': 'Interprète',
      'icon': Icons.account_balance,
    },
  ];

  loadJson() async {
    String data = await rootBundle.loadString(Variables.assetsData);
    return json.decode(data);
  }
}
