import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/info_model.dart';

// Async Provider to fetch the JSON and convert it into CVModel
final cvProvider = FutureProvider<InfoModel>((ref) async {
  final String jsonString = await rootBundle.loadString('config/information.json');
  final Map<String, dynamic> jsonData = jsonDecode(jsonString);
  return InfoModel.fromJson(jsonData);
});
