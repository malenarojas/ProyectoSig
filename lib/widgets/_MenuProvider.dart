import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


Future<List> loadJson() async {
  String items = await rootBundle.loadString("data/moteles_opt.json");
  var jsonResult = json.decode(items);
  return jsonResult;
}