import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:petleo_project/models/pet.dart';
import 'package:http/http.dart' as http;

class PetDataService extends ChangeNotifier {
  String userUrl =
      'https://run.mocky.io/v3/c6013d0f-5322-4049-b696-14fab0f724fd';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic>? users = [];

  Future<List<dynamic>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print('Error Fetching Datas');
    });

    if (result.statusCode == 200) {
      List<dynamic> data = json.decode(result.body);
      _isLoading = false;
      notifyListeners();
      users = data;
      return users;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
