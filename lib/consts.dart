import 'package:client_list/models/client_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ClientModel> clientes = [];
late SharedPreferences prefs;
final List<FocusNode> nodes = List.generate(4, (_) => FocusNode());

void config() async {
  prefs = await SharedPreferences.getInstance();
}
