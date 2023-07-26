import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SearchProvider with ChangeNotifier {
  final List<String> _brand = [];
  final List<String> _models = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> get brand {
    return [..._brand];
  }

  List<String> get models {
    return [..._models];
  }

  void getSearchResults(String body) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await http.post(
        Uri.parse(
            'https://dev2be.oruphones.com/api/v1/global/assignment/searchModel'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'searchModel': body,
        }),
      );
      log(response.body);
      var extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      for (int i = 0; i < extractedData['makes'].length; i++) {
        _brand.add(extractedData['makes'][i]);
      }
      for (int i = 0; i < extractedData['models'].length; i++) {
        _models.add(extractedData['models'][i]);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      log(e.toString());
    }
  }
}
