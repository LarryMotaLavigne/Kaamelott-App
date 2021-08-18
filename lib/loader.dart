import 'dart:convert';

import 'package:K/variables.dart';
import 'package:flutter/services.dart';

class Loader {
  loadJson() async {
    String data = await rootBundle.loadString(Variables.assetsData);
    return json.decode(data);
  }
}
